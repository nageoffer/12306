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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.junit.jupiter.api.Test;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationPriceDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationPriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class TicketStationPriceTests {

    @Autowired
    private TrainMapper trainMapper;

    @Autowired
    private TrainStationMapper trainStationMapper;

    @Autowired
    private TrainStationPriceMapper trainStationPriceMapper;

    @Test
    void testInitData() {
        String trainId = "4";
        Map<String, Map<Integer, Integer>> priceMap = new HashMap<>();
        // 初始化动车数据
        // priceMap.put("北京-德州", buildBulletPriceMap(7500, 15300, 13000, 7500));
        // priceMap.put("北京-南京", buildBulletPriceMap(23300, 44300, 37700, 23300));
        // priceMap.put("北京-嘉兴", buildBulletPriceMap(30900, 58700, 49900, 30900));
        // priceMap.put("北京-海宁", buildBulletPriceMap(31500, 59700, 50800, 31500));
        // priceMap.put("北京-杭州", buildBulletPriceMap(32800, 6220, 52900, 32800));
        // priceMap.put("德州-南京", buildBulletPriceMap(15700, 29900, 25400, 15700));
        // priceMap.put("德州-嘉兴", buildBulletPriceMap(23300, 44300, 37700, 23300));
        // priceMap.put("德州-海宁", buildBulletPriceMap(23900, 45400, 38600, 23900));
        // priceMap.put("德州-杭州", buildBulletPriceMap(25200, 47800, 40700, 25200));
        // priceMap.put("南京-嘉兴", buildBulletPriceMap(7600, 15300, 13000, 7600));
        // priceMap.put("南京-海宁", buildBulletPriceMap(8100, 15500, 13200, 8100));
        // priceMap.put("南京-杭州", buildBulletPriceMap(9400, 17900, 15300, 9400));
        // priceMap.put("嘉兴-海宁", buildBulletPriceMap(600, 15300, 13000, 600));
        // priceMap.put("嘉兴-杭州", buildBulletPriceMap(1900, 15300, 13000, 1900));
        // priceMap.put("海宁-杭州", buildBulletPriceMap(1300, 15300, 13000, 1300));
        priceMap.put("北京南-杭州东", buildBulletPriceMap(32800, 6220, 52900, 32800));
        List<TrainStationDO> trainStations = selectTrainStations(trainId);
        List<TrainStationPriceDO> trainStationPrices = buildTrainStationPrices(trainId, priceMap, trainStations);
        trainStationPrices.forEach(each -> trainStationPriceMapper.insert(each));
    }

    private List<TrainStationDO> selectTrainStations(String trainId) {
        LambdaQueryWrapper<TrainStationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationDO.class)
                .eq(TrainStationDO::getTrainId, trainId);
        return trainStationMapper.selectList(queryWrapper);
    }

    private List<TrainStationPriceDO> buildTrainStationPrices(String trainId, Map<String, Map<Integer, Integer>> priceMap, List<TrainStationDO> trainStations) {
        TrainDO trainDO = trainMapper.selectById(trainId);
        Integer trainType = trainDO.getTrainType();
        List<Integer> seatTypes = VehicleTypeEnum.findSeatTypesByCode(trainType);
        List<TrainStationPriceDO> result = new ArrayList<>();
        for (int i = 0; i < trainStations.size() - 1; i++) {
            TrainStationDO trainStationDO = trainStations.get(i);
            for (int j = i + 1; j < trainStations.size(); j++) {
                for (Integer seatType : seatTypes) {
                    TrainStationPriceDO actual = new TrainStationPriceDO();
                    actual.setTrainId(trainStationDO.getTrainId());
                    String departure = trainStations.get(i).getDeparture();
                    actual.setDeparture(departure);
                    String arrival = trainStations.get(j).getDeparture();
                    actual.setArrival(arrival);
                    Map<Integer, Integer> integerIntegerMap = priceMap.get(departure + "-" + arrival);
                    Integer price = integerIntegerMap.get(seatType);
                    actual.setPrice(price);
                    actual.setSeatType(seatType);
                    actual.setCreateTime(new Date());
                    actual.setUpdateTime(new Date());
                    actual.setDelFlag(0);
                    result.add(actual);
                }
            }
        }
        return result;
    }

    private Map<Integer, Integer> buildBulletPriceMap(Integer secondClassCabinSeat, Integer firstSleeper, Integer secondSleeper, Integer noSeatSleeper) {
        Map<Integer, Integer> priceMap = new HashMap<>();
        // priceMap.put(3, secondClassCabinSeat);
        // priceMap.put(4, firstSleeper);
        // priceMap.put(5, secondSleeper);
        // priceMap.put(10, noSeatSleeper);
        priceMap.put(6, secondClassCabinSeat);
        priceMap.put(7, firstSleeper);
        priceMap.put(8, secondSleeper);
        priceMap.put(10, noSeatSleeper);
        return priceMap;
    }
}
