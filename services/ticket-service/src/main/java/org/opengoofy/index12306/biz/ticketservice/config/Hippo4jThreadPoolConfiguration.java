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

package org.opengoofy.index12306.biz.ticketservice.config;

import cn.hippo4j.common.executor.support.BlockingQueueTypeEnum;
import cn.hippo4j.core.executor.DynamicThreadPool;
import cn.hippo4j.core.executor.support.ThreadPoolBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Hippo4j 动态线程池配置
 * <a href="https://github.com/opengoofy/hippo4j">异步线程池框架，支持线程池动态变更&监控&报警</a>
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Configuration
public class Hippo4jThreadPoolConfiguration {

    /**
     * 分配一个用户购买不同类型车票的线程池
     * <a href="https://nageoffer.com/12306/question">线程池参数如何设置</>
     */
    @Bean
    @DynamicThreadPool
    public ThreadPoolExecutor selectSeatThreadPoolExecutor() {
        String threadPoolId = "select-seat-thread-pool-executor";
        return ThreadPoolBuilder.builder()
                .threadPoolId(threadPoolId)
                .threadFactory(threadPoolId)
                .workQueue(BlockingQueueTypeEnum.SYNCHRONOUS_QUEUE)
                .corePoolSize(24)
                .maximumPoolSize(36)
                .allowCoreThreadTimeOut(true)
                .keepAliveTime(60, TimeUnit.MINUTES)
                .rejected(new ThreadPoolExecutor.CallerRunsPolicy())
                .dynamicPool()
                .build();
    }
}
