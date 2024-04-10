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
 * 动车实体
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
public class BulletTrainDTO {

    /**
     * 动卧数量
     */
    private Integer sleeperQuantity;

    /**
     * 动卧候选标识
     */
    private Boolean sleeperCandidate;

    /**
     * 动卧价格
     */
    private Integer sleeperPrice;

    /**
     * 一等卧数量
     */
    private Integer firstSleeperQuantity;

    /**
     * 一等卧候选标识
     */
    private Boolean firstSleeperCandidate;

    /**
     * 一等卧价格
     */
    private Integer firstSleeperPrice;

    /**
     * 二等卧数量
     */
    private Integer secondSleeperQuantity;

    /**
     * 二等卧候选标识
     */
    private Boolean secondSleeperCandidate;

    /**
     * 二等卧价格
     */
    private Integer secondSleeperPrice;

    /**
     * 二等座数量
     */
    private Integer secondClassQuantity;

    /**
     * 二等座候选标识
     */
    private Boolean secondClassCandidate;

    /**
     * 二等座价格
     */
    private Integer secondClassPrice;

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
