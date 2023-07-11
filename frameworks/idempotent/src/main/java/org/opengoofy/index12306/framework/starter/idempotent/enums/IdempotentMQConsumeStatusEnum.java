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

package org.opengoofy.index12306.framework.starter.idempotent.enums;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.Objects;

/**
 * 幂等 MQ 消费状态枚举
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RequiredArgsConstructor
public enum IdempotentMQConsumeStatusEnum {
    
    /**
     * 消费中
     */
    CONSUMING("0"),
    
    /**
     * 已消费
     */
    CONSUMED("1");
    
    @Getter
    private final String code;
    
    /**
     * 如果消费状态等于消费中，返回失败
     *
     * @param consumeStatus 消费状态
     * @return 是否消费失败
     */
    public static boolean isError(String consumeStatus) {
        return Objects.equals(CONSUMING.code, consumeStatus);
    }
}
