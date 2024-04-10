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

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserDO;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserDeletionDO;
import org.opengoofy.index12306.biz.userservice.dao.entity.UserMailDO;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserDeletionMapper;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserMailMapper;
import org.opengoofy.index12306.biz.userservice.dao.mapper.UserMapper;
import org.opengoofy.index12306.biz.userservice.dto.req.UserUpdateReqDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.UserQueryActualRespDTO;
import org.opengoofy.index12306.biz.userservice.dto.resp.UserQueryRespDTO;
import org.opengoofy.index12306.biz.userservice.service.UserService;
import org.opengoofy.index12306.framework.starter.common.toolkit.BeanUtil;
import org.opengoofy.index12306.framework.starter.convention.exception.ClientException;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.Optional;

/**
 * 用户信息接口实现层
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final UserDeletionMapper userDeletionMapper;
    private final UserMailMapper userMailMapper;

    @Override
    public UserQueryRespDTO queryUserByUserId(String userId) {
        LambdaQueryWrapper<UserDO> queryWrapper = Wrappers.lambdaQuery(UserDO.class)
                .eq(UserDO::getId, userId);
        UserDO userDO = userMapper.selectOne(queryWrapper);
        if (userDO == null) {
            throw new ClientException("用户不存在，请检查用户ID是否正确");
        }
        return BeanUtil.convert(userDO, UserQueryRespDTO.class);
    }

    @Override
    public UserQueryRespDTO queryUserByUsername(String username) {
        LambdaQueryWrapper<UserDO> queryWrapper = Wrappers.lambdaQuery(UserDO.class)
                .eq(UserDO::getUsername, username);
        UserDO userDO = userMapper.selectOne(queryWrapper);
        if (userDO == null) {
            throw new ClientException("用户不存在，请检查用户名是否正确");
        }
        return BeanUtil.convert(userDO, UserQueryRespDTO.class);
    }

    @Override
    public UserQueryActualRespDTO queryActualUserByUsername(String username) {
        return BeanUtil.convert(queryUserByUsername(username), UserQueryActualRespDTO.class);
    }

    @Override
    public Integer queryUserDeletionNum(Integer idType, String idCard) {
        LambdaQueryWrapper<UserDeletionDO> queryWrapper = Wrappers.lambdaQuery(UserDeletionDO.class)
                .eq(UserDeletionDO::getIdType, idType)
                .eq(UserDeletionDO::getIdCard, idCard);
        // TODO 此处应该先查缓存
        Long deletionCount = userDeletionMapper.selectCount(queryWrapper);
        return Optional.ofNullable(deletionCount).map(Long::intValue).orElse(0);
    }

    @Override
    public void update(UserUpdateReqDTO requestParam) {
        UserQueryRespDTO userQueryRespDTO = queryUserByUsername(requestParam.getUsername());
        UserDO userDO = BeanUtil.convert(requestParam, UserDO.class);
        LambdaUpdateWrapper<UserDO> userUpdateWrapper = Wrappers.lambdaUpdate(UserDO.class)
                .eq(UserDO::getUsername, requestParam.getUsername());
        userMapper.update(userDO, userUpdateWrapper);
        if (StrUtil.isNotBlank(requestParam.getMail()) && !Objects.equals(requestParam.getMail(), userQueryRespDTO.getMail())) {
            LambdaUpdateWrapper<UserMailDO> updateWrapper = Wrappers.lambdaUpdate(UserMailDO.class)
                    .eq(UserMailDO::getMail, userQueryRespDTO.getMail());
            userMailMapper.delete(updateWrapper);
            UserMailDO userMailDO = UserMailDO.builder()
                    .mail(requestParam.getMail())
                    .username(requestParam.getUsername())
                    .build();
            userMailMapper.insert(userMailDO);
        }
    }
}
