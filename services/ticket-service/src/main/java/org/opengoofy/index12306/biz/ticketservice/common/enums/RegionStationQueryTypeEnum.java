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

/**
 * 地区&站点类型枚举
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RequiredArgsConstructor
public enum RegionStationQueryTypeEnum {

    /**
     * 热门查询
     */
    HOT(0, null),

    /**
     * A to E
     */
    A_E(1, ListUtil.of("A", "B", "C", "D", "E")),

    /**
     * F to J
     */
    F_J(2, ListUtil.of("F", "G", "H", "R", "J")),

    /**
     * K to O
     */
    K_O(3, ListUtil.of("K", "L", "M", "N", "O")),

    /**
     * P to T
     */
    P_T(4, ListUtil.of("P", "Q", "R", "S", "T")),

    /**
     * U to Z
     */
    U_Z(5, ListUtil.of("U", "V", "W", "X", "Y", "Z"));

    /**
     * 类型
     */
    @Getter
    private final Integer type;

    /**
     * 拼音列表
     */
    @Getter
    private final List<String> spells;

    /**
     * 根据类型查找拼音集合
     */
    public static List<String> findSpellsByType(Integer type) {
        return Arrays.stream(RegionStationQueryTypeEnum.values())
                .filter(each -> Objects.equals(each.getType(), type))
                .findFirst()
                .map(RegionStationQueryTypeEnum::getSpells)
                .orElse(null);
    }
}
