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

package org.opengoofy.index12306.biz.ticketservice.service.handler.ticket.filter.query;

import cn.hutool.core.util.StrUtil;
import org.opengoofy.index12306.biz.ticketservice.dto.req.TicketPageQueryReqDTO;
import org.opengoofy.index12306.framework.starter.convention.exception.ClientException;
import org.springframework.stereotype.Component;

/**
 * 查询列车车票流程过滤器之验证数据是否为空或空的字符串
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
@Component
public class TrainTicketQueryParamNotNullChainFilter implements TrainTicketQueryChainFilter<TicketPageQueryReqDTO> {

    @Override
    public void handler(TicketPageQueryReqDTO requestParam) {
        if (StrUtil.isBlank(requestParam.getFromStation())) {
            throw new ClientException("出发地不能为空");
        }
        if (StrUtil.isBlank(requestParam.getToStation())) {
            throw new ClientException("目的地不能为空");
        }
        if (requestParam.getDepartureDate() == null) {
            throw new ClientException("出发日期不能为空");
        }
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
