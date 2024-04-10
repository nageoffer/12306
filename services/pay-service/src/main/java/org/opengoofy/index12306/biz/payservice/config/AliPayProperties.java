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

package org.opengoofy.index12306.biz.payservice.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 支付宝配置
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
@Configuration
@ConfigurationProperties(prefix = AliPayProperties.PREFIX)
public class AliPayProperties {

    public static final String PREFIX = "pay.alipay";

    /**
     * 开放平台上创建的应用的 ID
     */
    private String appId;

    /**
     * 商户私钥
     */
    private String privateKey;

    /**
     * 支付宝公钥字符串（公钥模式下设置，证书模式下无需设置）
     */
    private String alipayPublicKey;

    /**
     * 网关地址
     * 线上：https://openapi.alipay.com/gateway.do
     * 沙箱：https://openapi.alipaydev.com/gateway.do
     */
    private String serverUrl;

    /**
     * 支付结果回调地址
     */
    private String notifyUrl;

    /**
     * 报文格式，推荐：json
     */
    private String format;

    /**
     * 字符串编码，推荐：utf-8
     */
    private String charset;

    /**
     * 签名算法类型，推荐：RSA2
     */
    private String signType;
}
