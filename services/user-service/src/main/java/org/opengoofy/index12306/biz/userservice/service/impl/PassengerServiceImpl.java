/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.opengoofy.index12306.biz.userservice.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.IdcardUtil;
import cn.hutool.core.util.PhoneUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.opengoofy.index12306.biz.userservice.common.enums.VerifyStatusEnum;
import org.opengoofy.index12306.biz.userservice.dao.entity.PassengerDO;
import org.opengoofy.index12306.biz.userservice.dao.mapper.PassengerMapper;
import org.opengoofy.index12306.biz.userservice.dto.req.PassengerRemoveReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.req.PassengerReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.PassengerActualRespDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.PassengerRespDTO;
import org.opengoofy.index12306.biz.userservice.service.PassengerService;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.common.toolkit.BeanUtil;
import org.opengoofy.index12306.framework.starter.convention.exception.ClientException;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.opengoofy.index12306.framework.starter.idempotent.annotation.Idempotent;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentSceneEnum;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentTypeEnum;
import org.opengoofy.index12306.frameworks.starter.user.core.UserContext;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static org.opengoofy.index12306.biz.userservice.common.constant.RedisKeyConstant.USER_PASSENGER_LIST;

/**
 * 乘车人接口实现层
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PassengerServiceImpl implements PassengerService {

    private final PassengerMapper passengerMapper;
    private final DistributedCache distributedCache;

    @Override
    public List<PassengerRespDTO> listPassengerQueryByUsername(String username) {
        String actualUserPassengerListStr = getActualUserPassengerListStr(username);
        return Optional.ofNullable(actualUserPassengerListStr)
                .map(each -> JSON.parseArray(each, PassengerDO.class))
                .map(each -> BeanUtil.convert(each, PassengerRespDTO.class))
                .orElse(null);
    }

    private String getActualUserPassengerListStr(String username) {
        return distributedCache.safeGet(
                USER_PASSENGER_LIST + username,
                String.class,
                () -> {
                    LambdaQueryWrapper<PassengerDO> queryWrapper = Wrappers.lambdaQuery(PassengerDO.class)
                            .eq(PassengerDO::getUsername, username);
                    List<PassengerDO> passengerDOList = passengerMapper.selectList(queryWrapper);
                    return CollUtil.isNotEmpty(passengerDOList) ? JSON.toJSONString(passengerDOList) : null;
                },
                1,
                TimeUnit.DAYS
        );
    }

    @Override
    public List<PassengerActualRespDTO> listPassengerQueryByIds(String username, List<Long> ids) {
        String actualUserPassengerListStr = getActualUserPassengerListStr(username);
        if (StrUtil.isEmpty(actualUserPassengerListStr)) {
            return null;
        }
        return JSON.parseArray(actualUserPassengerListStr, PassengerDO.class)
                .stream().filter(passengerDO -> ids.contains(passengerDO.getId()))
                .map(each -> BeanUtil.convert(each, PassengerActualRespDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public void savePassenger(PassengerReqDTO requestParam) {
        verifyPassenger(requestParam);
        String username = UserContext.getUsername();
        try {
            PassengerDO passengerDO = BeanUtil.convert(requestParam, PassengerDO.class);
            passengerDO.setUsername(username);
            passengerDO.setCreateDate(new Date());
            passengerDO.setVerifyStatus(VerifyStatusEnum.REVIEWED.getCode());
            int inserted = passengerMapper.insert(passengerDO);
            if (!SqlHelper.retBool(inserted)) {
                throw new ServiceException(String.format("[%s] 新增乘车人失败", username));
            }
        } catch (Exception ex) {
            if (ex instanceof ServiceException) {
                log.error("{}，请求参数：{}", ex.getMessage(), JSON.toJSONString(requestParam));
            } else {
                log.error("[{}] 新增乘车人失败，请求参数：{}", username, JSON.toJSONString(requestParam), ex);
            }
            throw ex;
        }
        delUserPassengerCache(username);
    }

    @Override
    public void updatePassenger(PassengerReqDTO requestParam) {
        verifyPassenger(requestParam);
        String username = UserContext.getUsername();
        try {
            PassengerDO passengerDO = BeanUtil.convert(requestParam, PassengerDO.class);
            passengerDO.setUsername(username);
            LambdaUpdateWrapper<PassengerDO> updateWrapper = Wrappers.lambdaUpdate(PassengerDO.class)
                    .eq(PassengerDO::getUsername, username)
                    .eq(PassengerDO::getId, requestParam.getId());
            int updated = passengerMapper.update(passengerDO, updateWrapper);
            if (!SqlHelper.retBool(updated)) {
                throw new ServiceException(String.format("[%s] 修改乘车人失败", username));
            }
        } catch (Exception ex) {
            if (ex instanceof ServiceException) {
                log.error("{}，请求参数：{}", ex.getMessage(), JSON.toJSONString(requestParam));
            } else {
                log.error("[{}] 修改乘车人失败，请求参数：{}", username, JSON.toJSONString(requestParam), ex);
            }
            throw ex;
        }
        delUserPassengerCache(username);
    }

    @Idempotent(
            uniqueKeyPrefix = "index12306-user:lock_passenger-alter:",
            key = "T(org.opengoofy.index12306.frameworks.starter.user.core.UserContext).getUsername()",
            type = IdempotentTypeEnum.SPEL,
            scene = IdempotentSceneEnum.RESTAPI,
            message = "正在移除乘车人，请稍后再试..."
    )
    @Override
    public void removePassenger(PassengerRemoveReqDTO requestParam) {
        String username = UserContext.getUsername();
        PassengerDO passengerDO = selectPassenger(username, requestParam.getId());
        if (Objects.isNull(passengerDO)) {
            throw new ClientException("乘车人数据不存在");
        }
        try {
            LambdaUpdateWrapper<PassengerDO> deleteWrapper = Wrappers.lambdaUpdate(PassengerDO.class)
                    .eq(PassengerDO::getUsername, username)
                    .eq(PassengerDO::getId, requestParam.getId());
            // 逻辑删除，修改数据库表记录 del_flag
            int deleted = passengerMapper.delete(deleteWrapper);
            if (!SqlHelper.retBool(deleted)) {
                throw new ServiceException(String.format("[%s] 删除乘车人失败", username));
            }
        } catch (Exception ex) {
            if (ex instanceof ServiceException) {
                log.error("{}，请求参数：{}", ex.getMessage(), JSON.toJSONString(requestParam));
            } else {
                log.error("[{}] 删除乘车人失败，请求参数：{}", username, JSON.toJSONString(requestParam), ex);
            }
            throw ex;
        }
        delUserPassengerCache(username);
    }

    private PassengerDO selectPassenger(String username, String passengerId) {
        LambdaQueryWrapper<PassengerDO> queryWrapper = Wrappers.lambdaQuery(PassengerDO.class)
                .eq(PassengerDO::getUsername, username)
                .eq(PassengerDO::getId, passengerId);
        return passengerMapper.selectOne(queryWrapper);
    }

    private void delUserPassengerCache(String username) {
        distributedCache.delete(USER_PASSENGER_LIST + username);
    }

    private void verifyPassenger(PassengerReqDTO requestParam) {
        int length = requestParam.getRealName().length();
        if (!(length >= 2 && length <= 16)) {
            throw new ClientException("乘车人名称请设置2-16位的长度");
        }
        if (!IdcardUtil.isValidCard(requestParam.getIdCard())) {
            throw new ClientException("乘车人证件号错误");
        }
        if (!PhoneUtil.isMobile(requestParam.getPhone())) {
            throw new ClientException("乘车人手机号错误");
        }
    }
}
