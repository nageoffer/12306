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

import com.baomidou.mybatisplus.extension.service.IService;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.SeatDO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.SeatTypeCountDTO;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.TrainPurchaseTicketRespDTO;

import java.util.List;

/**
 * 座位接口层
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public interface SeatService extends IService<SeatDO> {

    /**
     * 获取列车车厢中可用的座位集合
     *
     * @param trainId        列车 ID
     * @param carriageNumber 车厢号
     * @param seatType       座位类型
     * @param departure      出发站
     * @param arrival        到达站
     * @return 可用座位集合
     */
    List<String> listAvailableSeat(String trainId, String carriageNumber, Integer seatType, String departure, String arrival);

    /**
     * 获取列车车厢余票集合
     *
     * @param trainId           列车 ID
     * @param departure         出发站
     * @param arrival           到达站
     * @param trainCarriageList 车厢编号集合
     * @return 车厢余票集合
     */
    List<Integer> listSeatRemainingTicket(String trainId, String departure, String arrival, List<String> trainCarriageList);

    /**
     * 查询列车有余票的车厢号集合
     *
     * @param trainId      列车 ID
     * @param carriageType 车厢类型
     * @param departure    出发站
     * @param arrival      到达站
     * @return 车厢号集合
     */
    List<String> listUsableCarriageNumber(String trainId, Integer carriageType, String departure, String arrival);

    /**
     * 获取列车 startStation 到 endStation 区间可用座位数量
     *
     * @param trainId      列车 ID
     * @param startStation 出发站
     * @param endStation   到达站
     * @param seatTypes    座位类型集合
     * @return 座位剩余可用数量
     */
    List<SeatTypeCountDTO> listSeatTypeCount(Long trainId, String startStation, String endStation, List<Integer> seatTypes);

    /**
     * 锁定选中以及沿途车票状态
     *
     * @param trainId                     列车 ID
     * @param departure                   出发站
     * @param arrival                     到达站
     * @param trainPurchaseTicketRespList 乘车人以及座位信息
     */
    void lockSeat(String trainId, String departure, String arrival, List<TrainPurchaseTicketRespDTO> trainPurchaseTicketRespList);

    /**
     * 解锁选中以及沿途车票状态
     *
     * @param trainId                    列车 ID
     * @param departure                  出发站
     * @param arrival                    到达站
     * @param trainPurchaseTicketResults 乘车人以及座位信息
     */
    void unlock(String trainId, String departure, String arrival, List<TrainPurchaseTicketRespDTO> trainPurchaseTicketResults);
}
