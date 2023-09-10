USE
12306_pay_0;

CREATE TABLE `t_pay_0`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_1`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_10`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_11`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_12`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_13`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_14`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_15`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_2`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_3`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_4`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_5`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_6`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_7`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_8`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_pay_9`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`),
    KEY                `idx_pay_sn` (`pay_sn`) USING BTREE,
    KEY                `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

CREATE TABLE `t_refund`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`         varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`       varchar(64)  DEFAULT NULL COMMENT '订单号',
    `trade_no`       varchar(64)  DEFAULT NULL COMMENT '三方交易凭证号',
    `amount`         int(11) DEFAULT NULL COMMENT '退款金额',
    `user_id`        bigint(20) DEFAULT NULL COMMENT '用户ID',
    `username`       varchar(256) DEFAULT NULL COMMENT '用户名',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '列车ID',
    `train_number`   varchar(256) DEFAULT NULL COMMENT '列车车次',
    `riding_date`    date         DEFAULT NULL COMMENT '乘车日期',
    `departure`      varchar(64)  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64)  DEFAULT NULL COMMENT '到达站点',
    `departure_time` datetime     DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime     DEFAULT NULL COMMENT '到达时间',
    `seat_type`      int(3) DEFAULT NULL COMMENT '座位类型',
    `id_type`        int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`        varchar(256) DEFAULT NULL COMMENT '证件号',
    `real_name`      varchar(256) DEFAULT NULL COMMENT '真实姓名',
    `status`         int(3) DEFAULT NULL COMMENT '订单状态',
    `refund_time`    datetime     DEFAULT NULL COMMENT '退款时间',
    `create_time`    datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    KEY              `idx_user_id` (`user_id`) USING BTREE,
    KEY              `idx_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款记录表';

USE
12306_pay_1;

CREATE TABLE `t_pay_16`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_17`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_18`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_19`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_20`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_21`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_22`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_23`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_24`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_25`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_26`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_27`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_28`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_29`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_30`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
CREATE TABLE `t_pay_31`
(
    `id`               bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pay_sn`           varchar(64)  DEFAULT NULL COMMENT '支付流水号',
    `order_sn`         varchar(64)  DEFAULT NULL COMMENT '订单号',
    `out_order_sn`     varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `channel`          varchar(64)  DEFAULT NULL COMMENT '支付渠道',
    `trade_type`       varchar(64)  DEFAULT NULL COMMENT '支付环境',
    `subject`          varchar(512) DEFAULT NULL COMMENT '订单标题',
    `order_request_id` varchar(64)  DEFAULT NULL COMMENT '商户订单号',
    `total_amount`     int(11) DEFAULT NULL COMMENT '交易总金额',
    `trade_no`         varchar(256) DEFAULT NULL COMMENT '三方交易凭证号',
    `gmt_payment`      datetime     DEFAULT NULL COMMENT '付款时间',
    `pay_amount`       int(11) DEFAULT NULL COMMENT '支付金额',
    `status`           varchar(32)  DEFAULT NULL COMMENT '支付状态',
    `create_time`      datetime     DEFAULT NULL COMMENT '创建时间',
    `update_time`      datetime     DEFAULT NULL COMMENT '修改时间',
    `del_flag`         tinyint(1) DEFAULT NULL COMMENT '删除标记 0：未删除 1：删除',
    PRIMARY KEY (`id`),
    UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';
