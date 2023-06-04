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

package org.opengoofy.index12306.biz.ticketservice;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.junit.jupiter.api.Test;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.CarriageDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.SeatDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationPriceDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.CarriageMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.SeatMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationPriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@SpringBootTest
class TicketTests {

    @Autowired
    private TrainStationPriceMapper trainStationPriceMapper;
    @Autowired
    private SeatMapper seatMapper;
    @Autowired
    private CarriageMapper carriageMapper;

    @Test
    void testInitData() {
        String trainId = "1";
        List<TrainStationPriceDO> trainStationPrices = selectTrainStationPrices(trainId);
        List<CarriageDO> carriages = selectCarriages(trainId);
        List<SeatDO> businessClass = buildBusinessClass(trainStationPrices, carriages);
        businessClass.forEach(each -> seatMapper.insert(each));
        List<SeatDO> firstClass = buildFirstClass(trainStationPrices, carriages);
        firstClass.forEach(each -> seatMapper.insert(each));
        List<SeatDO> secondClass = buildSecondClass(trainStationPrices, carriages);
        secondClass.forEach(each -> seatMapper.insert(each));
    }

    public List<TrainStationPriceDO> selectTrainStationPrices(String trainId) {
        LambdaQueryWrapper<TrainStationPriceDO> queryWrapper = Wrappers.lambdaQuery(TrainStationPriceDO.class)
                .eq(TrainStationPriceDO::getTrainId, trainId);
        List<TrainStationPriceDO> trainStationPriceDOS = trainStationPriceMapper.selectList(queryWrapper);
        return trainStationPriceDOS;
    }

    public List<CarriageDO> selectCarriages(String trainId) {
        LambdaQueryWrapper<CarriageDO> queryWrapper = Wrappers.lambdaQuery(CarriageDO.class)
                .eq(CarriageDO::getTrainId, trainId);
        List<CarriageDO> carriageDOS = carriageMapper.selectList(queryWrapper);
        return carriageDOS;
    }

    private List<SeatDO> buildBusinessClass(List<TrainStationPriceDO> trainStationPrices, List<CarriageDO> carriages) {
        List<SeatDO> seats = new ArrayList<>();
        List<CarriageDO> actualCarriages = carriages.stream()
                .filter(each -> Objects.equals(each.getCarriageType(), 0))
                .collect(Collectors.toList());
        List<String> carriageNums = ListUtil.of("A", "C", "F");
        List<Integer> rows = ListUtil.of(1, 2);
        List<TrainStationPriceDO> trainStationPriceDOList = trainStationPrices.stream().filter(each -> Objects.equals(each.getSeatType(), 0)).collect(Collectors.toList());
        for (TrainStationPriceDO each : trainStationPriceDOList) {
            if (StrUtil.isEmpty(each.getArrival())) {
                continue;
            }
            for (int i = 0; i < actualCarriages.size(); i++) {
                CarriageDO carriageDO = actualCarriages.get(i);
                for (int k = 0; k < rows.size(); k++) {
                    for (int j = 0; j < carriageNums.size(); j++) {
                        SeatDO seatDO = new SeatDO();
                        seatDO.setTrainId(carriageDO.getTrainId());
                        seatDO.setCarriageNumber(carriageDO.getCarriageNumber());
                        Integer row = rows.get(k);
                        String carriageNum = carriageNums.get(j);
                        if (row == 1 && carriageNum == "C") {
                            continue;
                        }
                        seatDO.setSeatNumber("0" + row + carriageNum);
                        seatDO.setSeatType(0);
                        seatDO.setStartStation(each.getDeparture());
                        seatDO.setEndStation(each.getArrival());
                        seatDO.setSeatStatus(0);
                        seatDO.setPrice(each.getPrice());
                        seatDO.setCreateTime(new Date());
                        seatDO.setUpdateTime(new Date());
                        seatDO.setDelFlag(0);
                        seats.add(seatDO);
                    }
                }
            }
        }
        return seats;
    }

