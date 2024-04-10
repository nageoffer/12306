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

package org.opengoofy.index12306.test.general;

import org.junit.jupiter.api.Test;

/**
 * 通用测试
 * 公众号：马丁玩编程，回复：加群，添加马哥微信（备注：12306）获取项目资料
 */
public final class GeneralTests {

    private final static String USER_INFO_CREATE_TABLE_SQL = "CREATE TABLE `t_user_%d` (\n" +
            "  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',\n" +
            "  `username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',\n" +
            "  `password` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',\n" +
            "  `real_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',\n" +
            "  `id_type` int(3) DEFAULT NULL COMMENT '证件类型',\n" +
            "  `id_card` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',\n" +
            "  `phone` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',\n" +
            "  `mail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',\n" +
            "  `user_type` int(3) DEFAULT NULL COMMENT '旅客类型',\n" +
            "  `verify_state` int(3) DEFAULT NULL COMMENT '审核状态',\n" +
            "  `post_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',\n" +
            "  `address` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',\n" +
            "  `create_time` datetime DEFAULT NULL COMMENT '创建时间',\n" +
            "  `update_time` datetime DEFAULT NULL COMMENT '修改时间',\n" +
            "  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',\n" +
            "  PRIMARY KEY (`id`),\n" +
            "  UNIQUE KEY `idx_username` (`username`)\n" +
            ") ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';";

    @Test
    void testUserInfoShardCreateTable() {
        var shardMacNum = 16;
        for (int i = 0; i < shardMacNum; i++) {
            System.out.println(String.format(USER_INFO_CREATE_TABLE_SQL, i));
        }
    }
}
