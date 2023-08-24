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

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.lang.Pair;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.PurchaseTicketPassengerDetailDTO;
import org.opengoofy.index12306.biz.ticketservice.service.SeatService;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base.AbstractTrainPurchaseTicketTemplate;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base.BitMapCheckSeat;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base.BitMapCheckSeatStatusFactory;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.SelectSeatDTO;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.TrainPurchaseTicketRespDTO;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.select.SeatSelection;
import org.opengoofy.index12306.biz.ticketservice.toolkit.CarriageVacantSeatCalculateUtil;
import org.opengoofy.index12306.biz.ticketservice.toolkit.ChooseSeatUtil;
import org.opengoofy.index12306.biz.ticketservice.toolkit.SeatNumberUtil;
import org.opengoofy.index12306.biz.ticketservice.toolkit.SurplusNeedMatchSeatUtil;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.cache.toolkit.CacheUtil;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.PriorityQueue;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_CARRIAGE_SEAT_STATUS;
import static org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.base.BitMapCheckSeatStatusFactory.TRAIN_FIRST;

/**
 * 高铁一等座购票组件
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
@RequiredArgsConstructor
public class TrainFirstClassPurchaseTicketHandler extends AbstractTrainPurchaseTicketTemplate {

    private final SeatService seatService;
    private final DistributedCache distributedCache;

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
        List<String> trainCarriageList = seatService.listUsableCarriageNumber(trainId, requestParam.getSeatType(), departure, arrival);
        List<Integer> trainStationCarriageRemainingTicket = seatService.listSeatRemainingTicket(trainId, departure, arrival, trainCarriageList);
        int remainingTicketSum = trainStationCarriageRemainingTicket.stream().mapToInt(Integer::intValue).sum();
        if (remainingTicketSum < passengerSeatDetails.size()) {
            throw new ServiceException("站点余票不足，请尝试更换座位类型或选择其它站点");
        }
        if (passengerSeatDetails.size() < 5) {
            if (CollUtil.isNotEmpty(requestParam.getRequestParam().getChooseSeats())) {
                return matchSeats(requestParam, trainCarriageList, trainStationCarriageRemainingTicket);
            }
            return selectSeats(requestParam, trainCarriageList, trainStationCarriageRemainingTicket);
        } else {
            if (CollUtil.isNotEmpty(requestParam.getRequestParam().getChooseSeats())) {
                return matchSeats(requestParam, trainCarriageList, trainStationCarriageRemainingTicket);
            }
            return selectComplexSeats(requestParam, trainCarriageList, trainStationCarriageRemainingTicket);
        }
    }

    private List<TrainPurchaseTicketRespDTO> matchSeats(SelectSeatDTO requestParam, List<String> trainCarriageList, List<Integer> trainStationCarriageRemainingTicket) {
        String trainId = requestParam.getRequestParam().getTrainId();
        String departure = requestParam.getRequestParam().getDeparture();
        String arrival = requestParam.getRequestParam().getArrival();
        List<PurchaseTicketPassengerDetailDTO> passengerSeatDetails = requestParam.getPassengerSeatDetails();
        List<TrainPurchaseTicketRespDTO> actualResult = new ArrayList<>();
        Map<String, PriorityQueue<List<Pair<Integer, Integer>>>> carriageNumberVacantSeat = new HashMap<>(16);
        List<String> chooseSeatList = requestParam.getRequestParam().getChooseSeats();
        HashMap<Integer, Integer> convert = ChooseSeatUtil.convert(TRAIN_FIRST, chooseSeatList);
        BitMapCheckSeat instance = BitMapCheckSeatStatusFactory.getInstance(TRAIN_FIRST);
        StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
        for (int i = 0; i < trainStationCarriageRemainingTicket.size(); i++) {
            String carriagesNumber = trainCarriageList.get(i);
            List<String> listAvailableSeat = seatService.listAvailableSeat(trainId, carriagesNumber, requestParam.getSeatType(), departure, arrival);
            int[][] actualSeats = new int[7][4];
            for (int j = 1; j < 8; j++) {
                for (int k = 1; k < 5; k++) {
                    actualSeats[j - 1][k - 1] = listAvailableSeat.contains("0" + j + SeatNumberUtil.convert(1, k)) ? 0 : 1;
                }
            }
            String keySuffix = CacheUtil.buildKey(trainId, departure, arrival, carriagesNumber);
            String key = TRAIN_CARRIAGE_SEAT_STATUS + keySuffix;
            for (int i1 = 0; i1 < 7; i1++) {
                for (int j = 0; j < 4; j++) {
                    stringRedisTemplate.opsForValue()
                            .setBit(key, i1 * 4 + j, actualSeats[i1][j] == 0);
                }
            }
            boolean isExists = instance.checkSeat(key, convert, distributedCache);
            List<String> selectSeats = new ArrayList<>(passengerSeatDetails.size() + 1);
            final List<Pair<Integer, Integer>> sureSeatList = Lists.newArrayListWithCapacity(chooseSeatList.size());
            PriorityQueue<List<Pair<Integer, Integer>>> vacantSeatQueue = CarriageVacantSeatCalculateUtil
                    .buildCarriageVacantSeatList(actualSeats, 7, 4);
            int seatCount = vacantSeatQueue.parallelStream().mapToInt(Collection::size).sum() - passengerSeatDetails.size();
            if (isExists && seatCount >= 0) {
                convert.forEach((k, v) -> {
                    List<Pair<Integer, Integer>> temp = new ArrayList<>();
                    Iterator<List<Pair<Integer, Integer>>> iterator = vacantSeatQueue.iterator();
                    while (iterator.hasNext()) {
                        List<Pair<Integer, Integer>> next = iterator.next();
                        Iterator<Pair<Integer, Integer>> pairIterator = next.iterator();
                        while (pairIterator.hasNext()) {
                            Pair<Integer, Integer> pair = pairIterator.next();
                            if (pair.getValue() == k && temp.size() < v) {
                                temp.add(pair);
                                pairIterator.remove();
                            }
                        }
                        if (temp.size() == v) {
                            sureSeatList.addAll(temp);
                            break;
                        }
                    }
                });
                if (sureSeatList.size() != passengerSeatDetails.size()) {
                    List<Pair<Integer, Integer>> pairList = vacantSeatQueue.parallelStream().flatMap(each -> each.stream()).collect(Collectors.toList());
                    int needSeatSize = passengerSeatDetails.size() - sureSeatList.size();
                    sureSeatList.addAll(pairList.subList(0, needSeatSize));
                }
                for (Pair<Integer, Integer> each : sureSeatList) {
                    selectSeats.add("0" + (each.getKey() + 1) + SeatNumberUtil.convert(1, each.getValue() + 1));
                }
                AtomicInteger countNum = new AtomicInteger(0);
                for (String selectSeat : selectSeats) {
                    TrainPurchaseTicketRespDTO result = new TrainPurchaseTicketRespDTO();
                    PurchaseTicketPassengerDetailDTO currentTicketPassenger = passengerSeatDetails.get(countNum.getAndIncrement());
                    result.setSeatNumber(selectSeat);
                    result.setSeatType(currentTicketPassenger.getSeatType());
                    result.setCarriageNumber(carriagesNumber);
                    result.setPassengerId(currentTicketPassenger.getPassengerId());
                    actualResult.add(result);
                }
                return actualResult;
            } else {
                if (i < trainStationCarriageRemainingTicket.size()) {
                    carriageNumberVacantSeat.put(carriagesNumber, vacantSeatQueue);
                    if (i == trainStationCarriageRemainingTicket.size() - 1) {
                        List<Pair<Integer, Integer>> actualSureSeat = new ArrayList<>(chooseSeatList.size());
                        for (Map.Entry<String, PriorityQueue<List<Pair<Integer, Integer>>>> entry : carriageNumberVacantSeat.entrySet()) {
                            PriorityQueue<List<Pair<Integer, Integer>>> entryValue = entry.getValue();
                            int size = entryValue.parallelStream().mapToInt(Collection::size).sum();
                            if (size >= passengerSeatDetails.size()) {
                                actualSureSeat = SurplusNeedMatchSeatUtil.getSurplusNeedMatchSeat(passengerSeatDetails.size(), entryValue);
                                for (Pair<Integer, Integer> each : actualSureSeat) {
                                    selectSeats.add("0" + (each.getKey() + 1) + SeatNumberUtil.convert(1, each.getValue() + 1));
                                }
                                AtomicInteger countNum = new AtomicInteger(0);
                                for (String selectSeat : selectSeats) {
                                    TrainPurchaseTicketRespDTO result = new TrainPurchaseTicketRespDTO();
                                    PurchaseTicketPassengerDetailDTO currentTicketPassenger = passengerSeatDetails.get(countNum.getAndIncrement());
                                    result.setSeatNumber(selectSeat);
                                    result.setSeatType(currentTicketPassenger.getSeatType());
                                    result.setCarriageNumber(entry.getKey());
                                    result.setPassengerId(currentTicketPassenger.getPassengerId());
                                    actualResult.add(result);
                                }
                                break;
                            }
                        }
                        if (CollUtil.isEmpty(actualSureSeat)) {
                            AtomicInteger countNum = new AtomicInteger(0);
                            for (Map.Entry<String, PriorityQueue<List<Pair<Integer, Integer>>>> entry : carriageNumberVacantSeat.entrySet()) {
                                PriorityQueue<List<Pair<Integer, Integer>>> entryValue = entry.getValue();
                                if (actualSureSeat.size() < passengerSeatDetails.size()) {
                                    List<Pair<Integer, Integer>> surplusNeedMatchSeat = SurplusNeedMatchSeatUtil.getSurplusNeedMatchSeat(passengerSeatDetails.size() - actualSureSeat.size(), entryValue);
                                    actualSureSeat.addAll(surplusNeedMatchSeat);
                                    List<String> actualSelectSeats = new ArrayList<>();
                                    for (Pair<Integer, Integer> each : surplusNeedMatchSeat) {
                                        actualSelectSeats.add("0" + (each.getKey() + 1) + SeatNumberUtil.convert(1, each.getValue() + 1));
                                    }
                                    for (String selectSeat : actualSelectSeats) {
                                        TrainPurchaseTicketRespDTO result = new TrainPurchaseTicketRespDTO();
                                        PurchaseTicketPassengerDetailDTO currentTicketPassenger = passengerSeatDetails.get(countNum.getAndIncrement());
                                        result.setSeatNumber(selectSeat);
                                        result.setSeatType(currentTicketPassenger.getSeatType());
                                        result.setCarriageNumber(entry.getKey());
                                        result.setPassengerId(currentTicketPassenger.getPassengerId());
                                        actualResult.add(result);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return actualResult;
    }

    private List<TrainPurchaseTicketRespDTO> selectSeats(SelectSeatDTO requestParam, List<String> trainCarriageList, List<Integer> trainStationCarriageRemainingTicket) {
        String trainId = requestParam.getRequestParam().getTrainId();
        String departure = requestParam.getRequestParam().getDeparture();
        String arrival = requestParam.getRequestParam().getArrival();
        List<PurchaseTicketPassengerDetailDTO> passengerSeatDetails = requestParam.getPassengerSeatDetails();
        List<TrainPurchaseTicketRespDTO> actualResult = new ArrayList<>();
        Map<String, Integer> demotionStockNumMap = new LinkedHashMap<>();
        Map<String, int[][]> actualSeatsMap = new HashMap<>();
        Map<String, int[][]> carriagesNumberSeatsMap = new HashMap<>();
        String carriagesNumber;
        for (int i = 0; i < trainStationCarriageRemainingTicket.size(); i++) {
            carriagesNumber = trainCarriageList.get(i);
            List<String> listAvailableSeat = seatService.listAvailableSeat(trainId, carriagesNumber, requestParam.getSeatType(), departure, arrival);
            int[][] actualSeats = new int[7][4];
            for (int j = 1; j < 8; j++) {
                for (int k = 1; k < 5; k++) {
                    // 当前默认按照复兴号商务座排序，后续这里需要按照简单工厂对车类型进行获取 y 轴
                    actualSeats[j - 1][k - 1] = listAvailableSeat.contains("0" + j + SeatNumberUtil.convert(1, k)) ? 0 : 1;
                }
            }
            int[][] select = SeatSelection.adjacent(passengerSeatDetails.size(), actualSeats);
            if (select != null) {
                carriagesNumberSeatsMap.put(carriagesNumber, select);
                break;
            }
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
                        carriagesNumberSeatsMap.put(carriagesNumberBack, select);
                        break;
                    }
                }
            }
            // 如果同车厢也已无法匹配，则对用户座位再次降级：不同车厢不邻座
            if (Objects.isNull(select)) {
                for (Map.Entry<String, Integer> entry : demotionStockNumMap.entrySet()) {
                    String carriagesNumberBack = entry.getKey();
                    int demotionStockNumBack = entry.getValue();
                    int[][] seats = actualSeatsMap.get(carriagesNumberBack);
                    int[][] nonAdjacentSeats = SeatSelection.nonAdjacent(demotionStockNumBack, seats);
                    carriagesNumberSeatsMap.put(entry.getKey(), nonAdjacentSeats);
                }
            }
        }
        // 乘车人员在单一车厢座位不满足，触发乘车人元分布在不同车厢
        int count = (int) carriagesNumberSeatsMap.values().stream()
                .flatMap(Arrays::stream)
                .count();
        if (CollUtil.isNotEmpty(carriagesNumberSeatsMap) && passengerSeatDetails.size() == count) {
            int countNum = 0;
            for (Map.Entry<String, int[][]> entry : carriagesNumberSeatsMap.entrySet()) {
                List<String> selectSeats = new ArrayList<>();
                for (int[] ints : entry.getValue()) {
                    selectSeats.add("0" + ints[0] + SeatNumberUtil.convert(1, ints[1]));
                }
                for (String selectSeat : selectSeats) {
                    TrainPurchaseTicketRespDTO result = new TrainPurchaseTicketRespDTO();
                    PurchaseTicketPassengerDetailDTO currentTicketPassenger = passengerSeatDetails.get(countNum++);
                    result.setSeatNumber(selectSeat);
                    result.setSeatType(currentTicketPassenger.getSeatType());
                    result.setCarriageNumber(entry.getKey());
                    result.setPassengerId(currentTicketPassenger.getPassengerId());
                    actualResult.add(result);
                }
            }
        }
        return actualResult;
    }

    private List<TrainPurchaseTicketRespDTO> selectComplexSeats(SelectSeatDTO requestParam, List<String> trainCarriageList, List<Integer> trainStationCarriageRemainingTicket) {
        String trainId = requestParam.getRequestParam().getTrainId();
        String departure = requestParam.getRequestParam().getDeparture();
        String arrival = requestParam.getRequestParam().getArrival();
        List<PurchaseTicketPassengerDetailDTO> passengerSeatDetails = requestParam.getPassengerSeatDetails();
        List<TrainPurchaseTicketRespDTO> actualResult = new ArrayList<>();
        Map<String, Integer> demotionStockNumMap = new LinkedHashMap<>();
        Map<String, int[][]> actualSeatsMap = new HashMap<>();
        Map<String, int[][]> carriagesNumberSeatsMap = new HashMap<>();
        String carriagesNumber;
        // 多人分配同一车厢邻座
        for (int i = 0; i < trainStationCarriageRemainingTicket.size(); i++) {
            carriagesNumber = trainCarriageList.get(i);
            List<String> listAvailableSeat = seatService.listAvailableSeat(trainId, carriagesNumber, requestParam.getSeatType(), departure, arrival);
            int[][] actualSeats = new int[7][4];
            for (int j = 1; j < 8; j++) {
                for (int k = 1; k < 5; k++) {
                    // 当前默认按照复兴号商务座排序，后续这里需要按照简单工厂对车类型进行获取 y 轴
                    actualSeats[j - 1][k - 1] = listAvailableSeat.contains("0" + j + SeatNumberUtil.convert(1, k)) ? 0 : 1;
                }
            }
            int[][] actualSeatsTranscript = deepCopy(actualSeats);
            List<int[][]> actualSelects = new ArrayList<>();
            List<List<PurchaseTicketPassengerDetailDTO>> splitPassengerSeatDetails = ListUtil.split(passengerSeatDetails, 2);
            for (List<PurchaseTicketPassengerDetailDTO> each : splitPassengerSeatDetails) {
                int[][] select = SeatSelection.adjacent(each.size(), actualSeatsTranscript);
                if (select != null) {
                    for (int[] ints : select) {
                        actualSeatsTranscript[ints[0] - 1][ints[1] - 1] = 1;
                    }
                    actualSelects.add(select);
                }
            }
            if (actualSelects.size() == splitPassengerSeatDetails.size()) {
                int[][] actualSelect = null;
                for (int j = 0; j < actualSelects.size(); j++) {
                    if (j == 0) {
                        actualSelect = mergeArrays(actualSelects.get(j), actualSelects.get(j + 1));
                    }
                    if (j != 0 && actualSelects.size() > 2) {
                        actualSelect = mergeArrays(actualSelect, actualSelects.get(j + 1));
                    }
                }
                carriagesNumberSeatsMap.put(carriagesNumber, actualSelect);
                break;
            }
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
        }
        // 如果邻座算法无法匹配，尝试对用户进行降级分配：同车厢不邻座
        if (CollUtil.isEmpty(carriagesNumberSeatsMap)) {
            for (Map.Entry<String, Integer> entry : demotionStockNumMap.entrySet()) {
                String carriagesNumberBack = entry.getKey();
                int demotionStockNumBack = entry.getValue();
                if (demotionStockNumBack > passengerSeatDetails.size()) {
                    int[][] seats = actualSeatsMap.get(carriagesNumberBack);
                    int[][] nonAdjacentSeats = SeatSelection.nonAdjacent(passengerSeatDetails.size(), seats);
                    if (Objects.equals(nonAdjacentSeats.length, passengerSeatDetails.size())) {
                        carriagesNumberSeatsMap.put(carriagesNumberBack, nonAdjacentSeats);
                        break;
                    }
                }
            }
        }
        // 如果同车厢也已无法匹配，则对用户座位再次降级：不同车厢不邻座
        if (CollUtil.isEmpty(carriagesNumberSeatsMap)) {
            int undistributedPassengerSize = passengerSeatDetails.size();
            for (Map.Entry<String, Integer> entry : demotionStockNumMap.entrySet()) {
                String carriagesNumberBack = entry.getKey();
                int demotionStockNumBack = entry.getValue();
                int[][] seats = actualSeatsMap.get(carriagesNumberBack);
                int[][] nonAdjacentSeats = SeatSelection.nonAdjacent(Math.min(undistributedPassengerSize, demotionStockNumBack), seats);
                undistributedPassengerSize = undistributedPassengerSize - demotionStockNumBack;
                carriagesNumberSeatsMap.put(entry.getKey(), nonAdjacentSeats);
            }
        }
        // 乘车人员在单一车厢座位不满足，触发乘车人元分布在不同车厢
        int count = (int) carriagesNumberSeatsMap.values().stream()
                .flatMap(Arrays::stream)
                .count();
        if (CollUtil.isNotEmpty(carriagesNumberSeatsMap) && passengerSeatDetails.size() == count) {
            int countNum = 0;
            for (Map.Entry<String, int[][]> entry : carriagesNumberSeatsMap.entrySet()) {
                List<String> selectSeats = new ArrayList<>();
                for (int[] ints : entry.getValue()) {
                    selectSeats.add("0" + ints[0] + SeatNumberUtil.convert(1, ints[1]));
                }
                for (String selectSeat : selectSeats) {
                    TrainPurchaseTicketRespDTO result = new TrainPurchaseTicketRespDTO();
                    PurchaseTicketPassengerDetailDTO currentTicketPassenger = passengerSeatDetails.get(countNum++);
                    result.setSeatNumber(selectSeat);
                    result.setSeatType(currentTicketPassenger.getSeatType());
                    result.setCarriageNumber(entry.getKey());
                    result.setPassengerId(currentTicketPassenger.getPassengerId());
                    actualResult.add(result);
                }
            }
        }
        return actualResult;
    }

    public static int[][] mergeArrays(int[][] array1, int[][] array2) {
        List<int[]> list = new ArrayList<>(Arrays.asList(array1));
        list.addAll(Arrays.asList(array2));
        return list.toArray(new int[0][]);
    }

    public static int[][] deepCopy(int[][] originalArray) {
        int[][] copy = new int[originalArray.length][originalArray[0].length];
        for (int i = 0; i < originalArray.length; i++) {
            System.arraycopy(originalArray[i], 0, copy[i], 0, originalArray[i].length);
        }
        return copy;
    }
}
