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

package org.opengoofy.index12306.biz.payservice.dto.base;

import java.math.BigDecimal;

/**
 * 支付入参接口
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public interface PayRequest {

    /**
     * 获取阿里支付入参
     */
    AliPayRequest getAliPayRequest();

    /**
     * 获取订单号
     */
    String getOrderSn();

    /**
     * 商户订单号
     * 由商家自定义，64个字符以内，仅支持字母、数字、下划线且需保证在商户端不重复
     * 默认雪花算法生成，不同支付方式如需扩展自定义重写即可
     */
    String getOrderRequestId();

    /**
     * 商户订单号
     * 由商家自定义，64个字符以内，仅支持字母、数字、下划线且需保证在商户端不重复
     * 默认雪花算法生成，不同支付方式如需扩展自定义重写即可
     */
    BigDecimal getTotalAmount();

    /**
     * 构建查找支付策略实现类标识
     */
    String buildMark();
}
