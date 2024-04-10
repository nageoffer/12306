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

package org.opengoofy.index12306.biz.ticketservice.dto.domain;

import lombok.Data;

/**
 * 普通车实体
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
public class RegularTrainDTO {

    /**
     * 软卧数量
     */
    private Integer softSleeperQuantity;

    /**
     * 软卧候选标识
     */
    private Boolean softSleeperCandidate;

    /**
     * 软卧价格
     */
    private Integer softSleeperPrice;

    /**
     * 高级软卧数量
     */
    private Integer deluxeSoftSleeperQuantity;

    /**
     * 高级软卧候选标识
     */
    private Boolean deluxeSoftSleeperCandidate;

    /**
     * 高级软卧价格
     */
    private Integer deluxeSoftSleeperPrice;

    /**
     * 硬卧数量
     */
    private Integer hardSleeperQuantity;

    /**
     * 硬卧候选标识
     */
    private Boolean hardSleeperCandidate;

    /**
     * 硬卧价格
     */
    private Integer hardSleeperPrice;

    /**
     * 硬座数量
     */
    private Integer hardSeatQuantity;

    /**
     * 硬座候选标识
     */
    private Boolean hardSeatCandidate;

    /**
     * 硬座价格
     */
    private Integer hardSeatPrice;

    /**
     * 无座数量
     */
    private Integer noSeatQuantity;

    /**
     * 无座候选标识
     */
    private Boolean noSeatCandidate;

    /**
     * 无座价格
     */
    private Integer noSeatPrice;
}
