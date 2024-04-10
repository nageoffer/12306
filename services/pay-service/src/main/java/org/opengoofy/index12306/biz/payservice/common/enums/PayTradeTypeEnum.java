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

package org.opengoofy.index12306.biz.payservice.common.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.Objects;

/**
 * 交易环境枚举
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RequiredArgsConstructor
public enum PayTradeTypeEnum {

    /**
     * 扫码支付环境
     */
    NATIVE(0),

    /**
     * 移动端 Web 应用中支付环境
     */
    JSAPI(1),

    /**
     * 手机浏览器中打开的H5网页支付环境
     */
    MWEB(2),

    /**
     * 去中心化应用程序中支付环境
     */
    DAPP(3);

    @Getter
    private final Integer code;

    /**
     * 根据名称查找码值
     */
    public static String findNameByCode(Integer code) {
        return Arrays.stream(PayTradeTypeEnum.values())
                .filter(each -> Objects.equals(each.getCode(), code))
                .findFirst()
                .map(PayTradeTypeEnum::name)
                .orElse(null);
    }
}
