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

package org.opengoofy.index12306.biz.ticketservice.service.impl;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.opengoofy.index12306.biz.ticketservice.common.enums.SourceEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.TicketStatusEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.TrainTagEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleSeatTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.VehicleTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TicketDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationPriceDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationRelationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TicketMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationPriceMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationRelationMapper;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.BulletTrainDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.HighSpeedTrainDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.PassengerInfoDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.RegularTrainDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.TicketListDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.req.PurchaseTicketReqDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.req.TicketPageQueryReqDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TicketPageQueryRespDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TicketPurchaseRespDTO;
import org.opengoofy.index12306.biz.ticketservice.remote.TicketOrderRemoteService;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.TicketOrderCreateRemoteReqDTO;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.TicketOrderItemCreateRemoteReqDTO;
import org.opengoofy.index12306.biz.ticketservice.service.TicketService;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.TrainPurchaseTicketRespDTO;
import org.opengoofy.index12306.biz.ticketservice.toolkit.DateUtil;
import org.opengoofy.index12306.framework.starter.bases.constant.UserConstant;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.opengoofy.index12306.framework.starter.convention.result.Result;
import org.opengoofy.index12306.framework.starter.designpattern.strategy.AbstractStrategyChoose;
import org.slf4j.MDC;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.Index12306Constant.ADVANCE_TICKET_DAY;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_INFO;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.TRAIN_STATION_REMAINING_TICKET;

