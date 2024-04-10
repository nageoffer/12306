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

package org.opengoofy.index12306.biz.orderservice.mq.produce;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.common.message.MessageConst;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.opengoofy.index12306.biz.orderservice.common.constant.OrderRocketMQConstant;
import org.opengoofy.index12306.biz.orderservice.mq.domain.MessageWrapper;
import org.opengoofy.index12306.biz.orderservice.mq.event.DelayCloseOrderEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * 延迟关闭订单生产者
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Slf4j
@Component
public class DelayCloseOrderSendProduce extends AbstractCommonSendProduceTemplate<DelayCloseOrderEvent> {

    private final ConfigurableEnvironment environment;

    public DelayCloseOrderSendProduce(@Autowired RocketMQTemplate rocketMQTemplate, @Autowired ConfigurableEnvironment environment) {
        super(rocketMQTemplate);
        this.environment = environment;
    }

    @Override
    protected BaseSendExtendDTO buildBaseSendExtendParam(DelayCloseOrderEvent messageSendEvent) {
        return BaseSendExtendDTO.builder()
                .eventName("延迟关闭订单")
                .keys(messageSendEvent.getOrderSn())
                .topic(environment.resolvePlaceholders(OrderRocketMQConstant.ORDER_DELAY_CLOSE_TOPIC_KEY))
                .tag(environment.resolvePlaceholders(OrderRocketMQConstant.ORDER_DELAY_CLOSE_TAG_KEY))
                .sentTimeout(2000L)
                // RocketMQ 延迟消息级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h
                .delayLevel(14)
                .build();
    }

    @Override
    protected Message<?> buildMessage(DelayCloseOrderEvent messageSendEvent, BaseSendExtendDTO requestParam) {
        String keys = StrUtil.isEmpty(requestParam.getKeys()) ? UUID.randomUUID().toString() : requestParam.getKeys();
        return MessageBuilder
                .withPayload(new MessageWrapper(requestParam.getKeys(), messageSendEvent))
                .setHeader(MessageConst.PROPERTY_KEYS, keys)
                .setHeader(MessageConst.PROPERTY_TAGS, requestParam.getTag())
                .build();
    }
}
