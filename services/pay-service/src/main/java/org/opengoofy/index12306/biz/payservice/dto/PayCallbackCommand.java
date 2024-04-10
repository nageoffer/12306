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

package org.opengoofy.index12306.biz.payservice.dto;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.Data;
import org.opengoofy.index12306.biz.payservice.dto.base.AbstractPayRequest;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 支付回调请求命令
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
public final class PayCallbackCommand extends AbstractPayRequest {

    /**
     * 支付渠道
     */
    private Integer channel;

    /**
     * 支付状态
     */
    @JsonAlias("trade_status")
    private String tradeStatus;

    /**
     * 支付凭证号
     */
    @JsonAlias("trade_no")
    private String tradeNo;

    /**
     * 买家付款时间
     */
    @JsonAlias("gmt_payment")
    private Date gmtPayment;

    /**
     * 买家付款金额
     */
    @JsonAlias("buyer_pay_amount")
    private BigDecimal buyerPayAmount;

    /**
     * 商户订单号
     * 由商家自定义，64个字符以内，仅支持字母、数字、下划线且需保证在商户端不重复
     */
    @JsonAlias("out_trade_no")
    private String outTradeNo;

    /**
     * 订单总金额
     * 单位为元，精确到小数点后两位，取值范围：[0.01,100000000]
     */
    private BigDecimal totalAmount;

    /**
     * 订单标题
     * 注意：不可使用特殊字符，如 /，=，& 等
     */
    private String subject;
}
