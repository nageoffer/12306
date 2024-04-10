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

package org.opengoofy.index12306.biz.ticketservice.dto.resp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.TicketListDTO;

import java.util.List;

/**
 * 车票分页查询响应参数
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TicketPageQueryRespDTO {

    /**
     * 车次集合数据
     */
    private List<TicketListDTO> trainList;

    /**
     * 车次类型：D-动车 Z-直达 复兴号等
     */
    private List<Integer> trainBrandList;

    /**
     * 出发车站
     */
    private List<String> departureStationList;

    /**
     * 到达车站
     */
    private List<String> arrivalStationList;

    /**
     * 车次席别
     */
    private List<Integer> seatClassTypeList;
}
