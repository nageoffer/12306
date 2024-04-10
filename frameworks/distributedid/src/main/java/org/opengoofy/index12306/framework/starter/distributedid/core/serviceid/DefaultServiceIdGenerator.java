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

package org.opengoofy.index12306.framework.starter.distributedid.core.serviceid;

import org.opengoofy.index12306.framework.starter.distributedid.core.IdGenerator;
import org.opengoofy.index12306.framework.starter.distributedid.core.snowflake.SnowflakeIdInfo;
import org.opengoofy.index12306.framework.starter.distributedid.toolkit.SnowflakeIdUtil;

/**
 * 默认业务 ID 生成器
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class DefaultServiceIdGenerator implements ServiceIdGenerator {

    private final IdGenerator idGenerator;

    private long maxBizIdBitsLen;

    public DefaultServiceIdGenerator() {
        this(SEQUENCE_BIZ_BITS);
    }

    public DefaultServiceIdGenerator(long serviceIdBitLen) {
        idGenerator = SnowflakeIdUtil.getInstance();
        this.maxBizIdBitsLen = (long) Math.pow(2, serviceIdBitLen);
    }

    @Override
    public long nextId(long serviceId) {
        long id = Math.abs(Long.valueOf(serviceId).hashCode()) % (this.maxBizIdBitsLen);
        long nextId = idGenerator.nextId();
        return nextId | id;
    }

    @Override
    public String nextIdStr(long serviceId) {
        return Long.toString(nextId(serviceId));
    }

    @Override
    public SnowflakeIdInfo parseSnowflakeId(long snowflakeId) {
        SnowflakeIdInfo snowflakeIdInfo = SnowflakeIdInfo.builder()
                .workerId((int) ((snowflakeId >> WORKER_ID_SHIFT) & ~(-1L << WORKER_ID_BITS)))
                .dataCenterId((int) ((snowflakeId >> DATA_CENTER_ID_SHIFT) & ~(-1L << DATA_CENTER_ID_BITS)))
                .timestamp((snowflakeId >> TIMESTAMP_LEFT_SHIFT) + DEFAULT_TWEPOCH)
                .sequence((int) ((snowflakeId >> SEQUENCE_BIZ_BITS) & ~(-1L << SEQUENCE_ACTUAL_BITS)))
                .gene((int) (snowflakeId & ~(-1L << SEQUENCE_BIZ_BITS)))
                .build();
        return snowflakeIdInfo;
    }

    /**
     * 工作 ID 5 bit
     */
    private static final long WORKER_ID_BITS = 5L;

    /**
     * 数据中心 ID 5 bit
     */
    private static final long DATA_CENTER_ID_BITS = 5L;

    /**
     * 序列号 12 位，表示只允许 workerId 的范围为 0-4095
     */
    private static final long SEQUENCE_BITS = 12L;

    /**
     * 真实序列号 bit
     */
    private static final long SEQUENCE_ACTUAL_BITS = 8L;

    /**
     * 基因 bit
     */
    private static final long SEQUENCE_BIZ_BITS = 4L;

    /**
     * 机器节点左移12位
     */
    private static final long WORKER_ID_SHIFT = SEQUENCE_BITS;

    /**
     * 默认开始时间
     */
    private static long DEFAULT_TWEPOCH = 1288834974657L;

    /**
     * 数据中心节点左移 17 位
     */
    private static final long DATA_CENTER_ID_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS;

    /**
     * 时间毫秒数左移 22 位
     */
    private static final long TIMESTAMP_LEFT_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS + DATA_CENTER_ID_BITS;
}
