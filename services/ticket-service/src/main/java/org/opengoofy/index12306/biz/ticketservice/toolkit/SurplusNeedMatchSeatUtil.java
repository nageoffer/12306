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

package org.opengoofy.index12306.biz.ticketservice.toolkit;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.PriorityQueue;

/**
 * 匹配剩余的座位工具类
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class SurplusNeedMatchSeatUtil {

    /**
     * 匹配指定数量的空余座位方法
     *
     * @param chooseSeatSize  选择座位数量
     * @param vacantSeatQueue 空余座位集合
     * @return 获取选择座位数量的空余座位集合 (获取数量可能小于选择座位数量)
     */
    public static List<Pair<Integer, Integer>> getSurplusNeedMatchSeat(int chooseSeatSize, PriorityQueue<List<Pair<Integer, Integer>>> vacantSeatQueue) {
        Optional<List<Pair<Integer, Integer>>> optionalList = vacantSeatQueue.parallelStream().filter(each -> each.size() >= chooseSeatSize).findFirst();
        if (optionalList.isPresent()) {
            return optionalList.get().subList(0, chooseSeatSize);
        }
        List<Pair<Integer, Integer>> result = new ArrayList<>(chooseSeatSize);
        while (CollUtil.isNotEmpty(vacantSeatQueue)) {
            List<Pair<Integer, Integer>> pairList = vacantSeatQueue.poll();
            if (result.size() + pairList.size() < chooseSeatSize) {
                result.addAll(pairList);
            }
            else if (result.size() + pairList.size() >= chooseSeatSize) {
                int needPairListLen = pairList.size() - (result.size() + pairList.size() - chooseSeatSize);
                result.addAll(pairList.subList(0, needPairListLen));
                if (result.size() == chooseSeatSize) {
                    break;
                }
            }
        }
        return result;
    }
}
