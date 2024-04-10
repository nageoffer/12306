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

import lombok.Getter;
import lombok.Setter;
import org.opengoofy.index12306.framework.starter.distributedid.toolkit.SnowflakeIdUtil;

/**
 * 抽象退款入参实体
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public abstract class AbstractRefundRequest implements RefundRequest {

    /**
     * 交易环境，H5、小程序、网站等
     */
    @Getter
    @Setter
    private Integer tradeType;

    /**
     * 订单号
     */
    @Getter
    @Setter
    private String orderSn;

    /**
     * 支付渠道
     */
    @Getter
    @Setter
    private Integer channel;

    @Override
    public AliRefundRequest getAliRefundRequest() {
        return null;
    }

    @Override
    public String buildMark() {
        return null;
    }
}
