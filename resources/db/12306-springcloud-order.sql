USE
12306_order_0;

CREATE TABLE `t_order_0`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_1`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_10`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_11`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_12`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_13`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_14`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_15`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_2`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_3`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_4`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_5`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_6`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_7`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_8`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_9`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

CREATE TABLE `t_order_item_0`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_1`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_10`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_11`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_12`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_13`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_14`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_15`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_2`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_3`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_4`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_5`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_6`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_7`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_8`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_9`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';

CREATE TABLE `t_order_item_passenger_0`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_1`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_10`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_11`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_12`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_13`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_14`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_15`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_2`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_3`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_4`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_5`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_6`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_7`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_8`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

CREATE TABLE `t_order_item_passenger_9`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';

USE
12306_order_1;

CREATE TABLE `t_order_16`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_16`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_16`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_17`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_17`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_17`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_18`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_18`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_18`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_19`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_19`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_19`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_20`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_20`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_20`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_21`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_21`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_21`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_22`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_22`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_22`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_23`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_23`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_23`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_24`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_24`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_24`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_25`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_25`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_25`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_26`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_26`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_26`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_27`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_27`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_27`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_28`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_28`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_28`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_29`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_29`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_29`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_30`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_30`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_30`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
CREATE TABLE `t_order_31`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date                                    DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `source`         int(3) DEFAULT NULL COMMENT '订单来源',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `order_time`     datetime                                DEFAULT NULL COMMENT '下单时间',
    `pay_type`       int(3) DEFAULT NULL COMMENT '支付方式',
    `pay_time`       datetime                                DEFAULT NULL COMMENT '支付时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';
CREATE TABLE `t_order_item_31`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `user_id`         bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `real_name`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`         int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`         varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `ticket_type`     int(3) DEFAULT NULL COMMENT '车票类型',
    `phone`           varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `status`          int(3) DEFAULT NULL COMMENT '订单状态',
    `amount`          int(11) DEFAULT NULL COMMENT '订单金额',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_order_sn` (`order_sn`) USING BTREE,
    KEY               `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细表';
CREATE TABLE `t_order_item_passenger_31`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `order_sn`    varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '订单号',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人订单关系表';
