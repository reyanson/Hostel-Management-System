CREATE DATABASE user_manage;

USE user_manage;
---------------------------------Bathroom Table--------------------------------------

CREATE TABLE `bathroom` (
    `bathroom_id` varchar(10) NOT NULL PRIMARY KEY ,
    `floor` varchar(2),
    `name` varchar(50) NOT NULL
);

INSERT INTO `bathroom` (`bathroom_id`, `floor`, `name`) VALUES
('l1_l_b1', 'L1', 'level1 left bathroom1'),
('l1_l_b2', 'L1', 'level1 left bathroom2'),
('l1_l_b3', 'L1', 'level1 left bathroom3'),
('l1_l_b4', 'L1', 'level1 left bathroom4'),
('l1_l_b5', 'L1', 'level1 left bathroom5'),
('l1_l_b6', 'L1', 'level1 left bathroom6'),
('l1_r_b1', 'L1', 'level1 right bathroom1'),
('l1_r_b2', 'L1', 'level1 right bathroom2'),
('l1_r_b3', 'L1', 'level1 right bathroom3'),
('l1_r_b4', 'L1', 'level1 right bathroom4'),
('l1_r_b5', 'L1', 'level1 right bathroom5'),
('l1_r_b6', 'L1', 'level1 right bathroom6'),
('l3_l_b1', 'L3', 'level3 left bathroom1'),
('l3_l_b2', 'L3', 'level3 left bathroom2'),
('l3_l_b3', 'L3', 'level3 left bathroom3'),
('l3_l_b4', 'L3', 'level3 left bathroom4'),
('l3_l_b5', 'L3', 'level3 left bathroom5'),
('l3_l_b6', 'L3', 'level3 left bathroom6'),
('l3_r_b1', 'L3', 'level3 right bathroom1'),
('l3_r_b2', 'L3', 'level3 right bathroom2'),
('l3_r_b3', 'L3', 'level3 right bathroom3'),
('l3_r_b4', 'L3', 'level3 right bathroom4'),
('l3_r_b5', 'L3', 'level3 right bathroom5'),
('l3_r_b6', 'L3', 'level3 right bathroom6');





