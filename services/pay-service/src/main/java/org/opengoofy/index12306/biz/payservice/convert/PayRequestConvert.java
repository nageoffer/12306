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

package org.opengoofy.index12306.biz.payservice.convert;

import org.opengoofy.index12306.biz.payservice.common.enums.PayChannelEnum;
import org.opengoofy.index12306.biz.payservice.dto.PayCommand;
import org.opengoofy.index12306.biz.payservice.dto.base.AliPayRequest;
import org.opengoofy.index12306.biz.payservice.dto.base.PayRequest;
import org.opengoofy.index12306.framework.starter.common.toolkit.BeanUtil;

import java.util.Objects;

/**
 * 支付请求入参转换器
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class PayRequestConvert {

    /**
     * {@link PayCommand} to {@link PayRequest}
     *
     * @param payCommand 支付请求参数
     * @return {@link PayRequest}
     */
    public static PayRequest command2PayRequest(PayCommand payCommand) {
        PayRequest payRequest = null;
        if (Objects.equals(payCommand.getChannel(), PayChannelEnum.ALI_PAY.getCode())) {
            payRequest = BeanUtil.convert(payCommand, AliPayRequest.class);
        }
        return payRequest;
    }
}
