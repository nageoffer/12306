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

package org.opengoofy.index12306.biz.ticketservice.canal;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.common.enums.CanalExecuteStrategyMarkEnum;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.RouteDTO;
import org.opengoofy.index12306.biz.ticketservice.mq.event.CanalBinlogEvent;
import org.opengoofy.index12306.biz.ticketservice.remote.TicketOrderRemoteService;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.TicketOrderDetailRespDTO;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.TicketOrderPassengerDetailRespDTO;
import org.opengoofy.index12306.biz.ticketservice.service.TrainStationService;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.convention.result.Result;
import org.opengoofy.index12306.framework.starter.designpattern.strategy.AbstractExecuteStrategy;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TICKET_AVAILABILITY_TOKEN_BUCKET;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_STATION_REMAINING_TICKET;

/**
 * 订单关闭或取消后置处理组件
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
@RequiredArgsConstructor
public class OrderCloseCacheAndTokenUpdateHandler implements AbstractExecuteStrategy<CanalBinlogEvent, Void> {

    private final TicketOrderRemoteService ticketOrderRemoteService;
    private final DistributedCache distributedCache;
    private final TrainStationService trainStationService;

    @Override
    public void execute(CanalBinlogEvent message) {
        List<Map<String, Object>> messageDataList = message.getData().stream()
                .filter(each -> each.get("status") != null)
                .filter(each -> Objects.equals(each.get("status"), "30"))
                .toList();
        if (CollUtil.isEmpty(messageDataList)) {
            return;
        }
        StringRedisTemplate instance = (StringRedisTemplate) distributedCache.getInstance();
        // TODO Lua 脚本执行该流程
        for (Map<String, Object> each : messageDataList) {
            Result<TicketOrderDetailRespDTO> orderDetailResult = ticketOrderRemoteService.queryTicketOrderByOrderSn(each.get("order_sn").toString());
            TicketOrderDetailRespDTO orderDetailResultData = orderDetailResult.getData();
            if (orderDetailResult.isSuccess() && orderDetailResultData != null) {
                List<TicketOrderPassengerDetailRespDTO> passengerDetails = orderDetailResultData.getPassengerDetails();
                String ticketAvailabilityTokenBucketKey = TICKET_AVAILABILITY_TOKEN_BUCKET + orderDetailResultData.getTrainId();
                for (TicketOrderPassengerDetailRespDTO item : passengerDetails) {
                    List<RouteDTO> routeDTOList = trainStationService.listTrainStationRoute(String.valueOf(orderDetailResultData.getTrainId()), orderDetailResultData.getDeparture(), orderDetailResultData.getArrival());
                    for (RouteDTO route : routeDTOList) {
                        String trainStationRemainingTicketKey = TRAIN_STATION_REMAINING_TICKET + StrUtil.join("_", orderDetailResultData.getTrainId(), route.getStartStation(), route.getEndStation());
                        instance.opsForHash().increment(trainStationRemainingTicketKey, String.valueOf(item.getSeatType()), 1);
                        String tokenBucketHashKey = StrUtil.join("_", route.getStartStation(), route.getEndStation(), item.getSeatType());
                        instance.opsForHash().increment(ticketAvailabilityTokenBucketKey, tokenBucketHashKey, 1);
                    }
                }
            }
        }
    }

    @Override
    public String mark() {
        return CanalExecuteStrategyMarkEnum.T_ORDER.getActualTable();
    }

    @Override
    public String patternMatchMark() {
        return CanalExecuteStrategyMarkEnum.T_ORDER.getPatternMatchTable();
    }
}
