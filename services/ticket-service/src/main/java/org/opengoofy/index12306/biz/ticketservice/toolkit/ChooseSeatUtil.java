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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 座位转换工具类
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class ChooseSeatUtil {

    public static final String TRAIN_BUSINESS = "TRAIN_BUSINESS";
    public static final String TRAIN_FIRST = "TRAIN_FIRST";
    public static final String TRAIN_SECOND = "TRAIN_SECOND";

    interface StrPool {
        String A = "A";
        String B = "B";
        String C = "C";
        String D = "D";
        String F = "F";
    }

    /**
     * 选座座位分类 convert
     *
     * @param mark           座位类别标识
     * @param chooseSeatList 选座座位集合
     * @return 选择座位位置 Map
     */
    public static HashMap<Integer,Integer> convert(String mark, List<String> chooseSeatList) {
       HashMap<Integer, Integer> actualChooseSeatMap = new HashMap<>(8);
        Map<String, List<String>> chooseSeatMap = chooseSeatList
                .stream()
                .collect(Collectors.groupingBy(seat -> seat.substring(0, 1)));
        chooseSeatMap.forEach((key, value) -> {
            switch (mark) {
                case TRAIN_BUSINESS -> {
                    switch (key) {
                        case StrPool.A -> actualChooseSeatMap.put(0, value.size());
                        case StrPool.C -> actualChooseSeatMap.put(1, value.size());
                        case StrPool.F -> actualChooseSeatMap.put(2, value.size());
                    }
                }
                case TRAIN_FIRST -> {
                    switch (key) {
                        case StrPool.A -> actualChooseSeatMap.put(0, value.size());
                        case StrPool.C -> actualChooseSeatMap.put(1, value.size());
                        case StrPool.D -> actualChooseSeatMap.put(2, value.size());
                        case StrPool.F -> actualChooseSeatMap.put(3, value.size());
                    }
                }
                case TRAIN_SECOND -> {
                    switch (key) {
                        case StrPool.A -> actualChooseSeatMap.put(0, value.size());
                        case StrPool.B -> actualChooseSeatMap.put(1, value.size());
                        case StrPool.C -> actualChooseSeatMap.put(2, value.size());
                        case StrPool.D -> actualChooseSeatMap.put(3, value.size());
                        case StrPool.F -> actualChooseSeatMap.put(4, value.size());
                    }
                }
            }
        });
        return actualChooseSeatMap;
    }
}
