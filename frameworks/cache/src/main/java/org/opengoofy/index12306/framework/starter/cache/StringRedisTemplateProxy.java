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

import com.alibaba.fastjson2.JSON;
import com.google.common.collect.Lists;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.framework.starter.bases.Singleton;
import org.opengoofy.index12306.framework.starter.cache.config.RedisDistributedProperties;
import org.opengoofy.index12306.framework.starter.cache.core.CacheGetFilter;
import org.opengoofy.index12306.framework.starter.cache.core.CacheGetIfAbsent;
import org.opengoofy.index12306.framework.starter.cache.core.CacheLoader;
import org.opengoofy.index12306.framework.starter.cache.toolkit.CacheUtil;
import org.opengoofy.index12306.framework.starter.cache.toolkit.FastJson2Util;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.scripting.support.ResourceScriptSource;

import java.util.Collection;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

/**
 * 分布式缓存之操作 Redis 模版代理
 * 底层通过 {@link RedissonClient}、{@link StringRedisTemplate} 完成外观接口行为
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RequiredArgsConstructor
public class StringRedisTemplateProxy implements DistributedCache {

    private final StringRedisTemplate stringRedisTemplate;
    private final RedisDistributedProperties redisProperties;
    private final RedissonClient redissonClient;

    private static final String LUA_PUT_IF_ALL_ABSENT_SCRIPT_PATH = "lua/putIfAllAbsent.lua";
    private static final String SAFE_GET_DISTRIBUTED_LOCK_KEY_PREFIX = "safe_get_distributed_lock_get:";

    @Override
    public <T> T get(String key, Class<T> clazz) {
        String value = stringRedisTemplate.opsForValue().get(key);
        if (String.class.isAssignableFrom(clazz)) {
            return (T) value;
        }
        return JSON.parseObject(value, FastJson2Util.buildType(clazz));
    }

    @Override
    public void put(String key, Object value) {
        put(key, value, redisProperties.getValueTimeout());
    }

    @Override
    public Boolean putIfAllAbsent(@NotNull Collection<String> keys) {
        DefaultRedisScript<Boolean> actual = Singleton.get(LUA_PUT_IF_ALL_ABSENT_SCRIPT_PATH, () -> {
            DefaultRedisScript redisScript = new DefaultRedisScript();
            redisScript.setScriptSource(new ResourceScriptSource(new ClassPathResource(LUA_PUT_IF_ALL_ABSENT_SCRIPT_PATH)));
            redisScript.setResultType(Boolean.class);
            return redisScript;
        });
        Boolean result = stringRedisTemplate.execute(actual, Lists.newArrayList(keys), redisProperties.getValueTimeout().toString());
        return result != null && result;
    }

    @Override
    public Boolean delete(String key) {
        return stringRedisTemplate.delete(key);
    }

    @Override
    public Long delete(Collection<String> keys) {
        return stringRedisTemplate.delete(keys);
    }

    @Override
    public <T> T get(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout) {
        return get(key, clazz, cacheLoader, timeout, redisProperties.getValueTimeUnit());
    }

    @Override
    public <T> T get(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit) {
        T result = get(key, clazz);
        if (!CacheUtil.isNullOrBlank(result)) {
            return result;
        }
        return loadAndSet(key, cacheLoader, timeout, timeUnit, false, null);
    }

    @Override
    public <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout) {
        return safeGet(key, clazz, cacheLoader, timeout, redisProperties.getValueTimeUnit());
    }

    @Override
    public <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit) {
        return safeGet(key, clazz, cacheLoader, timeout, timeUnit, null);
    }

    @Override
    public <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, RBloomFilter<String> bloomFilter) {
        return safeGet(key, clazz, cacheLoader, timeout, bloomFilter, null, null);
    }

    @Override
    public <T> T safeGet(@NotBlank String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit, RBloomFilter<String> bloomFilter) {
        return safeGet(key, clazz, cacheLoader, timeout, timeUnit, bloomFilter, null, null);
    }

    @Override
    public <T> T safeGet(String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheCheckFilter) {
        return safeGet(key, clazz, cacheLoader, timeout, redisProperties.getValueTimeUnit(), bloomFilter, cacheCheckFilter, null);
    }

    @Override
    public <T> T safeGet(String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit, RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheCheckFilter) {
        return safeGet(key, clazz, cacheLoader, timeout, timeUnit, bloomFilter, cacheCheckFilter, null);
    }

    @Override
    public <T> T safeGet(String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout,
                         RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheGetFilter, CacheGetIfAbsent<String> cacheGetIfAbsent) {
        return safeGet(key, clazz, cacheLoader, timeout, redisProperties.getValueTimeUnit(), bloomFilter, cacheGetFilter, cacheGetIfAbsent);
    }

    @Override
    public <T> T safeGet(String key, Class<T> clazz, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit,
                         RBloomFilter<String> bloomFilter, CacheGetFilter<String> cacheGetFilter, CacheGetIfAbsent<String> cacheGetIfAbsent) {
        T result = get(key, clazz);
        // 缓存结果不等于空或空字符串直接返回；通过函数判断是否返回空，为了适配布隆过滤器无法删除的场景；两者都不成立，判断布隆过滤器是否存在，不存在返回空
        if (!CacheUtil.isNullOrBlank(result)
                || Optional.ofNullable(cacheGetFilter).map(each -> each.filter(key)).orElse(false)
                || Optional.ofNullable(bloomFilter).map(each -> !each.contains(key)).orElse(false)) {
            return result;
        }
        RLock lock = redissonClient.getLock(SAFE_GET_DISTRIBUTED_LOCK_KEY_PREFIX + key);
        lock.lock();
        try {
            // 双重判定锁，减轻获得分布式锁后线程访问数据库压力
            if (CacheUtil.isNullOrBlank(result = get(key, clazz))) {
                // 如果访问 cacheLoader 加载数据为空，执行后置函数操作
                if (CacheUtil.isNullOrBlank(result = loadAndSet(key, cacheLoader, timeout, timeUnit, true, bloomFilter))) {
                    Optional.ofNullable(cacheGetIfAbsent).ifPresent(each -> each.execute(key));
                }
            }
        } finally {
            lock.unlock();
        }
        return result;
    }

    @Override
    public void put(String key, Object value, long timeout) {
        put(key, value, timeout, redisProperties.getValueTimeUnit());
    }

    @Override
    public void put(String key, Object value, long timeout, TimeUnit timeUnit) {
        String actual = value instanceof String ? (String) value : JSON.toJSONString(value);
        stringRedisTemplate.opsForValue().set(key, actual, timeout, timeUnit);
    }

    @Override
    public void safePut(String key, Object value, long timeout, RBloomFilter<String> bloomFilter) {
        safePut(key, value, timeout, redisProperties.getValueTimeUnit(), bloomFilter);
    }

    @Override
    public void safePut(String key, Object value, long timeout, TimeUnit timeUnit, RBloomFilter<String> bloomFilter) {
        put(key, value, timeout, timeUnit);
        if (bloomFilter != null) {
            bloomFilter.add(key);
        }
    }

    @Override
    public Boolean hasKey(String key) {
        return stringRedisTemplate.hasKey(key);
    }

    @Override
    public Object getInstance() {
        return stringRedisTemplate;
    }

    @Override
    public Long countExistingKeys(String... keys) {
        return stringRedisTemplate.countExistingKeys(Lists.newArrayList(keys));
    }

    private <T> T loadAndSet(String key, CacheLoader<T> cacheLoader, long timeout, TimeUnit timeUnit, boolean safeFlag, RBloomFilter<String> bloomFilter) {
        T result = cacheLoader.load();
        if (CacheUtil.isNullOrBlank(result)) {
            return result;
        }
        if (safeFlag) {
            safePut(key, result, timeout, timeUnit, bloomFilter);
        } else {
            put(key, result, timeout, timeUnit);
        }
        return result;
    }
}
