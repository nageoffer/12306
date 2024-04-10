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

import cn.hutool.core.util.StrUtil;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * 列车标签枚举
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RequiredArgsConstructor
public enum TrainBrandEnum {

    GC_HIGH_SPEED_RAIL_INTERCITY("0", "GC-高铁/城际"),

    D_ELECTRIC_MULTIPLE_UNIT_EMU("1", "D-动车"),

    Z_DIRECT_EXPRESS("2", "Z-直达"),

    T_EXPRESS("3", "Z-直达"),

    K_FAST("4", "K-快速"),

    OTHER("5", "其他"),

    FU_XING("6", "复兴号"),

    CRH_CHINA_RAILWAY_HIGH_SPEED_INTELLIGENT_EMU("7", "智能动车组");

    @Getter
    private final String code;

    @Getter
    private final String name;

    /**
     * 根据编码查找名称
     */
    public static String findNameByCode(String code) {
        return Arrays.stream(TrainBrandEnum.values())
                .filter(each -> Objects.equals(each.getCode(), code))
                .findFirst()
                .map(TrainBrandEnum::getName)
                .orElse(null);
    }

    /**
     * 根据编码查找名称
     */
    public static List<String> findNameByCode(List<String> codes) {
        List<String> resultNames = new ArrayList<>();
        for (String code : codes) {
            String name = Arrays.stream(TrainBrandEnum.values())
                    .filter(each -> Objects.equals(each.getCode(), code))
                    .findFirst()
                    .map(TrainBrandEnum::getName)
                    .orElse(null);
            if (StrUtil.isNotBlank(name)) {
                resultNames.add(name);
            }
        }
        return resultNames;
    }
}
