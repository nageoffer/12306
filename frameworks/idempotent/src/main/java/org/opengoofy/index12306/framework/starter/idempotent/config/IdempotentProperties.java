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

package org.opengoofy.index12306.framework.starter.idempotent.config;

import lombok.Data;
import org.opengoofy.index12306.framework.starter.cache.config.RedisDistributedProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.concurrent.TimeUnit;

/**
 * 幂等属性配置
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
@ConfigurationProperties(prefix = IdempotentProperties.PREFIX)
public class IdempotentProperties {

    public static final String PREFIX = "congomall.idempotent.token";

    /**
     * Token 幂等 Key 前缀
     */
    private String prefix;

    /**
     * Token 申请后过期时间
     * 单位默认毫秒 {@link TimeUnit#MILLISECONDS}
     * 随着分布式缓存过期时间单位 {@link RedisDistributedProperties#valueTimeUnit} 而变化
     */
    private Long timeout;
}
