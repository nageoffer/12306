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

package org.opengoofy.index12306.biz.aggregationservice;

import cn.crane4j.spring.boot.annotation.EnableCrane4j;
import cn.hippo4j.core.enable.EnableDynamicThreadPool;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.retry.annotation.EnableRetry;

/**
 * 12306 聚合服务应用启动器
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@EnableDynamicThreadPool
@SpringBootApplication(scanBasePackages = {
        "org.opengoofy.index12306.biz.userservice",
        "org.opengoofy.index12306.biz.ticketservice",
        "org.opengoofy.index12306.biz.orderservice",
        "org.opengoofy.index12306.biz.payservice",
        "org.opengoofy.index12306.biz.aggregationservice"
})
@EnableRetry
@MapperScan(value = {
        "org.opengoofy.index12306.biz.userservice.dao.mapper",
        "org.opengoofy.index12306.biz.ticketservice.dao.mapper",
        "org.opengoofy.index12306.biz.orderservice.dao.mapper",
        "org.opengoofy.index12306.biz.payservice.dao.mapper"
})
@EnableFeignClients(value = {
        "org.opengoofy.index12306.biz.ticketservice.remote",
        "org.opengoofy.index12306.biz.orderservice.remote"
})
@EnableCrane4j(enumPackages = "org.opengoofy.index12306.biz.orderservice.common.enums")
public class AggregationServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(AggregationServiceApplication.class, args);
    }
}
