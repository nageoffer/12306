USE
12306_ticket;

CREATE TABLE `t_carriage`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车厢号',
    `carriage_type`   int(3) DEFAULT NULL COMMENT '车厢类型',
    `seat_count`      int(3) DEFAULT NULL COMMENT '座位数',
    `create_time`     datetime                               DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                               DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车厢表';

CREATE TABLE `t_region`
(
    `id`           bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`         varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
    `full_name`    varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区全名',
    `code`         varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区编码',
    `initial`      varchar(2) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '地区首字母',
    `spell`        varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
    `popular_flag` tinyint(1) DEFAULT NULL COMMENT '热门标识',
    `create_time`  datetime                               DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime                               DEFAULT NULL COMMENT '修改时间',
    `del_flag`     tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';

CREATE TABLE `t_seat`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `seat_type`       int(3) DEFAULT NULL COMMENT '座位类型',
    `start_station`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始站',
    `end_station`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点站',
    `price`           int(11) DEFAULT NULL COMMENT '车票价格',
    `seat_status`     int(3) DEFAULT NULL COMMENT '座位状态',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY               `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683022080920494081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='座位表';

CREATE TABLE `t_station`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `code`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车站编号',
    `name`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '车站名称',
    `spell`       varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '拼音',
    `region`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车站地区',
    `region_name` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车站地区名称',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车站表';

CREATE TABLE `t_ticket`
(
    `id`              bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`        varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `train_id`        bigint(20) DEFAULT NULL COMMENT '列车ID',
    `carriage_number` varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '车厢号',
    `seat_number`     varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '座位号',
    `passenger_id`    bigint(20) DEFAULT NULL COMMENT '乘车人ID',
    `ticket_status`   int(3) DEFAULT NULL COMMENT '车票状态',
    `create_time`     datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`        tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1682790903965503489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='车票表';

CREATE TABLE `t_train`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_number`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '列车车次',
    `train_type`     int(3) DEFAULT NULL COMMENT '列车类型 0：高铁 1：动车 2：普通车',
    `train_tag`      varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '列车标签 0：复兴号 1：智能动车组 2：静音车厢 3：支持选铺',
    `train_brand`    varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '列车品牌 0：GC-高铁/城际 1：D-动车 2：Z-直达 3：T-特快 4：K-快速 5：其他 6：复兴号 7：智能动车组',
    `start_station`  varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始站',
    `end_station`    varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点站',
    `start_region`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市',
    `end_region`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市',
    `sale_time`      datetime                                DEFAULT NULL COMMENT '销售时间',
    `sale_status`    int(3) DEFAULT NULL COMMENT '销售状态 0：可售 1：不可售 2：未知',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车表';

CREATE TABLE `t_train_station`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '车次ID',
    `station_id`     bigint(20) DEFAULT NULL COMMENT '车站ID',
    `sequence`       varchar(32) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '站点顺序',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `start_region`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市',
    `end_region`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到站时间',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出站时间',
    `stopover_time`  int(3) DEFAULT NULL COMMENT '停留时间，单位分',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点表';

CREATE TABLE `t_train_station_price`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`    bigint(20) DEFAULT NULL COMMENT '车次ID',
    `departure`   varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出发站点',
    `arrival`     varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '到达站点',
    `seat_type`   int(3) DEFAULT NULL COMMENT '座位类型',
    `price`       int(11) DEFAULT NULL COMMENT '车票价格',
    `create_time` datetime                               DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                               DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677692017354547201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点价格表';

CREATE TABLE `t_train_station_relation`
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `train_id`       bigint(20) DEFAULT NULL COMMENT '车次ID',
    `departure`      varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '出发站点',
    `arrival`        varchar(64) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '到达站点',
    `start_region`   varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始城市名称',
    `end_region`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点城市名称',
    `departure_flag` tinyint(1) DEFAULT NULL COMMENT '始发标识',
    `arrival_flag`   tinyint(1) DEFAULT NULL COMMENT '终点标识',
    `departure_time` datetime                                DEFAULT NULL COMMENT '出发时间',
    `arrival_time`   datetime                                DEFAULT NULL COMMENT '到达时间',
    `create_time`    datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`       tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY              `idx_train_id` (`train_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677689610742865921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='列车站点关系表';
