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

package org.opengoofy.index12306.biz.ticketservice.job;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.RequiredArgsConstructor;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationRelationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationRelationMapper;
import org.opengoofy.index12306.biz.ticketservice.job.base.AbstractTrainStationJobHandlerTemplate;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.Index12306Constant.ADVANCE_TICKET_DAY;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_STATION_REMAINING_TICKET;

/**
 * 列车站点余票定时任务
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@RestController
@RequiredArgsConstructor
public class TrainStationRemainingTicketJobHandler extends AbstractTrainStationJobHandlerTemplate {

    private final TrainStationRelationMapper trainStationRelationMapper;
    private final DistributedCache distributedCache;

    @XxlJob(value = "trainStationRemainingTicketJobHandler")
    @GetMapping("/api/ticket-service/train-station-remaining-ticket/job/cache-init/execute")
    @Override
    public void execute() {
        super.execute();
    }

    @Override
    protected void actualExecute(List<TrainDO> trainDOPageRecords) {
        for (TrainDO each : trainDOPageRecords) {
            LambdaQueryWrapper<TrainStationRelationDO> relationQueryWrapper = Wrappers.lambdaQuery(TrainStationRelationDO.class)
                    .eq(TrainStationRelationDO::getTrainId, each.getId());
            List<TrainStationRelationDO> trainStationRelationDOList = trainStationRelationMapper.selectList(relationQueryWrapper);
            if (CollUtil.isEmpty(trainStationRelationDOList)) {
                return;
            }
            for (TrainStationRelationDO item : trainStationRelationDOList) {
                StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
                // TODO 需要考虑动态库存逻辑&列车类型
                Map<String, String> trainStationRemainingTicket = MapUtil.builder("0", "10")
                        .put("1", "140")
                        .put("2", "810")
                        .put("3", "96")
                        .put("4", "192")
                        .put("5", "216")
                        .build();
                String buildCacheKey = TRAIN_STATION_REMAINING_TICKET + StrUtil.join("_", each.getId(), item.getDeparture(), item.getArrival());
                stringRedisTemplate.opsForHash().putAll(buildCacheKey, trainStationRemainingTicket);
                stringRedisTemplate.expire(buildCacheKey, ADVANCE_TICKET_DAY, TimeUnit.DAYS);
            }
        }
    }
}
