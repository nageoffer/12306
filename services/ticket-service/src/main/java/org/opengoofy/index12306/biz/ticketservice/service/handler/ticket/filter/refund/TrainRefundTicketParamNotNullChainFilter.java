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

package org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.filter.refund;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import org.opengoofy.index12306.biz.ticketservice.common.enums.RefundTypeEnum;
import org.opengoofy.index12306.biz.ticketservice.dto.req.RefundTicketReqDTO;
import org.opengoofy.index12306.framework.starter.convention.exception.ClientException;
import org.springframework.stereotype.Component;

/**
 * 列车车票退款流程过滤器之验证数据是否为空或空的字符串
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
public class TrainRefundTicketParamNotNullChainFilter implements TrainRefundTicketChainFilter<RefundTicketReqDTO> {

    @Override
    public void handler(RefundTicketReqDTO requestParam) {
        if (StrUtil.isBlank(requestParam.getOrderSn())) {
            throw new ClientException("订单号不能为空");
        }
        if (requestParam.getType() == null) {
            throw new ClientException("退款类型不能为空");
        }
        if (requestParam.getType().equals(RefundTypeEnum.PARTIAL_REFUND.getType())) {
            if (CollUtil.isEmpty(requestParam.getSubOrderRecordIdReqList())) {
                throw new ClientException("部分退款子订单记录集合不能为空");
            }
        }
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
