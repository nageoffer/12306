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
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 高铁商务座购票组件
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
@RequiredArgsConstructor
public class TrainBusinessClassPurchaseTicketHandler extends AbstractTrainPurchaseTicketTemplate {

    private final CarriageService carriageService;
    private final SeatService seatService;

    @Override
    public String mark() {
        return VehicleTypeEnum.HIGH_SPEED_RAIN.getName() + VehicleSeatTypeEnum.BUSINESS_CLASS.getName();
    }

    @Override
    protected List<TrainPurchaseTicketRespDTO> selectSeats(SelectSeatDTO requestParam) {
        String trainId = requestParam.getRequestParam().getTrainId();
        String departure = requestParam.getRequestParam().getDeparture();
        String arrival = requestParam.getRequestParam().getArrival();
        List<PurchaseTicketPassengerDetailDTO> passengerSeatDetails = requestParam.getPassengerSeatDetails();
        List<TrainPurchaseTicketRespDTO> actualResult = new ArrayList<>();
        // 判断哪个车厢有座位。获取对应座位类型的车厢号集合，依次进行判断数据是否有余票
        List<String> trainCarriageList = carriageService.listCarriageNumber(trainId, requestParam.getSeatType());
        // 获取车厢余票
        List<Integer> trainStationCarriageRemainingTicket = seatService.listSeatRemainingTicket(trainId, departure, arrival, trainCarriageList);
        // 尽量让一起买票的乘车人在一个车厢
        String carriagesNumber;
        for (int i = 0; i < trainStationCarriageRemainingTicket.size(); i++) {
            int remainingTicket = trainStationCarriageRemainingTicket.get(i);
            if (remainingTicket > passengerSeatDetails.size()) {
                carriagesNumber = trainCarriageList.get(i);
                List<String> listAvailableSeat = seatService.listAvailableSeat(trainId, carriagesNumber);
                List<String> selectSeats = selectSeats(listAvailableSeat, passengerSeatDetails.size());
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
        // TODO 如果一个车厢不满足乘客人数，需要进行拆分
        return actualResult;
    }

    private static List<String> selectSeats(List<String> availableSeats, int requiredPassengers) {
        List<String> selectedSeats = new ArrayList<>();
        for (String seat : availableSeats) {
            if (selectedSeats.size() >= requiredPassengers) {
                break;
            }
            selectedSeats.add(seat);
        }
        return selectedSeats;
    }
}
