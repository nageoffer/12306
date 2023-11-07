USE
12306_user_0;

INSERT INTO `t_passenger_15` (`id`, `username`, `real_name`, `id_type`, `id_card`, `discount_type`, `phone`,
                              `create_date`, `verify_status`, `create_time`, `update_time`, `del_flag`)
VALUES (1683029289099362304, 'admin', '万重山', 0, '7XT4j1iCfK8DeSiZeJs1M00oDOG/KxdBXKR34j5YLZc=', 0,
        'MZObk+5TeYPLHtP2A6+aiw==', '2023-07-23 16:20:26', 0, '2023-07-23 16:20:26', '2023-07-23 16:20:26', 0),
       (1683029597561061376, 'admin', '金来', 0, 'R0L4oYtT1xHe04P4h9qmZycS0T45NS7WO6J58AqzJgs=', 0,
        'RPKP/q6lpWsY06C178ARjA==', '2023-07-23 16:21:40', 0, '2023-07-23 16:21:40', '2023-07-23 16:21:40', 0);

INSERT INTO `t_user_15` (`id`, `username`, `password`, `real_name`, `region`, `id_type`, `id_card`, `phone`,
                         `telephone`, `mail`, `user_type`, `verify_status`, `post_code`, `address`, `deletion_time`,
                         `create_time`, `update_time`, `del_flag`)
VALUES (1683025552364568576, 'admin', 'admin123456', '徐万里', '0', 0, 'r1yuubeRZATLkpBLkPT33CNry/L2FXqTDGTfW00JqPk=',
        'yKZz0xLyjNb9LSCOCfJD4w==', NULL, 'i00jYS6pbWVtSXB4iAMuJ9vd6cnZ4rz4qKBAXQ9C9oU=', 0, 0, NULL, NULL, 0,
        '2023-07-23 16:05:35', '2023-07-23 16:05:35', 0);

INSERT INTO `t_user_mail_14` (`id`, `username`, `mail`, `deletion_time`, `create_time`, `update_time`, `del_flag`)
VALUES (1683025552452648960, 'admin', 'machen@apache.org', 0, '2023-07-23 16:05:35', '2023-07-23 16:05:35', 0);

INSERT INTO `t_user_phone_1` (`id`, `username`, `phone`, `deletion_time`, `create_time`, `update_time`, `del_flag`)
VALUES (1683025552431677440, 'admin', '15601166692', 0, '2023-07-23 16:05:35', '2023-07-23 16:05:35', 0);
