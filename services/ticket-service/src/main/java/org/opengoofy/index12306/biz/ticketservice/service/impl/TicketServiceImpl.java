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
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.client.producer.SendStatus;
import org.opengoofy.index12306.biz.ticketservice.common.enums.SourceEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.TicketChainMarkEnum;
import org.opengoofy.index12306.biz.ticketservice.common.enums.TicketStatusEnum;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.StationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TicketDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationPriceDO;
import org.opengoofy.index12306.biz.ticketservice.dao.entity.TrainStationRelationDO;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.StationMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TicketMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationPriceMapper;
import org.opengoofy.index12306.biz.ticketservice.dao.mapper.TrainStationRelationMapper;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.SeatClassDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.domain.TicketListDTO;
import org.opengoofy.index12306.biz.ticketservice.dto.req.CancelTicketOrderReqDTO;
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
import org.opengoofy.index12306.biz.ticketservice.service.cache.SeatMarginCacheLoader;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.dto.TrainPurchaseTicketRespDTO;
import org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.select.TrainSeatTypeSelector;
import org.opengoofy.index12306.biz.ticketservice.toolkit.DateUtil;
import org.opengoofy.index12306.framework.starter.cache.DistributedCache;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.opengoofy.index12306.framework.starter.convention.result.Result;
import org.opengoofy.index12306.framework.starter.designpattern.chain.AbstractChainContext;
import org.opengoofy.index12306.frameworks.starter.user.core.UserContext;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static org.opengoofy.index12306.biz.ticketservice.common.constant.Index12306Constant.ADVANCE_TICKET_DAY;
import static org.opengoofy.index12306.biz.ticketservice.common.constant.RedisKeyConstant.LOCK_PURCHASE_TICKETS;
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
public class TicketServiceImpl extends ServiceImpl<TicketMapper, TicketDO> implements TicketService {

    private final TrainMapper trainMapper;
    private final TrainStationRelationMapper trainStationRelationMapper;
    private final TrainStationPriceMapper trainStationPriceMapper;
    private final DistributedCache distributedCache;
    private final TicketOrderRemoteService ticketOrderRemoteService;
    private final DelayCloseOrderSendProduce delayCloseOrderSendProduce;
    private final PayRemoteService payRemoteService;
    private final StationMapper stationMapper;
    private final TrainSeatTypeSelector trainSeatTypeSelector;
    private final SeatMarginCacheLoader seatMarginCacheLoader;
    private final AbstractChainContext<TicketPageQueryReqDTO> ticketPageQueryAbstractChainContext;
    private final AbstractChainContext<PurchaseTicketReqDTO> purchaseTicketAbstractChainContext;
    private final RedissonClient redissonClient;
    private final ConfigurableEnvironment environment;

