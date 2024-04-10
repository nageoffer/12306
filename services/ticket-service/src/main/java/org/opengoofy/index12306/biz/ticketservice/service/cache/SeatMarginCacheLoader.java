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

package org.opengoofy.index12306.biz.ticketservice.service.cache;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.common.enums.SeatStatusEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.SeatDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.SeatMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainMapper;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.RouteDTO;
import org.opengoofy.index12306.biz.ticketservice.service.TrainStationService;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.cache.toolkit.CacheUtil;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.Index12306Constant.ADVANCE_TICKET_DAY;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.*;

/**
 * 座位余量缓存加载
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
@RequiredArgsConstructor
public class SeatMarginCacheLoader {

    private final TrainMapper trainMapper;
    private final SeatMapper seatMapper;
    private final DistributedCache distributedCache;
    private final RedissonClient redissonClient;
    private final TrainStationService trainStationService;

    public Map<String, String> load(String trainId, String seatType, String departure, String arrival) {
        Map<String, Map<String, String>> trainStationRemainingTicketMaps = new LinkedHashMap<>();
        String keySuffix = CacheUtil.buildKey(trainId, departure, arrival);
        // 缓存带来的分布式互斥锁还有哪些优化项？详情查看：https://nageoffer.com/12306/question
        RLock lock = redissonClient.getLock(String.format(LOCK_SAFE_LOAD_SEAT_MARGIN_GET, keySuffix));
        lock.lock();
        try {
            StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
            Object quantityObj = stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, seatType);
            if (CacheUtil.isNullOrBlank(quantityObj)) {
                TrainDO trainDO = distributedCache.safeGet(
                        TRAIN_INFO + trainId,
                        TrainDO.class,
                        () -> trainMapper.selectById(trainId),
                        ADVANCE_TICKET_DAY,
                        TimeUnit.DAYS
                );
                List<RouteDTO> routeDTOList = trainStationService.listTrainStationRoute(trainId, trainDO.getStartStation(), trainDO.getEndStation());
                if (CollUtil.isNotEmpty(routeDTOList)) {
                    switch (trainDO.getTrainType()) {
                        // TODO 通过已有列车类型座位枚举重构
                        case 0 -> {
                            for (RouteDTO each : routeDTOList) {
                                Map<String, String> trainStationRemainingTicket = new LinkedHashMap<>();
                                trainStationRemainingTicket.put("0", selectSeatMargin(trainId, 0, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("1", selectSeatMargin(trainId, 1, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("2", selectSeatMargin(trainId, 2, each.getStartStation(), each.getEndStation()));
                                String actualKeySuffix = CacheUtil.buildKey(trainId, each.getStartStation(), each.getEndStation());
                                trainStationRemainingTicketMaps.put(TRAIN_STATION_REMAINING_TICKET + actualKeySuffix, trainStationRemainingTicket);
                            }
                        }
                        case 1 -> {
                            for (RouteDTO each : routeDTOList) {
                                Map<String, String> trainStationRemainingTicket = new LinkedHashMap<>();
                                trainStationRemainingTicket.put("3", selectSeatMargin(trainId, 3, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("4", selectSeatMargin(trainId, 4, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("5", selectSeatMargin(trainId, 5, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("13", selectSeatMargin(trainId, 13, each.getStartStation(), each.getEndStation()));
                                String actualKeySuffix = CacheUtil.buildKey(trainId, each.getStartStation(), each.getEndStation());
                                trainStationRemainingTicketMaps.put(TRAIN_STATION_REMAINING_TICKET + actualKeySuffix, trainStationRemainingTicket);
                            }
                        }
                        case 2 -> {
                            for (RouteDTO each : routeDTOList) {
                                Map<String, String> trainStationRemainingTicket = new LinkedHashMap<>();
                                trainStationRemainingTicket.put("6", selectSeatMargin(trainId, 6, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("7", selectSeatMargin(trainId, 7, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("8", selectSeatMargin(trainId, 8, each.getStartStation(), each.getEndStation()));
                                trainStationRemainingTicket.put("13", selectSeatMargin(trainId, 13, each.getStartStation(), each.getEndStation()));
                                String actualKeySuffix = CacheUtil.buildKey(trainId, each.getStartStation(), each.getEndStation());
                                trainStationRemainingTicketMaps.put(TRAIN_STATION_REMAINING_TICKET + actualKeySuffix, trainStationRemainingTicket);
                            }
                        }
                    }
                } else {
                    Map<String, String> trainStationRemainingTicket = new LinkedHashMap<>();
                    VehicleTypeEnum.findSeatTypesByCode(trainDO.getTrainType())
                            .forEach(each -> trainStationRemainingTicket.put(String.valueOf(each), "0"));
                    trainStationRemainingTicketMaps.put(TRAIN_STATION_REMAINING_TICKET + keySuffix, trainStationRemainingTicket);
                }
                // TODO LUA 脚本执行
                trainStationRemainingTicketMaps.forEach((cacheKey, cacheMap) -> stringRedisTemplate.opsForHash().putAll(cacheKey, cacheMap));
            }
        } finally {
            lock.unlock();
        }
        return Optional.ofNullable(trainStationRemainingTicketMaps.get(TRAIN_STATION_REMAINING_TICKET + keySuffix))
                .orElse(new LinkedHashMap<>());
    }

    private String selectSeatMargin(String trainId, Integer type, String departure, String arrival) {
        LambdaQueryWrapper<SeatDO> queryWrapper = Wrappers.lambdaQuery(SeatDO.class)
                .eq(SeatDO::getTrainId, trainId)
                .eq(SeatDO::getSeatType, type)
                .eq(SeatDO::getSeatStatus, SeatStatusEnum.AVAILABLE.getCode())
                .eq(SeatDO::getStartStation, departure)
                .eq(SeatDO::getEndStation, arrival);
        return Optional.ofNullable(seatMapper.selectCount(queryWrapper))
                .map(String::valueOf)
                .orElse("0");
    }
}
