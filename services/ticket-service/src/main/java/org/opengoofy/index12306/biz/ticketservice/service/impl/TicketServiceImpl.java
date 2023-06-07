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

package org.opengoofy.index12306.biz.ticketservice.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationPriceDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationRelationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationPriceMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationRelationMapper;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.BulletTrainDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.req.TicketPageQueryReqDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TicketPageQueryRespDTO;
import org.opengoofy.index12306.biz.ticketservice.service.TicketService;
import org.opengoofy.index12306.biz.ticketservice.toolkit.DateUtil;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.convention.page.PageResponse;
import org.opengoofy.index12306.framework.starter.database.toolkit.PageUtil;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_STATION_REMAINING_TICKET;

/**
 * 车票接口实现
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final TrainMapper trainMapper;
    private final TrainStationRelationMapper trainStationRelationMapper;
    private final TrainStationPriceMapper trainStationPriceMapper;
    private final DistributedCache distributedCache;

    @Override
    public PageResponse<TicketPageQueryRespDTO> pageListTicketQuery(TicketPageQueryReqDTO requestParam) {
        // TODO 责任链模式 验证城市名称是否存在、不存在加载缓存等等
        LambdaQueryWrapper<TrainStationRelationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationRelationDO.class)
                .eq(TrainStationRelationDO::getStartRegion, requestParam.getFromStation())
                .eq(TrainStationRelationDO::getEndRegion, requestParam.getToStation());
        IPage<TrainStationRelationDO> trainStationRelationPage = trainStationRelationMapper.selectPage(PageUtil.convert(requestParam), queryWrapper);
        return PageUtil.convert(trainStationRelationPage, each -> {
            LambdaQueryWrapper<TrainDO> trainQueryWrapper = Wrappers.lambdaQuery(TrainDO.class).eq(TrainDO::getId, each.getTrainId());
            TrainDO trainDO = trainMapper.selectOne(trainQueryWrapper);
            TicketPageQueryRespDTO result = new TicketPageQueryRespDTO();
            result.setTrainNumber(trainDO.getTrainNumber());
            result.setDepartureTime(each.getDepartureTime());
            result.setArrivalTime(each.getArrivalTime());
            result.setDuration(DateUtil.calculateHourDifference(each.getDepartureTime(), each.getArrivalTime()));
            result.setDeparture(each.getDeparture());
            result.setArrival(each.getArrival());
            result.setDepartureFlag(each.getDepartureFlag());
            result.setArrivalFlag(each.getArrivalFlag());
            if (Objects.equals(trainDO.getTrainType(), 0)) {
                BulletTrainDTO bulletTrainDTO = new BulletTrainDTO();
                LambdaQueryWrapper<TrainStationPriceDO> trainStationPriceQueryWrapper = Wrappers.lambdaQuery(TrainStationPriceDO.class)
                        .eq(TrainStationPriceDO::getDeparture, each.getDeparture())
                        .eq(TrainStationPriceDO::getArrival, each.getArrival())
                        .eq(TrainStationPriceDO::getTrainId, each.getTrainId());
                List<TrainStationPriceDO> trainStationPriceDOList = trainStationPriceMapper.selectList(trainStationPriceQueryWrapper);
                StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
                trainStationPriceDOList.forEach(item -> {
                    String keySuffix = StrUtil.join("_", each.getTrainId(), item.getDeparture(), item.getArrival());
                    switch (item.getSeatType()) {
                        case 0:
                            String businessClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "0");
                            bulletTrainDTO.setBusinessClassQuantity(Integer.parseInt(businessClassQuantity));
                            bulletTrainDTO.setBusinessClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            bulletTrainDTO.setBusinessClassCandidate(false);
                            break;
                        case 1:
                            String firstClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "1");
                            bulletTrainDTO.setFirstClassQuantity(Integer.parseInt(firstClassQuantity));
                            bulletTrainDTO.setFirstClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            bulletTrainDTO.setFirstClassCandidate(false);
                            break;
                        case 2:
                            String secondClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "2");
                            bulletTrainDTO.setSecondClassQuantity(Integer.parseInt(secondClassQuantity));
                            bulletTrainDTO.setSecondClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            bulletTrainDTO.setSecondClassCandidate(false);
                            break;
                        default:
                            break;
                    }
                });
                result.setBulletTrain(bulletTrainDTO);
            }
            return result;
        });
    }
}