    @Override
    public TicketPageQueryRespDTO pageListTicketQuery(TicketPageQueryReqDTO requestParam) {
        // 责任链模式 验证城市名称是否存在、不存在加载缓存等等
        ticketPageQueryAbstractChainContext.handler(TicketChainMarkEnum.TRAIN_QUERY_FILTER.name(), requestParam);
        StationDO fromStationDO = stationMapper.selectOne(Wrappers.lambdaQuery(StationDO.class)
                .eq(StationDO::getCode, requestParam.getFromStation())
        );
        StationDO toStationDO = stationMapper.selectOne(Wrappers.lambdaQuery(StationDO.class)
                .eq(StationDO::getCode, requestParam.getToStation())
        );
        LambdaQueryWrapper<TrainStationRelationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationRelationDO.class)
                .eq(TrainStationRelationDO::getStartRegion, fromStationDO.getRegionName())
                .eq(TrainStationRelationDO::getEndRegion, toStationDO.getRegionName());
        List<TrainStationRelationDO> trainStationRelationList = trainStationRelationMapper.selectList(queryWrapper);
        List<TicketListDTO> seatResults = new ArrayList<>();
        Set<Integer> trainBrandSet = new HashSet<>();
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
                result.setTrainTags(StrUtil.split(trainDO.getTrainTag(), ","));
            }
            long betweenDay = cn.hutool.core.date.DateUtil.betweenDay(each.getDepartureTime(), each.getArrivalTime(), false);
            result.setDaysArrived((int) betweenDay);
            result.setSaleStatus(new Date().after(trainDO.getSaleTime()) ? 0 : 1);
            result.setSaleTime(trainDO.getSaleTime());
            if (StrUtil.isNotBlank(trainDO.getTrainBrand())) {
                trainBrandSet.addAll(StrUtil.split(trainDO.getTrainBrand(), ",").stream().map(Integer::parseInt).toList());
            }
            LambdaQueryWrapper<TrainStationPriceDO> trainStationPriceQueryWrapper = Wrappers.lambdaQuery(TrainStationPriceDO.class)
                    .eq(TrainStationPriceDO::getDeparture, each.getDeparture())
                    .eq(TrainStationPriceDO::getArrival, each.getArrival())
                    .eq(TrainStationPriceDO::getTrainId, each.getTrainId());
            List<TrainStationPriceDO> trainStationPriceDOList = trainStationPriceMapper.selectList(trainStationPriceQueryWrapper);
            List<SeatClassDTO> seatClassList = new ArrayList<>();
            StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) distributedCache.getInstance();
            trainStationPriceDOList.forEach(item -> {
                String seatType = String.valueOf(item.getSeatType());
                String keySuffix = StrUtil.join("_", each.getTrainId(), item.getDeparture(), item.getArrival());
                Object quantityObj = stringRedisTemplate.opsForHash().get(TRAIN_STATION_REMAINING_TICKET + keySuffix, seatType);
                int quantity = Optional.ofNullable(quantityObj)
                        .map(Object::toString)
                        .map(Integer::parseInt)
                        .orElseGet(() -> {
                            Map<String, String> seatMarginMap = seatMarginCacheLoader.load(String.valueOf(each.getTrainId()), seatType, item.getDeparture(), item.getArrival());
                            return Optional.ofNullable(seatMarginMap.get(String.valueOf(item.getSeatType()))).map(Integer::parseInt).orElse(0);
                        });
                seatClassList.add(new SeatClassDTO(item.getSeatType(), quantity, new BigDecimal(item.getPrice()).divide(new BigDecimal("100"), 1, RoundingMode.HALF_UP), false));
            });
            result.setSeatClassList(seatClassList);
            seatResults.add(result);
        }
        return TicketPageQueryRespDTO.builder()
                .trainList(seatResults)
                .departureStationList(buildDepartureStationList(seatResults))
                .arrivalStationList(buildArrivalStationList(seatResults))
                .trainBrandList(trainBrandSet.stream().toList())
                .seatClassTypeList(buildSeatClassList(seatResults))
                .build();
    }

    @Override
    @Transactional(rollbackFor = Throwable.class)
    public TicketPurchaseRespDTO purchaseTickets(PurchaseTicketReqDTO requestParam) {
        // 责任链模式，验证 0：参数必填 1：参数正确性 2：列车车次余量是否充足 3：乘客是否已买当前车次等
        purchaseTicketAbstractChainContext.handler(TicketChainMarkEnum.TRAIN_PURCHASE_TICKET_FILTER.name(), requestParam);
        String trainId = requestParam.getTrainId();
        TrainDO trainDO = distributedCache.safeGet(
                TRAIN_INFO + trainId,
                TrainDO.class,
                () -> trainMapper.selectById(trainId),
                ADVANCE_TICKET_DAY,
                TimeUnit.DAYS);
        Result<String> ticketOrderResult;
        List<TicketOrderDetailRespDTO> ticketOrderDetailResults = new ArrayList<>();
        String lockKey = environment.resolvePlaceholders(String.format(LOCK_PURCHASE_TICKETS, trainId));
        RLock lock = redissonClient.getLock(lockKey);
        lock.lock();
        try {
            List<TrainPurchaseTicketRespDTO> trainPurchaseTicketResults = trainSeatTypeSelector.select(trainDO.getTrainType(), requestParam);
            List<TicketDO> ticketDOList = trainPurchaseTicketResults.stream()
                    .map(each -> TicketDO.builder()
                            .username(UserContext.getUsername())
                            .trainId(Long.parseLong(requestParam.getTrainId()))
                            .carriageNumber(each.getCarriageNumber())
                            .seatNumber(each.getSeatNumber())
                            .passengerId(each.getPassengerId())
                            .ticketStatus(TicketStatusEnum.UNPAID.getCode())
                            .build())
                    .toList();
            saveBatch(ticketDOList);
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
                            .seatType(each.getSeatType())
                            .ticketType(each.getUserType())
                            .realName(each.getRealName())
                            .build();
                    TicketOrderDetailRespDTO ticketOrderDetailRespDTO = TicketOrderDetailRespDTO.builder()
                            .amount(each.getAmount())
                            .carriageNumber(each.getCarriageNumber())
                            .seatNumber(each.getSeatNumber())
                            .idCard(each.getIdCard())
                            .idType(each.getIdType())
                            .seatType(each.getSeatType())
                            .ticketType(each.getUserType())
                            .realName(each.getRealName())
                            .build();
                    orderItemCreateRemoteReqDTOList.add(orderItemCreateRemoteReqDTO);
                    ticketOrderDetailResults.add(ticketOrderDetailRespDTO);
                });
                LambdaQueryWrapper<TrainStationRelationDO> queryWrapper = Wrappers.lambdaQuery(TrainStationRelationDO.class)
                        .eq(TrainStationRelationDO::getTrainId, trainId)
                        .eq(TrainStationRelationDO::getDeparture, requestParam.getDeparture())
                        .eq(TrainStationRelationDO::getArrival, requestParam.getArrival());
                TrainStationRelationDO trainStationRelationDO = trainStationRelationMapper.selectOne(queryWrapper);
                TicketOrderCreateRemoteReqDTO orderCreateRemoteReqDTO = TicketOrderCreateRemoteReqDTO.builder()
                        .departure(requestParam.getDeparture())
                        .arrival(requestParam.getArrival())
                        .orderTime(new Date())
                        .source(SourceEnum.INTERNET.getCode())
                        .trainNumber(trainDO.getTrainNumber())
                        .departureTime(trainStationRelationDO.getDepartureTime())
                        .arrivalTime(trainStationRelationDO.getArrivalTime())
                        .ridingDate(trainStationRelationDO.getDepartureTime())
                        .userId(UserContext.getUserId())
                        .username(UserContext.getUsername())
                        .trainId(Long.parseLong(requestParam.getTrainId()))
                        .ticketOrderItems(orderItemCreateRemoteReqDTOList)
                        .build();
                ticketOrderResult = ticketOrderRemoteService.createTicketOrder(orderCreateRemoteReqDTO);
                if (!ticketOrderResult.isSuccess() || StrUtil.isBlank(ticketOrderResult.getData())) {
                    log.error("订单服务调用失败，返回结果：{}", ticketOrderResult.getMessage());
                    throw new ServiceException("订单服务调用失败");
                }
            } catch (Throwable ex) {
                log.error("远程调用订单服务创建错误，请求参数：{}", JSON.toJSONString(requestParam), ex);
                throw ex;
            }
            try {
                // 发送 RocketMQ 延时消息，指定时间后取消订单
                DelayCloseOrderEvent delayCloseOrderEvent = DelayCloseOrderEvent.builder()
                        .trainId(requestParam.getTrainId())
                        .departure(requestParam.getDeparture())
                        .arrival(requestParam.getArrival())
                        .orderSn(ticketOrderResult.getData())
                        .trainPurchaseTicketResults(trainPurchaseTicketResults)
                        .build();
                SendResult sendResult = delayCloseOrderSendProduce.sendMessage(delayCloseOrderEvent);
                if (!Objects.equals(sendResult.getSendStatus(), SendStatus.SEND_OK)) {
                    throw new ServiceException("投递延迟关闭订单消息队列失败");
                }
            } catch (Throwable ex) {
                log.error("延迟关闭订单消息队列发送错误，请求参数：{}", JSON.toJSONString(requestParam), ex);
                throw ex;
            }
        } finally {
            lock.unlock();
        }
        return new TicketPurchaseRespDTO(ticketOrderResult.getData(), ticketOrderDetailResults);
    }

    @Override
    public PayInfoRespDTO getPayInfo(String orderSn) {
        return payRemoteService.getPayInfo(orderSn).getData();
    }

    @Override
    public void cancelTicketOrder(CancelTicketOrderReqDTO requestParam) {
        ticketOrderRemoteService.cancelTicketOrder(requestParam);
    }

    private List<String> buildDepartureStationList(List<TicketListDTO> seatResults) {
        return seatResults.stream().map(TicketListDTO::getDeparture).distinct().collect(Collectors.toList());
    }

    private List<String> buildArrivalStationList(List<TicketListDTO> seatResults) {
        return seatResults.stream().map(TicketListDTO::getArrival).distinct().collect(Collectors.toList());
    }

    private List<Integer> buildSeatClassList(List<TicketListDTO> seatResults) {
        Set<Integer> resultSeatClassList = new HashSet<>();
        for (TicketListDTO each : seatResults) {
            for (SeatClassDTO item : each.getSeatClassList()) {
                resultSeatClassList.add(item.getType());
            }
        }
        return resultSeatClassList.stream().toList();
    }
}
