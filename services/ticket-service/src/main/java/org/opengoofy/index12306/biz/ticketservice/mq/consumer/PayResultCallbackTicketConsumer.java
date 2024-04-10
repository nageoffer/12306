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

package org.opengoofy.index12306.biz.ticketservice.mq.consumer;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.opengoofy.index12306.biz.ticketservice.common.constant.TicketRocketMQConstant;
import org.opengoofy.index12306.biz.ticketservice.common.enums.SeatStatusEnum;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.SeatDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.SeatMapper;
import org.opengoofy.index12306.biz.ticketservice.mq.domain.MessageWrapper;
import org.opengoofy.index12306.biz.ticketservice.mq.event.PayResultCallbackTicketEvent;
import org.opengoofy.index12306.biz.ticketservice.remote.TicketOrderRemoteService;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.TicketOrderDetailRespDTO;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.TicketOrderPassengerDetailRespDTO;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.opengoofy.index12306.framework.starter.convention.result.Result;
import org.opengoofy.index12306.framework.starter.idempotent.annotation.Idempotent;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentSceneEnum;
import org.opengoofy.index12306.framework.starter.idempotent.enums.IdempotentTypeEnum;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

/**
 * 支付结果回调购票消费者
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Slf4j
@Component
@RequiredArgsConstructor
@RocketMQMessageListener(
        topic = TicketRocketMQConstant.PAY_GLOBAL_TOPIC_KEY,
        selectorExpression = TicketRocketMQConstant.PAY_RESULT_CALLBACK_TAG_KEY,
        consumerGroup = TicketRocketMQConstant.PAY_RESULT_CALLBACK_TICKET_CG_KEY
)
public class PayResultCallbackTicketConsumer implements RocketMQListener<MessageWrapper<PayResultCallbackTicketEvent>> {

    private final TicketOrderRemoteService ticketOrderRemoteService;
    private final SeatMapper seatMapper;

    @Idempotent(
            uniqueKeyPrefix = "index12306-ticket:pay_result_callback:",
            key = "#message.getKeys()+'_'+#message.hashCode()",
            type = IdempotentTypeEnum.SPEL,
            scene = IdempotentSceneEnum.MQ,
            keyTimeout = 7200L
    )
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void onMessage(MessageWrapper<PayResultCallbackTicketEvent> message) {
        Result<TicketOrderDetailRespDTO> ticketOrderDetailResult;
        try {
            ticketOrderDetailResult = ticketOrderRemoteService.queryTicketOrderByOrderSn(message.getMessage().getOrderSn());
            if (!ticketOrderDetailResult.isSuccess() && Objects.isNull(ticketOrderDetailResult.getData())) {
                throw new ServiceException("支付结果回调查询订单失败");
            }
        } catch (Throwable ex) {
            log.error("支付结果回调查询订单失败", ex);
            throw ex;
        }
        TicketOrderDetailRespDTO ticketOrderDetail = ticketOrderDetailResult.getData();
        for (TicketOrderPassengerDetailRespDTO each : ticketOrderDetail.getPassengerDetails()) {
            LambdaUpdateWrapper<SeatDO> updateWrapper = Wrappers.lambdaUpdate(SeatDO.class)
                    .eq(SeatDO::getTrainId, ticketOrderDetail.getTrainId())
                    .eq(SeatDO::getCarriageNumber, each.getCarriageNumber())
                    .eq(SeatDO::getSeatNumber, each.getSeatNumber())
                    .eq(SeatDO::getSeatType, each.getSeatType())
                    .eq(SeatDO::getStartStation, ticketOrderDetail.getDeparture())
                    .eq(SeatDO::getEndStation, ticketOrderDetail.getArrival());
            SeatDO updateSeatDO = new SeatDO();
            updateSeatDO.setSeatStatus(SeatStatusEnum.SOLD.getCode());
            seatMapper.update(updateSeatDO, updateWrapper);
        }
    }
}
