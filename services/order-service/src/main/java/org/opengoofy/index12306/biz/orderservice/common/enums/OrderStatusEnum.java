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

package org.opengoofy.index12306.biz.orderservice.common.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

/**
 * 订单状态枚举
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Getter
@RequiredArgsConstructor
public enum OrderStatusEnum {

    /**
     * 待支付：用户选好车票下单，但还未付款的状态
     */
    PENDING_PAYMENT(0),

    /**
     * 已支付：用户支付订单费用
     */
    ALREADY_PAID(10),

    /**
     * 部分退款：用户支付订单费用后部分车票退款
     */
    PARTIAL_REFUND(11),

    /**
     * 全部退款：用户支付订单费用后全部车票退款
     */
    FULL_REFUND(12),

    /**
     * 已完成：用户车票已过上站时间，订单完成
     */
    COMPLETED(20),

    /**
     * 已取消：用户选好车票下单，未支付状态下取消订单
     */
    CLOSED(30);

    private final int status;
}
