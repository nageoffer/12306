CREATE TABLE `t_user_0`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_1`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_10`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_11`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_12`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_13`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_14`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_15`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683025552364568577 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_2`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_3`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_4`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_5`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_6`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_7`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_8`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_9`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '用户名',
    `password`      varchar(512) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '密码',
    `real_name`     varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '真实姓名',
    `region`        varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT '0' COMMENT '国家/地区',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '证件号',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '手机号',
    `telephone`     varchar(128) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '固定电话',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci  DEFAULT NULL COMMENT '邮箱',
    `user_type`     int(3) DEFAULT NULL COMMENT '旅客类型',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `post_code`     varchar(64) COLLATE utf8mb4_unicode_ci   DEFAULT NULL COMMENT '邮编',
    `address`       varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                 DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                 DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_username` (`username`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE `t_user_deletion`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `id_type`     int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`     varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户注销表';

CREATE TABLE `t_user_mail_0`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_1`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_10`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_11`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_12`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_13`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_14`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683025552452648961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_15`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_2`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_3`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_4`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_5`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_6`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_7`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_8`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_mail_9`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `mail`          varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_mail` (`mail`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户邮箱表';

CREATE TABLE `t_user_phone_0`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_1`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683025552431677441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_10`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_11`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_12`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_13`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_14`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_15`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_2`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_3`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_4`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_5`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_6`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_7`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_8`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_phone_9`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `deletion_time` bigint(20) DEFAULT '0' COMMENT '注销时间戳',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_phone` (`phone`,`deletion_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户号码表';

CREATE TABLE `t_user_reuse`
(
    `id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`    varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `create_time` datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`    tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY           `idx_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户名复用表';


CREATE TABLE `t_passenger_0`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_1`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_10`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_11`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_12`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_13`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_14`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_15`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683029597561061377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_2`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_3`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_4`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_5`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_6`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_7`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_8`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';

CREATE TABLE `t_passenger_9`
(
    `id`            bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `username`      varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
    `real_name`     varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
    `id_type`       int(3) DEFAULT NULL COMMENT '证件类型',
    `id_card`       varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
    `discount_type` int(3) DEFAULT NULL COMMENT '优惠类型',
    `phone`         varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
    `create_date`   datetime                                DEFAULT NULL COMMENT '添加日期',
    `verify_status` int(3) DEFAULT NULL COMMENT '审核状态',
    `create_time`   datetime                                DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime                                DEFAULT NULL COMMENT '修改时间',
    `del_flag`      tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`id`),
    KEY             `idx_id_card` (`id_card`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='乘车人表';
