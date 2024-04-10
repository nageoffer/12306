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

package org.opengoofy.index12306.biz.ticketservice.service;

import org.opengoofy.index12306.biz.ticketservice.dto.domain.RouteDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TrainStationQueryRespDTO;

import java.util.List;

/**
 * 列车站点接口层
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public interface TrainStationService {

    /**
     * 根据列车 ID 查询站点信息
     *
     * @param trainId 列车 ID
     * @return 列车经停站信息
     */
    List<TrainStationQueryRespDTO> listTrainStationQuery(String trainId);

    /**
     * 计算列车站点路线关系
     * 获取开始站点和目的站点及中间站点信息
     *
     * @param trainId   列车 ID
     * @param departure 出发站
     * @param arrival   到达站
     * @return 列车站点路线关系信息
     */
    List<RouteDTO> listTrainStationRoute(String trainId, String departure, String arrival);

    /**
     * 获取需列车站点扣减路线关系
     * 获取开始站点和目的站点、中间站点以及关联站点信息
     *
     * @param trainId   列车 ID
     * @param departure 出发站
     * @param arrival   到达站
     * @return 需扣减列车站点路线关系信息
     */
    List<RouteDTO> listTakeoutTrainStationRoute(String trainId, String departure, String arrival);
}
