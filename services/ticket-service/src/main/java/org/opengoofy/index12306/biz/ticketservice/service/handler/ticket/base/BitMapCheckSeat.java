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

package org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base;

import org.opengoofy.index12306.framework.starter.cache.DistributedCache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 抽象的验证座位实体类
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public interface BitMapCheckSeat {

    /**
     * 座位是否存在检查方法
     *
     * @param key              缓存Key
     * @param convert          座位统计Map
     * @param distributedCache 分布式缓存接口
     * @return 判断座位是否存在 true or false
     */
    boolean checkSeat(String key, HashMap<Integer, Integer> convert, DistributedCache distributedCache);

    /**
     * 检查座位是否存在 v2 版本
     *
     * @param chooseSeatList 选择座位
     * @param actualSeats    座位状态数组
     * @param SEAT_Y_INT     坐标转换 Map
     * @return
     */
    boolean checkChooseSeat(List<String> chooseSeatList, int[][] actualSeats, Map<Character, Integer> SEAT_Y_INT);
}
