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

package org.opengoofy.index12306.framework.starter.distributedid.handler;

import lombok.NonNull;
import org.opengoofy.index12306.framework.starter.distributedid.core.IdGenerator;
import org.opengoofy.index12306.framework.starter.distributedid.core.serviceid.DefaultServiceIdGenerator;
import org.opengoofy.index12306.framework.starter.distributedid.core.serviceid.ServiceIdGenerator;

import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * ID 生成器管理
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class IdGeneratorManager {

    /**
     * ID 生成器管理容器
     */
    private static Map<String, IdGenerator> MANAGER = new ConcurrentHashMap<>();

    /**
     * 注册默认 ID 生成器
     */
    static {
        MANAGER.put("default", new DefaultServiceIdGenerator());
    }

    /**
     * 注册 ID 生成器
     */
    public static void registerIdGenerator(@NonNull String resource, @NonNull IdGenerator idGenerator) {
        IdGenerator actual = MANAGER.get(resource);
        if (actual != null) {
            return;
        }
        MANAGER.put(resource, idGenerator);
    }

    /**
     * 根据 {@param resource} 获取 ID 生成器
     */
    public static ServiceIdGenerator getIdGenerator(@NonNull String resource) {
        return Optional.ofNullable(MANAGER.get(resource)).map(each -> (ServiceIdGenerator) each).orElse(null);
    }

    /**
     * 获取默认 ID 生成器 {@link DefaultServiceIdGenerator}
     */
    public static ServiceIdGenerator getDefaultServiceIdGenerator() {
        return Optional.ofNullable(MANAGER.get("default")).map(each -> (ServiceIdGenerator) each).orElse(null);
    }
}
