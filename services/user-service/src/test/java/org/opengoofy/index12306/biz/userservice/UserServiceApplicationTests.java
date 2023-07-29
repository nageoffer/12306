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

package org.opengoofy.index12306.biz.userservice;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserServiceApplicationTests {

    private static final String SQL = "CREATE TABLE `t_passenger_%d` (\n" +
            "  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',\n" +
            "  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',\n" +
            "  `real_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',\n" +
            "  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',\n" +
            "  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',\n" +
            "  `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',\n" +
            "  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',\n" +
            "  `create_date` datetime DEFAULT NULL COMMENT '添加日期',\n" +
            "  `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',\n" +
            "  `create_time` datetime DEFAULT NULL COMMENT '创建时间',\n" +
            "  `update_time` datetime DEFAULT NULL COMMENT '修改时间',\n" +
            "  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',\n" +
            "  PRIMARY KEY (`id`)\n" +
            ") ENGINE=InnoDB AUTO_INCREMENT=1679166254708391937 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';";

    @Test
    void contextLoads() {
        for (int i = 0; i < 16; i++) {
            System.out.println(String.format(SQL, i));
        }
    }
}
