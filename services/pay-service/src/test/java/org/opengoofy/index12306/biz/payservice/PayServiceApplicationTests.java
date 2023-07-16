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

package org.opengoofy.index12306.biz.payservice;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PayServiceApplicationTests {

    private static final String SQL = "CREATE TABLE `t_pay_%d` (\n" +
            "  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',\n" +
            "  `pay_sn` varchar(64) DEFAULT NULL COMMENT '支付流水号',\n" +
            "  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单号',\n" +
            "  `out_order_sn` varchar(64) DEFAULT NULL COMMENT '商户订单号',\n" +
            "  `channel` varchar(64) DEFAULT NULL COMMENT '支付渠道',\n" +
            "  `trade_type` varchar(64) DEFAULT NULL COMMENT '支付环境',\n" +
            "  `subject` varchar(512) DEFAULT NULL COMMENT '订单标题',\n" +
            "  `order_request_id` varchar(64) DEFAULT NULL COMMENT '商户订单号',\n" +
            "  `total_amount` int(11) DEFAULT NULL COMMENT '交易总金额',\n" +
            "  `trade_no` varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',\n" +
            "  `gmt_payment` datetime DEFAULT NULL COMMENT '付款时间',\n" +
            "  `pay_amount` int(11) DEFAULT NULL COMMENT '支付金额',\n" +
            "  `status` varchar(32) DEFAULT NULL COMMENT '支付状态',\n" +
            "  `create_time` datetime DEFAULT NULL COMMENT '创建时间',\n" +
            "  `update_time` datetime DEFAULT NULL COMMENT '修改时间',\n" +
            "  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',\n" +
            "  PRIMARY KEY (`id`),\n" +
            "  UNIQUE KEY `id` (`id`)\n" +
            ") ENGINE=InnoDB AUTO_INCREMENT=1680579778637770753 DEFAULT CHARSET=utf8mb4 COMMENT='支付表';";

    @Test
    void contextLoads() {
        for (int i = 0; i < 16; i++) {
            System.out.printf((SQL) + "%n", i);
        }
    }

}
