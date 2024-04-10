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
import java.util.Map;

/**
 * 座位号转换工具
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class SeatNumberUtil {

    /**
     * 复兴号-商务座
     */
    private static final Map<Integer, String> TRAIN_BUSINESS_CLASS_SEAT_NUMBER_MAP = new HashMap<>();

    /**
     * 复兴号-一等座
     */
    private static final Map<Integer, String> TRAIN_FIRST_CLASS_SEAT_NUMBER_MAP = new HashMap<>();

    /**
     * 复兴号-二等座
     */
    private static final Map<Integer, String> TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP = new HashMap<>();

    static {
        TRAIN_BUSINESS_CLASS_SEAT_NUMBER_MAP.put(1, "A");
        TRAIN_BUSINESS_CLASS_SEAT_NUMBER_MAP.put(2, "C");
        TRAIN_BUSINESS_CLASS_SEAT_NUMBER_MAP.put(3, "F");
        TRAIN_FIRST_CLASS_SEAT_NUMBER_MAP.put(1, "A");
        TRAIN_FIRST_CLASS_SEAT_NUMBER_MAP.put(2, "C");
        TRAIN_FIRST_CLASS_SEAT_NUMBER_MAP.put(3, "D");
        TRAIN_FIRST_CLASS_SEAT_NUMBER_MAP.put(4, "F");
        TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP.put(1, "A");
        TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP.put(2, "B");
        TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP.put(3, "C");
        TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP.put(4, "D");
        TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP.put(5, "F");
    }

    /**
     * 根据类型转换座位号
     *
     * @param type 列车座位类型
     * @param num  座位号
     * @return 座位编号
     */
    public static String convert(int type, int num) {
        String serialNumber = null;
        switch (type) {
            case 0 -> serialNumber = TRAIN_BUSINESS_CLASS_SEAT_NUMBER_MAP.get(num);
            case 1 -> serialNumber = TRAIN_FIRST_CLASS_SEAT_NUMBER_MAP.get(num);
            case 2 -> serialNumber = TRAIN_SECOND_CLASS_SEAT_NUMBER_MAP.get(num);
        }
        return serialNumber;
    }
}
