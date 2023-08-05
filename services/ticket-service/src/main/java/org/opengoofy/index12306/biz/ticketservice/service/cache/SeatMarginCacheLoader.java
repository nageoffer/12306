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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.SeatDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.SeatMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainMapper;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.cache.toolkit.CacheUtil;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.Index12306Constant.ADVANCE_TICKET_DAY;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_STATION_REMAINING_TICKET;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.LOCK_SAFE_LOAD_SEAT_MARGIN_GET;

/**
 * 座位余量缓存加载
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
@RequiredArgsConstructor
public class SeatMarginCacheLoader {

    private final TrainMapper trainMapper;
    private final SeatMapper seatMapper;
    private final DistributedCache distributedCache;
    private final RedissonClient redissonClient;

    public Map<String, String> load(String trainId, String seatType, String departure, String arrival) {
        Map<String, String> trainStationRemainingTicket = new HashMap<>();
        String keySuffix = CacheUtil.buildKey(trainId, departure, arrival);
        RLock lock = redissonClient.getLock(String.format(LOCK_SAFE_LOAD_SEAT_MARGIN_GET, keySuffix));
        lock.lock();
        try {
            StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
            Object quantityObj = stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, seatType);
            if (CacheUtil.isNullOrBlank(quantityObj)) {
                TrainDO trainDO = trainMapper.selectById(trainId);
                switch (trainDO.getTrainType()) {
                    case 0 -> {
                        trainStationRemainingTicket.put("0", selectSeatMargin(trainId, 0, departure, arrival));
                        trainStationRemainingTicket.put("1", selectSeatMargin(trainId, 1, departure, arrival));
                        trainStationRemainingTicket.put("2", selectSeatMargin(trainId, 2, departure, arrival));
                    }
                    case 1 -> {
                        trainStationRemainingTicket.put("3", selectSeatMargin(trainId, 3, departure, arrival));
                        trainStationRemainingTicket.put("4", selectSeatMargin(trainId, 4, departure, arrival));
                        trainStationRemainingTicket.put("5", selectSeatMargin(trainId, 5, departure, arrival));
                        trainStationRemainingTicket.put("13", selectSeatMargin(trainId, 13, departure, arrival));
                    }
                    case 2 -> {
                        trainStationRemainingTicket.put("6", selectSeatMargin(trainId, 6, departure, arrival));
                        trainStationRemainingTicket.put("7", selectSeatMargin(trainId, 7, departure, arrival));
                        trainStationRemainingTicket.put("8", selectSeatMargin(trainId, 8, departure, arrival));
                        trainStationRemainingTicket.put("13", selectSeatMargin(trainId, 13, departure, arrival));
                    }
                }
                String buildCacheKey = TRAIN_STATION_REMAINING_TICKET + keySuffix;
                stringRedisTemplate.opsForHash().putAll(buildCacheKey, trainStationRemainingTicket);
                stringRedisTemplate.expire(buildCacheKey, ADVANCE_TICKET_DAY, TimeUnit.DAYS);
            }
        } finally {
            lock.unlock();
        }
        return trainStationRemainingTicket;
    }

    private String selectSeatMargin(String trainId, Integer type, String departure, String arrival) {
        LambdaQueryWrapper<SeatDO> queryWrapper = Wrappers.lambdaQuery(SeatDO.class)
                .eq(SeatDO::getTrainId, trainId)
                .eq(SeatDO::getSeatType, type)
                .eq(SeatDO::getStartStation, departure)
                .eq(SeatDO::getEndStation, arrival);
        return Optional.ofNullable(seatMapper.selectCount(queryWrapper)).map(String::valueOf).orElse("0");
    }
}
