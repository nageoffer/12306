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

package org.opengoofy.index12306.biz.payservice.handler;

import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.AlipayConfig;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeRefundModel;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.opengoofy.index12306.biz.payservice.common.enums.PayChannelEnum;
import org.opengoofy.index12306.biz.payservice.common.enums.PayTradeTypeEnum;
import org.opengoofy.index12306.biz.payservice.common.enums.TradeStatusEnum;
import org.opengoofy.index12306.biz.payservice.config.AliPayProperties;
import org.opengoofy.index12306.biz.payservice.dto.base.AliRefundRequest;
import org.opengoofy.index12306.biz.payservice.dto.base.RefundRequest;
import org.opengoofy.index12306.biz.payservice.dto.base.RefundResponse;
import org.opengoofy.index12306.biz.payservice.handler.base.AbstractRefundHandler;
import org.opengoofy.index12306.framework.starter.common.toolkit.BeanUtil;
import org.opengoofy.index12306.framework.starter.convention.exception.ServiceException;
import org.opengoofy.index12306.framework.starter.designpattern.strategy.AbstractExecuteStrategy;
import org.opengoofy.index12306.framework.starter.distributedid.toolkit.SnowflakeIdUtil;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * 阿里支付组件
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AliRefundNativeHandler extends AbstractRefundHandler implements AbstractExecuteStrategy<RefundRequest, RefundResponse> {

    private final AliPayProperties aliPayProperties;

    private final static String SUCCESS_CODE = "10000";

    private final static String FUND_CHANGE = "Y";

    @Retryable(value = {ServiceException.class}, maxAttempts = 3, backoff = @Backoff(delay = 1000, multiplier = 1.5))
    @SneakyThrows(value = AlipayApiException.class)
    @Override
    public RefundResponse refund(RefundRequest payRequest) {
        AliRefundRequest aliRefundRequest = payRequest.getAliRefundRequest();
        AlipayConfig alipayConfig = BeanUtil.convert(aliPayProperties, AlipayConfig.class);
        AlipayClient alipayClient = new DefaultAlipayClient(alipayConfig);
        AlipayTradeRefundModel model = new AlipayTradeRefundModel();
        model.setOutTradeNo(aliRefundRequest.getOrderSn());
        model.setTradeNo(aliRefundRequest.getTradeNo());
        BigDecimal payAmount = aliRefundRequest.getPayAmount();
        BigDecimal refundAmount = payAmount.divide(new BigDecimal(100));
        model.setRefundAmount(refundAmount.toString());
        model.setOutRequestNo(SnowflakeIdUtil.nextIdStr());
        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
        request.setBizModel(model);
        try {
            AlipayTradeRefundResponse response = alipayClient.execute(request);
            String responseJson = JSONObject.toJSONString(response);
            log.info("发起支付宝退款，订单号：{}，交易凭证号：{}，退款金额：{} \n调用退款响应：\n\n{}\n",
                    aliRefundRequest.getOrderSn(),
                    aliRefundRequest.getTradeNo(),
                    aliRefundRequest.getPayAmount(),
                    responseJson);
            if (!StrUtil.equals(SUCCESS_CODE, response.getCode()) || !StrUtil.equals(FUND_CHANGE, response.getFundChange())) {
                throw new ServiceException("退款失败");
            }
            return new RefundResponse(TradeStatusEnum.TRADE_CLOSED.tradeCode(), response.getTradeNo());
        } catch (AlipayApiException e) {
            throw new ServiceException("调用支付宝退款异常");
        }
    }

    @Override
    public String mark() {
        return StrBuilder.create()
                .append(PayChannelEnum.ALI_PAY.name())
                .append("_")
                .append(PayTradeTypeEnum.NATIVE.name())
                .append("_")
                .append(TradeStatusEnum.TRADE_CLOSED.tradeCode())
                .toString();
    }

    @Override
    public RefundResponse executeResp(RefundRequest requestParam) {
        return refund(requestParam);
    }
}
