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

package org.opengoofy.index12306.biz.ticketservice.service.handler.ticket;

import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.PurchaseTicketPassengerDetailDTO;
import org.opengoofy.index12306.biz.ticketservice.service.CarriageService;
import org.opengoofy.index12306.biz.ticketservice.service.SeatService;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base.AbstractTrainPurchaseTicketTemplate;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.SelectSeatDTO;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.TrainPurchaseTicketRespDTO;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.select.SeatSelection;
import org.opengoofy.index12306.biz.ticketservice.toolkit.SeatNumberUtil;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 高铁一等座购票组件
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
@RequiredArgsConstructor
public class TrainFirstClassPurchaseTicketHandler extends AbstractTrainPurchaseTicketTemplate {

    private final CarriageService carriageService;
    private final SeatService seatService;

    @Override
    public String mark() {
        return VehicleTypeEnum.HIGH_SPEED_RAIN.getName() + VehicleSeatTypeEnum.FIRST_CLASS.getName();
    }

    @Override
    protected List<TrainPurchaseTicketRespDTO> selectSeats(SelectSeatDTO requestParam) {
        String trainId = requestParam.getRequestParam().getTrainId();
        String departure = requestParam.getRequestParam().getDeparture();
        String arrival = requestParam.getRequestParam().getArrival();
        List<PurchaseTicketPassengerDetailDTO> passengerSeatDetails = requestParam.getPassengerSeatDetails();
        List<TrainPurchaseTicketRespDTO> actualResult = new ArrayList<>(passengerSeatDetails.size());
        List<String> trainCarriageList = carriageService.listCarriageNumber(trainId, requestParam.getSeatType());
        List<Integer> trainStationCarriageRemainingTicket = seatService.listSeatRemainingTicket(trainId, departure, arrival, trainCarriageList);
        Map<String, Integer> demotionStockNumMap = new LinkedHashMap<>(trainCarriageList.size());
        Map<String, int[][]> actualSeatsMap = new HashMap<>(trainCarriageList.size());
        String carriagesNumber;
        for (int i = 0; i < trainStationCarriageRemainingTicket.size(); i++) {
            int remainingTicket = trainStationCarriageRemainingTicket.get(i);
            if (remainingTicket > passengerSeatDetails.size()) {
                carriagesNumber = trainCarriageList.get(i);
                List<String> listAvailableSeat = seatService.listAvailableSeat(trainId, carriagesNumber, requestParam.getSeatType(), departure, arrival);
                int[][] actualSeats = new int[7][4];
                for (int j = 1; j < 8; j++) {
                    for (int k = 1; k < 5; k++) {
                        // 当前默认按照复兴号商务座排序，后续这里需要按照简单工厂对车类型进行获取 y 轴
                        actualSeats[j - 1][k - 1] = listAvailableSeat.contains("0" + j + SeatNumberUtil.convert(1, k)) ? 0 : 1;
                    }
                }
                List<String> selectSeats = new ArrayList<>();
                int[][] select = SeatSelection.adjacent(passengerSeatDetails.size(), actualSeats);
                if (Objects.isNull(select)) {
                    int demotionStockNum = 0;
                    for (int[] actualSeat : actualSeats) {
                        for (int i1 : actualSeat) {
                            if (i1 == 0) {
                                demotionStockNum++;
                            }
                        }
                    }
                    demotionStockNumMap.putIfAbsent(carriagesNumber, demotionStockNum);
                    actualSeatsMap.putIfAbsent(carriagesNumber, actualSeats);
                    if (i < trainStationCarriageRemainingTicket.size() - 1) {
                        continue;
                    }
                    // 如果邻座算法无法匹配，尝试对用户进行降级分配：同车厢不邻座
                    for (Map.Entry<String, Integer> entry : demotionStockNumMap.entrySet()) {
                        String carriagesNumberBack = entry.getKey();
                        int demotionStockNumBack = entry.getValue();
                        if (demotionStockNumBack > passengerSeatDetails.size()) {
                            int[][] seats = actualSeatsMap.get(carriagesNumberBack);
                            int[][] nonAdjacentSeats = SeatSelection.nonAdjacent(passengerSeatDetails.size(), seats);
                            if (Objects.equals(nonAdjacentSeats.length, passengerSeatDetails.size())) {
                                select = nonAdjacentSeats;
                                carriagesNumber = carriagesNumberBack;
                                break;
                            }
                        }
                    }
                    // TODO 如果同车厢也已无法匹配，则对用户座位再次降级：不同车厢不邻座
                }
                if (select != null) {
                    for (int[] ints : select) {
                        selectSeats.add("0" + ints[0] + SeatNumberUtil.convert(1, ints[1]));
                    }
                    for (int j = 0; j < selectSeats.size(); j++) {
                        TrainPurchaseTicketRespDTO result = new TrainPurchaseTicketRespDTO();
                        String seatNumber = selectSeats.get(j);
                        PurchaseTicketPassengerDetailDTO currentTicketPassenger = passengerSeatDetails.get(j);
                        result.setSeatNumber(seatNumber);
                        result.setSeatType(currentTicketPassenger.getSeatType());
                        result.setCarriageNumber(carriagesNumber);
                        result.setPassengerId(currentTicketPassenger.getPassengerId());
                        actualResult.add(result);
                    }
                    break;
                }
            }
        }
        return actualResult;
    }
}
