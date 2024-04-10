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

package org.opengoofy.index12306.framework.starter.cache;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.NotBlank;
import org.opengoofy.index12306.framework.starter.cache.core.CacheGetFilter;
import org.opengoofy.index12306.framework.starter.cache.core.CacheGetIfAbsent;
import org.opengoofy.index12306.framework.starter.cache.core.CacheLoader;
import org.redisson.api.RBloomFilter;

import java.util.concurrent.TimeUnit;

/**
 * 分布式缓存
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public interface DistributedCache extends Cache {

    /**
     * 获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     */
    <T> T get(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout);

    /**
     * 获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     */
    <T> T get(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存击穿、缓存雪崩场景，适用于不被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存击穿、缓存雪崩场景，适用于不被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，适用于被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, RBloomFilter<String> bloomFilter);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，适用于被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit, RBloomFilter<String> bloomFilter);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，并通过 {@link CacheGetFilter} 解决布隆过滤器无法删除问题，适用于被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheCheckFilter);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，并通过 {@link CacheGetFilter} 解决布隆过滤器无法删除问题，适用于被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit, RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheCheckFilter);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，并通过 {@link CacheGetFilter} 解决布隆过滤器无法删除问题，适用于被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout,
                  RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheCheckFilter, CacheGetIfAbsent<String> cacheGetIfAbsent);

    /**
     * 以一种"安全"的方式获取缓存，如查询结果为空，调用 {@link CacheLoader} 加载缓存
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，并通过 {@link CacheGetFilter} 解决布隆过滤器无法删除问题，适用于被外部直接调用的接口
     */
    <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit,
                  RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheCheckFilter, CacheGetIfAbsent<String> cacheGetIfAbsent);

    /**
     * 放入缓存，自定义超时时间
     */
    void put(@NotBlank String key, Object value, long timeout);

    /**
     * 放入缓存，自定义超时时间
     */
    void put(@NotBlank String key, Object value, long timeout, TimeUnit timeUnit);

    /**
     * 放入缓存，自定义超时时间
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，适用于被外部直接调用的接口
     */
    void safePut(@NotBlank String key, Object value, long timeout, RBloomFilter<String> bloomFilter);

    /**
     * 放入缓存，自定义超时时间，并将 key 加入步隆过滤器。极大概率通过此方式防止：缓存穿透、缓存击穿、缓存雪崩
     * 通过此方式防止程序中可能出现的：缓存穿透、缓存击穿以及缓存雪崩场景，需要客户端传递布隆过滤器，适用于被外部直接调用的接口
     */
    void safePut(@NotBlank String key, Object value, long timeout, TimeUnit timeUnit, RBloomFilter<String> bloomFilter);

    /**
     * 统计指定 key 的存在数量
     */
    Long countExistingKeys(@NotNull String... keys);
}
