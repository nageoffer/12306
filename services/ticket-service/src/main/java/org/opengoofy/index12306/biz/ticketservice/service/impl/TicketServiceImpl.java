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
import org.opengoofy.index12306.biz.ticketservice.common.enums.TrainBrandEnum;
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
import org.opengoofy.index12306.biz.ticketservice.dto.domain.RegularTrainDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.TicketListDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.req.PurchaseTicketReqDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.req.TicketPageQueryReqDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TicketOrderDetailRespDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TicketPageQueryRespDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.resp.TicketPurchaseRespDTO;
import org.opengoofy.index12306.biz.ticketservice.mq.event.DelayCloseOrderEvent;
import org.opengoofy.index12306.biz.ticketservice.mq.produce.DelayCloseOrderSendProduce;
import org.opengoofy.index12306.biz.ticketservice.remote.PayRemoteService;
import org.opengoofy.index12306.biz.ticketservice.remote.TicketOrderRemoteService;
import org.opengoofy.index12306.biz.ticketservice.remote.dto.PayInfoRespDTO;
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
    private final DelayCloseOrderSendProduce delayCloseOrderSendProduce;
    private final PayRemoteService payRemoteService;

    @Override
    public TicketPageQueryRespDTO pageListTicketQuery(TicketPageQueryReqDTO requestParam) {
        // TODO 责任链模式 验证城市名称是否存在、不存在加载缓存等等
        LambdaQueryWrapper<TrainStationRelationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationRelationDO.class)
                .eq(TrainStationRelationDO::getStartRegion, requestParam.getFromStation())
                .eq(TrainStationRelationDO::getEndRegion, requestParam.getToStation());
        List<TrainStationRelationDO> trainStationRelationList = trainStationRelationMapper.selectList(queryWrapper);
        List<TicketListDTO> seatResults = new ArrayList<>();
        Set<String> trainBrandSet = new HashSet<>();
        for (TrainStationRelationDO each : trainStationRelationList) {
            LambdaQueryWrapper<TrainDO> trainQueryWrapper = Wrappers.lambdaQuery(TrainDO.class).eq(TrainDO::getId, each.getTrainId());
            TrainDO trainDO = trainMapper.selectOne(trainQueryWrapper);
            TicketListDTO result = new TicketListDTO();
            result.setTrainId(String.valueOf(trainDO.getId()));
            result.setTrainNumber(trainDO.getTrainNumber());
            result.setDepartureTime(each.getDepartureTime());
            result.setArrivalTime(each.getArrivalTime());
            result.setDuration(DateUtil.calculateHourDifference(each.getDepartureTime(), each.getArrivalTime()));
            result.setDeparture(each.getDeparture());
            result.setArrival(each.getArrival());
            result.setDepartureFlag(each.getDepartureFlag());
            result.setArrivalFlag(each.getArrivalFlag());
            result.setTrainType(trainDO.getTrainType());
            if (StrUtil.isNotBlank(trainDO.getTrainTag())) {
                result.setTrainTag(StrUtil.split(trainDO.getTrainTag(), ","));
            }
            long betweenDay = cn.hutool.core.date.DateUtil.betweenDay(each.getDepartureTime(), each.getArrivalTime(), false);
            result.setDaysArrived((int) betweenDay);
            result.setSaleStatus(new Date().after(trainDO.getSaleTime()) ? 0 : 1);
            result.setSaleTime(trainDO.getSaleTime());
            if (StrUtil.isNotBlank(trainDO.getTrainBrand())) {
                trainBrandSet.addAll(TrainBrandEnum.findNameByCode(StrUtil.split(trainDO.getTrainBrand(), ",")));
            }
            LambdaQueryWrapper<TrainStationPriceDO> trainStationPriceQueryWrapper = Wrappers.lambdaQuery(TrainStationPriceDO.class)
                    .eq(TrainStationPriceDO::getDeparture, each.getDeparture())
                    .eq(TrainStationPriceDO::getArrival, each.getArrival())
                    .eq(TrainStationPriceDO::getTrainId, each.getTrainId());
            List<TrainStationPriceDO> trainStationPriceDOList = trainStationPriceMapper.selectList(trainStationPriceQueryWrapper);
            if (Objects.equals(trainDO.getTrainType(), 0)) {
                HighSpeedTrainDTO highSpeedTrainDTO = new HighSpeedTrainDTO();
                StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
                trainStationPriceDOList.forEach(item -> {
                    String keySuffix = StrUtil.join("_", each.getTrainId(), item.getDeparture(), item.getArrival());
                    switch (item.getSeatType()) {
                        case 0 -> {
                            String businessClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "0");
                            highSpeedTrainDTO.setBusinessClassQuantity(Integer.parseInt(businessClassQuantity));
                            highSpeedTrainDTO.setBusinessClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            highSpeedTrainDTO.setBusinessClassCandidate(false);
                        }
                        case 1 -> {
                            String firstClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "1");
                            highSpeedTrainDTO.setFirstClassQuantity(Integer.parseInt(firstClassQuantity));
                            highSpeedTrainDTO.setFirstClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            highSpeedTrainDTO.setFirstClassCandidate(false);
                        }
                        case 2 -> {
                            String secondClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "2");
                            highSpeedTrainDTO.setSecondClassQuantity(Integer.parseInt(secondClassQuantity));
                            highSpeedTrainDTO.setSecondClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            highSpeedTrainDTO.setSecondClassCandidate(false);
                        }
                        default -> {
                        }
                    }
                });
                result.setHighSpeedTrain(highSpeedTrainDTO);
                seatResults.add(result);
            } else if (Objects.equals(trainDO.getTrainType(), 1)) {
                BulletTrainDTO bulletTrainDTO = new BulletTrainDTO();
                StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
                trainStationPriceDOList.forEach(item -> {
                    String keySuffix = StrUtil.join("_", each.getTrainId(), item.getDeparture(), item.getArrival());
                    switch (item.getSeatType()) {
                        case 3 -> {
                            String secondClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "3");
                            bulletTrainDTO.setSecondClassQuantity(Integer.parseInt(secondClassQuantity));
                            bulletTrainDTO.setSecondClassPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            bulletTrainDTO.setSecondSleeperCandidate(false);
                        }
                        case 4 -> {
                            String firstSleeperQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "4");
                            bulletTrainDTO.setFirstSleeperQuantity(Integer.parseInt(firstSleeperQuantity));
                            bulletTrainDTO.setFirstSleeperPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            bulletTrainDTO.setFirstSleeperCandidate(false);
                        }
                        case 5 -> {
                            String secondSleeperQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "5");
                            bulletTrainDTO.setSecondSleeperQuantity(Integer.parseInt(secondSleeperQuantity));
                            bulletTrainDTO.setSecondSleeperPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            bulletTrainDTO.setSecondSleeperCandidate(false);
                        }
                        default -> {
                        }
                    }
                });
                result.setBulletTrain(bulletTrainDTO);
                seatResults.add(result);
            } else if (Objects.equals(trainDO.getTrainType(), 2)) {
                RegularTrainDTO regularTrainDTO = new RegularTrainDTO();
                StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
                trainStationPriceDOList.forEach(item -> {
                    String keySuffix = StrUtil.join("_", each.getTrainId(), item.getDeparture(), item.getArrival());
                    switch (item.getSeatType()) {
                        case 6 -> {
                            String secondClassQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "3");
                            regularTrainDTO.setSoftSleeperQuantity(Integer.parseInt(secondClassQuantity));
                            regularTrainDTO.setSoftSleeperPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            regularTrainDTO.setSoftSleeperCandidate(false);
                        }
                        case 7 -> {
                            String firstSleeperQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "4");
                            regularTrainDTO.setHardSleeperQuantity(Integer.parseInt(firstSleeperQuantity));
                            regularTrainDTO.setHardSleeperPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            regularTrainDTO.setHardSleeperCandidate(false);
                        }
                        case 8 -> {
                            String secondSleeperQuantity = (String) stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, "5");
                            regularTrainDTO.setHardSeatQuantity(Integer.parseInt(secondSleeperQuantity));
                            regularTrainDTO.setHardSeatPrice(item.getPrice());
                            // TODO 候补逻辑后续补充
                            regularTrainDTO.setHardSeatCandidate(false);
                        }
                        default -> {
                        }
                    }
                });
                result.setRegularTrain(regularTrainDTO);
                seatResults.add(result);
            }
        }
        return TicketPageQueryRespDTO.builder()
                .trainList(seatResults)
                .departureStationList(buildDepartureStationList(seatResults))
                .arrivalStationList(buildArrivalStationList(seatResults))
                .trainBrandList(trainBrandSet.stream().toList())
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
                abstractStrategyChoose.chooseAndExecuteResp(VehicleTypeEnum.findNameByCode(trainDO.getTrainType()) + VehicleSeatTypeEnum.findNameByCode(requestParam.getPassengers().get(0).getSeatType()), requestParam);
        // TODO 批量插入
        trainPurchaseTicketResults.forEach(each -> {
            TicketDO ticketDO = new TicketDO();
            // TODO 创建用户上下文
            ticketDO.setUsername(MDC.get(UserConstant.USER_NAME_KEY));
            ticketDO.setTrainId(Long.parseLong(requestParam.getTrainId()));
            ticketDO.setCarriageNumber(each.getCarriageNumber());
            ticketDO.setSeatNumber(each.getSeatNumber());
            ticketDO.setPassengerId(each.getPassengerId());
            ticketDO.setTicketStatus(TicketStatusEnum.UNPAID.getCode());
            ticketMapper.insert(ticketDO);
        });
        Result<String> ticketOrderResult;
        List<TicketOrderDetailRespDTO> ticketOrderDetailResults = new ArrayList<>();
        try {
            List<TicketOrderItemCreateRemoteReqDTO> orderItemCreateRemoteReqDTOList = new ArrayList<>();
            trainPurchaseTicketResults.forEach(each -> {
                TicketOrderItemCreateRemoteReqDTO orderItemCreateRemoteReqDTO = TicketOrderItemCreateRemoteReqDTO.builder()
                        .amount(each.getAmount())
                        .carriageNumber(each.getCarriageNumber())
                        .seatNumber(each.getSeatNumber())
                        .idCard(each.getIdCard())
                        .idType(each.getIdType())
                        .phone(each.getPhone())
                        .realName(each.getRealName())
                        .build();
                TicketOrderDetailRespDTO ticketOrderDetailRespDTO = TicketOrderDetailRespDTO.builder()
                        .amount(each.getAmount())
                        .carriageNumber(each.getCarriageNumber())
                        .seatNumber(each.getSeatNumber())
                        .idCard(each.getIdCard())
                        .seatType(null)
                        .idType(each.getIdType())
                        .seatType(each.getSeatType())
                        .ticketType(each.getUserType())
                        .realName(each.getRealName())
                        .build();
                orderItemCreateRemoteReqDTOList.add(orderItemCreateRemoteReqDTO);
                ticketOrderDetailResults.add(ticketOrderDetailRespDTO);
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
            // 发送 RocketMQ 延时消息，指定时间后取消订单
            delayCloseOrderSendProduce.sendMessage(new DelayCloseOrderEvent(ticketOrderResult.getData()));
        } catch (Throwable ex) {
            log.error("远程调用订单服务创建错误，请求参数：{}", JSON.toJSONString(requestParam), ex);
            // TODO 回退锁定车票
            throw ex;
        }
        if (!ticketOrderResult.isSuccess()) {
            log.error("远程调用订单服务创建失败，请求参数：{}", JSON.toJSONString(requestParam));
            // TODO 回退锁定车票
            throw new ServiceException(ticketOrderResult.getMessage());
        }
        return new TicketPurchaseRespDTO(ticketOrderResult.getData(), ticketOrderDetailResults);
    }

    @Override
    public PayInfoRespDTO getPayInfo(String orderSn) {
        return payRemoteService.getPayInfo(orderSn).getData();
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
            if (highSpeedTrain != null) {
                Optional.ofNullable(highSpeedTrain.getBusinessClassPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.BUSINESS_CLASS.getValue()));
                Optional.ofNullable(highSpeedTrain.getFirstClassPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.FIRST_CLASS.getValue()));
                Optional.ofNullable(highSpeedTrain.getSecondClassQuantity()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.SECOND_CLASS.getValue()));
            }
            BulletTrainDTO bulletTrain = each.getBulletTrain();
            if (bulletTrain != null) {
                Optional.ofNullable(bulletTrain.getFirstSleeperPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.FIRST_SLEEPER.getValue()));
                Optional.ofNullable(bulletTrain.getSecondSleeperPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.SECOND_SLEEPER.getValue()));
                Optional.ofNullable(bulletTrain.getSecondClassPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.SECOND_CLASS_CABIN_SEAT.getValue()));
                Optional.ofNullable(bulletTrain.getNoSeatPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.NO_SEAT_SLEEPER.getValue()));
            }
            RegularTrainDTO regularTrain = each.getRegularTrain();
            if (regularTrain != null) {
                Optional.ofNullable(regularTrain.getSoftSleeperPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.SOFT_SLEEPER.getValue()));
                Optional.ofNullable(regularTrain.getHardSleeperPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.HARD_SLEEPER.getValue()));
                Optional.ofNullable(regularTrain.getHardSeatPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.HARD_SEAT.getValue()));
                Optional.ofNullable(regularTrain.getNoSeatPrice()).ifPresent(item -> resultSeatClassList.add(VehicleSeatTypeEnum.NO_SEAT_SLEEPER.getValue()));
            }
        }
        return resultSeatClassList.stream().toList();
    }
}
