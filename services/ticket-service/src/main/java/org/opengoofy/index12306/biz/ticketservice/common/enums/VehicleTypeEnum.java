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

package org.opengoofy.index12306.biz.ticketservice.common.enums;

import cn.hutool.core.collection.ListUtil;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.BUSINESS_CLASS;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.FIRST_CLASS;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.FIRST_SLEEPER;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.HARD_SEAT;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.HARD_SLEEPER;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.NO_SEAT_SLEEPER;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.SECOND_CLASS;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.SECOND_CLASS_CABIN_SEAT;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.SECOND_SLEEPER;
import static org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum.SOFT_SLEEPER;

/**
 * 交通工具类型
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RequiredArgsConstructor
public enum VehicleTypeEnum {

    /**
     * 高铁
     */
    HIGH_SPEED_RAIN(0, "HIGH_SPEED_RAIN", "高铁", ListUtil.of(BUSINESS_CLASS.getCode(), FIRST_CLASS.getCode(), SECOND_CLASS.getCode())),

    /**
     * 动车
     */
    BULLET(1, "BULLET", "动车", ListUtil.of(SECOND_CLASS_CABIN_SEAT.getCode(), FIRST_SLEEPER.getCode(), SECOND_SLEEPER.getCode(), NO_SEAT_SLEEPER.getCode())),

    /**
     * 普通车
     */
    REGULAR_TRAIN(2, "REGULAR_TRAIN", "普通车", ListUtil.of(SOFT_SLEEPER.getCode(), HARD_SLEEPER.getCode(), HARD_SEAT.getCode(), NO_SEAT_SLEEPER.getCode())),

    /**
     * 汽车
     */
    CAR(3, "CAR", "汽车", null),

    /**
     * 飞机
     */
    AIRPLANE(4, "AIRPLANE", "飞机", null);

    @Getter
    private final Integer code;

    @Getter
    private final String name;

    @Getter
    private final String value;

    @Getter
    private final List<Integer> seatTypes;

    /**
     * 根据编码查找名称
     */
    public static String findNameByCode(Integer code) {
        return Arrays.stream(VehicleTypeEnum.values())
                .filter(each -> Objects.equals(each.getCode(), code))
                .findFirst()
                .map(VehicleTypeEnum::getName)
                .orElse(null);
    }

    /**
     * 根据编码查找座位类型集合
     */
    public static List<Integer> findSeatTypesByCode(Integer code) {
        return Arrays.stream(VehicleTypeEnum.values())
                .filter(each -> Objects.equals(each.getCode(), code))
                .findFirst()
                .map(VehicleTypeEnum::getSeatTypes)
                .orElse(null);
    }
}