    private List<SeatDO> buildFirstClass(List<TrainStationPriceDO> trainStationPrices, List<CarriageDO> carriages) {
        List<SeatDO> seats = new ArrayList<>();
        List<CarriageDO> actualCarriages = carriages.stream()
                .filter(each -> Objects.equals(each.getCarriageType(), 1))
                .collect(Collectors.toList());
        List<String> carriageNums = ListUtil.of("A", "C", "D", "F");
        List<Integer> rows = ListUtil.of(1, 2, 3, 4, 5, 6, 7);
        List<TrainStationPriceDO> trainStationPriceDOList = trainStationPrices.stream().filter(each -> Objects.equals(each.getSeatType(), 1)).collect(Collectors.toList());
        for (TrainStationPriceDO each : trainStationPriceDOList) {
            if (StrUtil.isEmpty(each.getArrival())) {
                continue;
            }
            for (int i = 0; i < actualCarriages.size(); i++) {
                CarriageDO carriageDO = actualCarriages.get(i);
                for (int k = 0; k < rows.size(); k++) {
                    for (int j = 0; j < carriageNums.size(); j++) {
                        SeatDO seatDO = new SeatDO();
                        seatDO.setTrainId(carriageDO.getTrainId());
                        seatDO.setCarriageNumber(carriageDO.getCarriageNumber());
                        Integer row = rows.get(k);
                        String carriageNum = carriageNums.get(j);
                        seatDO.setSeatNumber("0" + row + carriageNum);
                        seatDO.setSeatType(1);
                        seatDO.setStartStation(each.getDeparture());
                        seatDO.setEndStation(each.getArrival());
                        seatDO.setSeatStatus(0);
                        seatDO.setPrice(each.getPrice());
                        seatDO.setCreateTime(new Date());
                        seatDO.setUpdateTime(new Date());
                        seatDO.setDelFlag(0);
                        seats.add(seatDO);
                    }
                }
            }
        }
        return seats;
    }

    private List<SeatDO> buildSecondClass(List<TrainStationPriceDO> trainStationPrices, List<CarriageDO> carriages) {
        List<SeatDO> seats = new ArrayList<>();
        List<CarriageDO> actualCarriages = carriages.stream()
                .filter(each -> Objects.equals(each.getCarriageType(), 2))
                .collect(Collectors.toList());
        List<String> carriageNums = ListUtil.of("A", "B", "C", "D", "F");
        List<Integer> rows = ListUtil.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18);
        List<TrainStationPriceDO> trainStationPriceDOList = trainStationPrices.stream().filter(each -> Objects.equals(each.getSeatType(), 2)).collect(Collectors.toList());
        for (TrainStationPriceDO each : trainStationPriceDOList) {
            if (StrUtil.isEmpty(each.getArrival())) {
                continue;
            }
            for (int i = 0; i < actualCarriages.size(); i++) {
                CarriageDO carriageDO = actualCarriages.get(i);
                for (int k = 0; k < rows.size(); k++) {
                    for (int j = 0; j < carriageNums.size(); j++) {
                        SeatDO seatDO = new SeatDO();
                        seatDO.setTrainId(carriageDO.getTrainId());
                        seatDO.setCarriageNumber(carriageDO.getCarriageNumber());
                        Integer row = rows.get(k);
                        String carriageNum = carriageNums.get(j);
                        if (row < 10) {
                            seatDO.setSeatNumber("0" + row + carriageNum);
                        } else {
                            seatDO.setSeatNumber(row + carriageNum);
                        }
                        seatDO.setSeatType(1);
                        seatDO.setStartStation(each.getDeparture());
                        seatDO.setEndStation(each.getArrival());
                        seatDO.setSeatStatus(0);
                        seatDO.setPrice(each.getPrice());
                        seatDO.setCreateTime(new Date());
                        seatDO.setUpdateTime(new Date());
                        seatDO.setDelFlag(0);
                        seats.add(seatDO);
                    }
                }
            }
        }
        return seats;
    }
}
