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

import java.util.List;

/**
 * 车次集合实体
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
public class TicketListDTO {

    /**
     * 列车 ID
     */
    private String trainId;

    /**
     * 车次
     */
    private String trainNumber;

    /**
     * 出发时间
     */
    private String departureTime;

    /**
     * 到达时间
     */
    private String arrivalTime;

    /**
     * 历时
     */
    private String duration;

    /**
     * 到达天数
     */
    private Integer daysArrived;

    /**
     * 出发站点
     */
    private String departure;

    /**
     * 到达站点
     */
    private String arrival;

    /**
     * 始发站标识
     */
    private Boolean departureFlag;

    /**
     * 终点站标识
     */
    private Boolean arrivalFlag;

    /**
     * 列车类型 0：高铁 1：动车 2：普通车
     */
    private Integer trainType;

    /**
     * 可售时间
     */
    private String saleTime;

    /**
     * 销售状态 0：可售 1：不可售 2：未知
     */
    private Integer saleStatus;

    /**
     * 列车标签集合 0：复兴号 1：智能动车组 2：静音车厢 3：支持选铺
     */
    private List<String> trainTags;

    /**
     * 列车品牌类型 0：GC-高铁/城际 1：D-动车 2：Z-直达 3：T-特快 4：K-快速 5：其他 6：复兴号 7：智能动车组
     */
    private String trainBrand;

    /**
     * 席别实体集合
     */
    private List<SeatClassDTO> seatClassList;
}
