CREATE DATABASE user_manage;

USE user_manage;
---------------------------------Complain Table------------------------------------

CREATE TABLE `complain`
(
    `c_id`        int(11) NOT NULL AUTO_INCREMENT,
    `reg_no`      varchar(20) DEFAULT NULL,
    `type`        varchar(20) DEFAULT NULL,
    `asset_code`  varchar(50) DEFAULT NULL,
    `subject`     varchar(50) DEFAULT NULL,
    `description` varchar(50) DEFAULT NULL,
    `created_at`  timestamp NULL DEFAULT current_timestamp (),
    `updated_at`  timestamp NULL DEFAULT current_timestamp () ON UPDATE current_timestamp (),
    `action`      int(1) DEFAULT 0,
    `remark`      varchar(50) DEFAULT NULL,
    PRIMARY KEY (`c_id`)
);

INSERT INTO `complain` VALUES
(1,'TG491',NULL,'ass_b1/101','sub','hello','2023-10-01 09:39:10','2023-11-05 04:04:18',0,NULL),
(4,'TG490',NULL,'ass_bed1/101','sub','hello','2023-11-01 13:38:25','2023-11-05 03:00:59',0,NULL),
(5,'TG494',NULL,'ass_m1/101','door broken','left side broken','2023-12-01 09:39:10','2023-11-05 04:04:10',0,NULL),
(6,'TG494','Room','ass_b1/101','Door demage','Right side corner','2023-11-05 04:33:41','2023-11-05 04:33:41',0,NULL);


CREATE TABLE `room_asset`
(
    `asset_id` varchar(11) NOT NULL,
    `name`     varchar(10) NOT NULL,
    `room_no`  int(3) NOT NULL,
    PRIMARY KEY (`asset_id`, `room_no`)
);

INSERT INTO `room_asset` VALUES
 ('ass_b1','Bulb1',101),('ass_b1','Bulb1',301),
 ('ass_b2','Bulb2',101),('ass_b2','Bulb2',301),
 ('ass_b3','Bulb3',101),('ass_b3','Bulb3',301),
 ('ass_b4','Bulb4',101),('ass_b4','Bulb4',301),
 ('ass_bed1','Bed1',101),('ass_bed1','Bed1',301),
 ('ass_bed2','Bed2',101),('ass_bed2','Bed1',301),
 ('ass_c1','Cupboard1',101),('ass_c1','Cupboard1',301),
 ('ass_c2','Cupboard2',101),('ass_c2','Cupboard2',301),
 ('ass_chair1','Chair1',101),('ass_chair1','Chair1',301),
 ('ass_chair2','Chair2',101),('ass_chair2','Chair2',301),
 ('ass_chair3','Chair3',101),('ass_chair3','Chair3',301),
 ('ass_chair4','Chair4',101),('ass_chair4','Chair4',301),
 ('ass_m1','Mattress1',101),('ass_m1','Mattress1',301),
 ('ass_m2','Mattress2',101),('ass_m2','Mattress2',301),
 ('ass_m3','Mattress3',101),('ass_m3','Mattress3',301),
 ('ass_m4','Mattress4',101),('ass_m4','Mattress4',301),
 ('ass_r1','Rack1',101),('ass_r1','Rack1',301),
 ('ass_r2','Rack2',101),('ass_r2','Rack2',301),
 ('ass_t1','Table1',101),('ass_t1','Table1',301),
 ('ass_t2','Table2',101),('ass_t2','Table2',301),
 ('ass_t3','Table3',101),('ass_t3','Table3',301),
 ('ass_t4','Table4',101),('ass_t4','Table4',301);