/**
 * 车票接口实现
 *
 * @公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService {

    private final TrainMapper trainMapper;
    private final TrainStationRelationMapper trainStationRelationMapper;
    private final TrainStationPriceMapper trainStationPriceMapper;
    private final DistributedCache distributedCache;
    private final AbstractStrategyChoose abstractStrategyChoose;
    private final TicketMapper ticketMapper;
    private final TicketOrderRemoteService ticketOrderRemoteService;

    @Override
    public TicketPageQueryRespDTO pageListTicketQuery(TicketPageQueryReqDTO requestParam) {
        // TODO 责任链模式 验证城市名称是否存在、不存在加载缓存等等
        LambdaQueryWrapper<TrainStationRelationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationRelationDO.class)
                .eq(TrainStationRelationDO::getStartRegion, requestParam.getFromStation())
                .eq(TrainStationRelationDO::getEndRegion, requestParam.getToStation());
        List<TrainStationRelationDO> trainStationRelationList = trainStationRelationMapper.selectList(queryWrapper);
        List<TicketListDTO> seatResults = new ArrayList<>();
        List<String> trainBrandList = new ArrayList<>();
        for (TrainStationRelationDO each : trainStationRelationList) {
            LambdaQueryWrapper<TrainDO> trainQueryWrapper = Wrappers.lambdaQuery(TrainDO.class).eq(TrainDO::getId, each.getTrainId());
            TrainDO trainDO = trainMapper.selectOne(trainQueryWrapper);
            TicketListDTO result = new TicketListDTO();
            result.setTrainNumber(trainDO.getTrainNumber());
            result.setDepartureTime(each.getDepartureTime());
            result.setArrivalTime(each.getArrivalTime());
            result.setDuration(DateUtil.calculateHourDifference(each.getDepartureTime(), each.getArrivalTime()));
            result.setDeparture(each.getDeparture());
            result.setArrival(each.getArrival());
            result.setDepartureFlag(each.getDepartureFlag());
            result.setArrivalFlag(each.getArrivalFlag());
            if (StrUtil.isNotBlank(trainDO.getTrainBrand())) {
                trainBrandList.addAll(TrainTagEnum.findNameByCode(StrUtil.split(trainDO.getTrainBrand(), ",")));
            }
            if (Objects.equals(trainDO.getTrainType(), 0)) {
                HighSpeedTrainDTO highSpeedTrainDTO = new HighSpeedTrainDTO();
                LambdaQueryWrapper<TrainStationPriceDO> trainStationPriceQueryWrapper = Wrappers.lambdaQuery(TrainStationPriceDO.class)
                        .eq(TrainStationPriceDO::getDeparture, each.getDeparture())
                        .eq(TrainStationPriceDO::getArrival, each.getArrival())
                        .eq(TrainStationPriceDO::getTrainId, each.getTrainId());
                List<TrainStationPriceDO> trainStationPriceDOList = trainStationPriceMapper.selectList(trainStationPriceQueryWrapper);
                StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
                trainStationPriceDOList.forEach(item -> {
                    String keySuffix = StrUtil.join("_", each.getTrainId(), item.getDeparture(), item.getArrival());
                    switch (item.getSeatType()) {
                        case 0:
                            String businessClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "0");
                            highSpeedTrainDTO.setBusinessClassQuantity(Integer.parseInt(businessClassQuantity));
                            highSpeedTrainDTO.setBusinessClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            highSpeedTrainDTO.setBusinessClassCandidate(false);
                            break;
                        case 1:
                            String firstClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "1");
                            highSpeedTrainDTO.setFirstClassQuantity(Integer.parseInt(firstClassQuantity));
                            highSpeedTrainDTO.setFirstClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            highSpeedTrainDTO.setFirstClassCandidate(false);
                            break;
                        case 2:
                            String secondClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "2");
                            highSpeedTrainDTO.setSecondClassQuantity(Integer.parseInt(secondClassQuantity));
                            highSpeedTrainDTO.setSecondClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            highSpeedTrainDTO.setSecondClassCandidate(false);
                            break;
                        default:
                            break;
                    }
                });
                result.setHighSpeedTrain(highSpeedTrainDTO);
                seatResults.add(result);
            }
        }
        return TicketPageQueryRespDTO.builder()
                .trainList(seatResults)
                .departureStationList(buildDepartureStationList(seatResults))
                .arrivalStationList(buildArrivalStationList(seatResults))
                .trainBrandList(trainBrandList)
                .seatClassList(buildSeatClassList(seatResults))
                .build();
    }

    @Override
    @Transactional(rollbackFor = Throwable.class)
    public TicketPurchaseRespDTO purchaseTickets(PurchaseTicketReqDTO requestParam) {
        String trainId = requestParam.getTrainId();
        TrainDO trainDO = distributedCache.get(
                TRAIN_INFO + trainId,
                TrainDO.class,
                () -> trainMapper.selectById(trainId),
                ADVANCE_TICKET_DAY,
                TimeUnit.DAYS);
        List<TrainPurchaseTicketRespDTO> trainPurchaseTicketResults =
                abstractStrategyChoose.chooseAndExecuteResp(VehicleTypeEnum.findNameByCode(trainDO.getTrainType()) + VehicleSeatTypeEnum.findNameByCode(requestParam.getSeatType()), requestParam);
        // TODO 批量插入
        trainPurchaseTicketResults.forEach(each -> {
            PassengerInfoDTO passengerInfo = each.getPassengerInfo();
            TicketDO ticketDO = new TicketDO();
            // TODO 创建用户上下文
            ticketDO.setUsername(MDC.get(UserConstant.USER_NAME_KEY));
            ticketDO.setTrainId(Long.parseLong(requestParam.getTrainId()));
            ticketDO.setCarriageNumber(each.getCarriageNumber());
            ticketDO.setSeatNumber(each.getSeatNumber());
            ticketDO.setPassengerId(passengerInfo.getPassengerId());
            ticketDO.setTicketStatus(TicketStatusEnum.UNPAID.getCode());
            ticketMapper.insert(ticketDO);
        });
        Result<String> ticketOrderResult;
        try {
            List<TicketOrderItemCreateRemoteReqDTO> orderItemCreateRemoteReqDTOList = new ArrayList<>();
            trainPurchaseTicketResults.forEach(each -> {
                PassengerInfoDTO passengerInfo = each.getPassengerInfo();
                TicketOrderItemCreateRemoteReqDTO orderItemCreateRemoteReqDTO = TicketOrderItemCreateRemoteReqDTO.builder()
                        .amount(each.getAmount())
                        .carriageNumber(each.getCarriageNumber())
                        .seatNumber(each.getSeatNumber())
                        .idCard(passengerInfo.getIdCard())
                        .idType(passengerInfo.getIdType())
                        .phone(passengerInfo.getPhone())
                        .realName(passengerInfo.getRealName())
                        .build();
                orderItemCreateRemoteReqDTOList.add(orderItemCreateRemoteReqDTO);
            });
            TicketOrderCreateRemoteReqDTO orderCreateRemoteReqDTO = TicketOrderCreateRemoteReqDTO.builder()
                    .departure(requestParam.getDeparture())
                    .arrival(requestParam.getArrival())
                    .orderTime(new Date())
                    .source(SourceEnum.INTERNET.getCode())
                    // TODO 创建用户上下文
                    .username(MDC.get(UserConstant.USER_NAME_KEY))
                    .trainId(Long.parseLong(requestParam.getTrainId()))
                    .ticketOrderItems(orderItemCreateRemoteReqDTOList)
                    .build();
            ticketOrderResult = ticketOrderRemoteService.createTicketOrder(orderCreateRemoteReqDTO);
        } catch (Throwable ex) {
            log.error("远程调用订单服务创建错误，请求参数：{}", JSON.toJSONString(requestParam), ex);
            // TODO 回退锁定车票
            throw ex;
        }
        if (ticketOrderResult == null || !ticketOrderResult.isSuccess()) {
            log.error("远程调用订单服务创建失败，请求参数：{}", JSON.toJSONString(requestParam));
            // TODO 回退锁定车票
            throw new ServiceException(ticketOrderResult.getMessage());
        }
        return new TicketPurchaseRespDTO(ticketOrderResult.getData());
    }

    private List<String> buildDepartureStationList(List<TicketListDTO> seatResults) {
        return seatResults.stream().map(TicketListDTO::getDeparture).distinct().collect(Collectors.toList());
    }

    private List<String> buildArrivalStationList(List<TicketListDTO> seatResults) {
        return seatResults.stream().map(TicketListDTO::getArrival).distinct().collect(Collectors.toList());
    }

    private List<String> buildSeatClassList(List<TicketListDTO> seatResults) {
        Set<String> resultSeatClassList = new HashSet<>();
        for (TicketListDTO each : seatResults) {
            HighSpeedTrainDTO highSpeedTrain = each.getHighSpeedTrain();
            Optional.ofNullable(highSpeedTrain.getBusinessClassPrice()).ifPresent(item -> resultSeatClassList.add("商务座"));
            Optional.ofNullable(highSpeedTrain.getFirstClassPrice()).ifPresent(item -> resultSeatClassList.add("一等座"));
            Optional.ofNullable(highSpeedTrain.getSecondClassQuantity()).ifPresent(item -> resultSeatClassList.add("二等座"));
            // 其余省略... 后续有精力再补充
            BulletTrainDTO bulletTrain = each.getBulletTrain();
            RegularTrainDTO regularTrain = each.getRegularTrain();
        }
        return resultSeatClassList.stream().toList();
    }
}
