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
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.junit.jupiter.api.Test;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationPriceDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationPriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SpringBootTest
class TicketStationPriceTests {

    @Autowired
    private TrainStationMapper trainStationMapper;

    @Autowired
    private TrainStationPriceMapper trainStationPriceMapper;

    @Test
    void testInitData() {
        String trainId = "1";
        List<TrainStationDO> trainStations = selectTrainStations(trainId);
        List<TrainStationPriceDO> trainStationPrices = buildTrainStationPrices(trainStations);
        trainStationPrices.forEach(each -> trainStationPriceMapper.insert(each));
    }

    private List<TrainStationDO> selectTrainStations(String trainId) {
        LambdaQueryWrapper<TrainStationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationDO.class)
                .eq(TrainStationDO::getTrainId, trainId);
        List<TrainStationDO> trainStationDOS = trainStationMapper.selectList(queryWrapper);
        return trainStationDOS;
    }

    private List<TrainStationPriceDO> buildTrainStationPrices(List<TrainStationDO> trainStations) {
        List<Integer> seats = ListUtil.of(0, 1, 2); // 商务、一等、二等
        List<TrainStationPriceDO> result = new ArrayList<>();
        for (int i = 0; i < trainStations.size() - 1; i++) {
            TrainStationDO trainStationDO = trainStations.get(i);
            for (int j = i + 1; j < trainStations.size(); j++) {
                for (int k = 0; k < seats.size(); k++) {
                    TrainStationPriceDO actual = new TrainStationPriceDO();
                    actual.setTrainId(trainStationDO.getTrainId());
                    actual.setDeparture(trainStations.get(i).getDeparture());
                    actual.setArrival(trainStations.get(j).getDeparture());
                    actual.setPrice(0);
                    actual.setSeatType(seats.get(k));
                    actual.setCreateTime(new Date());
                    actual.setUpdateTime(new Date());
                    actual.setDelFlag(0);
                    result.add(actual);
                }
            }
        }
        return result;
    }
}
