
CREATE DATABASE user_manage;

USE user_manage;

CREATE TABLE users(
    user_id int not null AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE ,
    password VARCHAR(255) NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (user_id)
);

CREATE TABLE user(
    username VARCHAR(60) PRIMARY KEY, 
    password VARCHAR(255) NOT NULL
);

CREATE TABLE dean(
    dean_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_Name VARCHAR(50) NOT NULL, 
    last_Name VARCHAR(50) NOT NULL, 
    Email VARCHAR(50) UNIQUE, 
    nic VARCHAR(12) UNIQUE, 
    address VARCHAR(100) NOT NULL, 
    personal_no INT(10) UNIQUE, 
    office_no INT(10) UNIQUE
);

INSERT INTO dean (first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('Chandimal', 'Gunaweera', 'chandimal@ictec.com', '195756789V', '24 Main Street, Galle', 0764567892, 0234567890);

CREATE TABLE subwarden(
    swarden_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_Name VARCHAR(50) NOT NULL, 
    last_Name VARCHAR(50) NOT NULL, 
    Email VARCHAR(50) UNIQUE, 
    nic VARCHAR(12) UNIQUE, 
    address VARCHAR(100) NOT NULL, 
    personal_no INT(10) NOT NULL, 
    office_no INT(10) NOT NULL
); 

INSERT INTO subwarden (first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('Jeyapala', 'Wardana', 'jayapala@example.com', '198756789V', '456 Park Street, Matara', 0716894375, 0234567236);


CREATE TABLE security(
    security_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_Name VARCHAR(50) NOT NULL, 
    last_Name VARCHAR(50) NOT NULL, 
    Email VARCHAR(50) UNIQUE ,
    nic VARCHAR(12) UNIQUE, 
    address VARCHAR(100) NOT NULL, 
    personal_no INT(10) NOT NULL,  
    office_no INT(10) 
); 

INSERT INTO security (first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('Vimal', 'Gunaseela', 'vimal@example.com', '886504257V', 'Patri Road Kamburupitiya, Matara', 0777421005, 0234567410),
('Srikanth', 'Davis', 'srikanth@example.com', '857654321V', 'Guard Road Kamburupitiya, Matara', 0759865123, 0234567410),
('Mithran', 'Davis', 'mithran@example.com', '830728643V', 'Guru Road Kamburupitiya, Matara', 0742000586, 0234567410);

CREATE TABLE warden(
    warden_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_Name VARCHAR(50) NOT NULL, 
    last_Name VARCHAR(50) NOT NULL, 
    Email VARCHAR(50) UNIQUE, 
    nic VARCHAR(12) UNIQUE, 
    address VARCHAR(100) NOT NULL, 
    personal_no INT(10) NOT NULL, 
    office_no INT(10) NOT NULL
);  

INSERT INTO warden (first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('Kashun', 'Johnson', 'kasun@example.com', '918856423V', '11 Himalaya Road, Matara', 0726541834, 0234567456);

CREATE TABLE student(
    reg_no VARCHAR(15) PRIMARY KEY, 
    first_Name VARCHAR(50) NOT NULL, 
    last_Name VARCHAR(50) NOT NULL, 
    Email VARCHAR(50) UNIQUE, 
    nic VARCHAR(12) UNIQUE, 
    address VARCHAR(100) NOT NULL, 
    phone_no INT(10) NOT NULL
);
INSERT INTO student (reg_no, first_Name, last_Name, Email, nic, address, phone_no)
VALUES
    ('TG/2019/492', 'Sunil', 'Vadivel', 'sunil@example.com', '997024986V', '39A Boundary Road, Kalmunai', 0760725590),
    ('TG/2019/508', 'Reyanson', 'Sosai', 'reyanson@example.com', '990910703V', '3/6 Raja Road Vankala, Mannar', 0769678453),
    ('TG/2018/317', 'Jane', 'Jeyan', 'jane@example.com', '9876543213V', 'Elme Street, Colombo', 0756958721),
    ('TG/2019/509', 'Hammil', 'Rajanikanth', 'hammil@example.com', '200052104409', 'Pointpettro Road Kodikamam, Jaffna', 0766831044),
    ('TG/2020/841', 'Krishanth', 'Veluraj', 'krishanth@example.com', '200065432164', 'PTK Road Pandiruppu, Batticalo', 0719832164);


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


CREATE TABLE complain (
c_id INT AUTO_INCREMENT PRIMARY KEY,
reg_no VARCHAR(20),
type varchar(20),
asset_code VARCHAR(50) ,
subject VARCHAR(50),
description VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
action INT(1) default 0,
remark VARCHAR(50) default null
);

ALTER TABLE complain MODIFY COLUMN action INT(2) AFTER updated_at;

ALTER TABLE complain
ADD FOREIGN KEY (reg_no) REFERENCES student(reg_no);

INSERT INTO `complain` (`c_id`, `reg_no`, `date`, `category`, `action`, `remark`, `subject`, `description`) VALUES
('c1', 'tg_2019_101', '2023-09-03', 'room issue', 0, 'warden not approve', 'chair is broken', NULL),
('c2', 'tg_2019_150', '2023-10-03', 'common issue', 1, 'warden approved', 'washroom light is not working', NULL),
('c3', 'tg_2022_1052', '2023-10-05', 'room issue', 0, 'warden not approve', 'room light is not working', NULL),
('c4', 'tg_2022_909', '2023-10-06', 'room issue', 0, 'warden not approve', 'door lock is broken', NULL);

CREATE TABLE `damage` (
  `damage_id` varchar(11) NOT NULL PRIMARY KEY ,
  `asset_id` varchar(11) NULL,
  `room_no` INT,
  `floor` varchar(11),
  `description` mediumtext NOT NULL
);


INSERT INTO `damage` (`damage_id`, `asset_id`, `room_no`, `floor`,`description`) VALUES
('d1', 'ass_t1', 101, 'NULL', 'table is broken.'),
('d2', 'ass_c1', 101, 'NULL', 'lock missing'),
('d3', 'ass_t1', 301, 'NULL', 'table is broken'),
('d4', 'ass_c2', 428, 'NULL', 'lock missing'),
('d5', 'l2_l_t3', NULL, 'L2', 'toilet bucket is broken'),
('d6', 'l3_r_b5', NULL, 'L3', 'bathroom door is broken');


CREATE TABLE `notice` (
  `notice_id` int auto_increment primary key NOT NULL,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `content` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL
);


INSERT INTO `notice` (`date`, `content`, `subject`) VALUES
('2023-10-20', 'Please respect quiet hours, maintain cleanliness, and report damages. Visitors must register, and security is crucial. Follow Covid-19 guidelines, and treat fellow residents with respect. Non-compliance may result in disciplinary action. Thank you for contributing to a safe and pleasant hostel environment.', 'NOTICE FOR THE STUDENTS USING HOSTEL FACILITIES'),
('2023-10-22', 'Dear students,\r\nStudents who are currently under the industrial training can download the attached application to request hostels for next year.  Please post the filled application and the relevant documents to the Assistant Registrar, Faculty of Technology, University of Ruhuna, Karagoda Uyangoda, Kamburupitiya before the 2023-11-01.\r\n', 'Hostel Registration Form for level 3 student'),
('2023-10-27', 'Dear student,\r\nStudents who are in the level 1 now can apply for the hostel facilities before the 2023-11-10.\r\n', 'Hostel Application for freshers');


CREATE TABLE `repair` (
  `repair_id` int auto_increment primary key NOT NULL,
  `asset_id` varchar(11) NOT NULL,
  `room_no` int(3) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ;


INSERT INTO `repair` ( `asset_id`, `room_no`) VALUES
( 'ass_c1', 101),
( 'ass_b1', 101),
( 'ass_m1', 301),
( 'ass_c2', 301);


CREATE TABLE `room` (
  room_id int auto_increment primary key,
  room_no int(3) NOT NULL,
  floor varchar(10) NOT NULL,
  reg_no varchar(15),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE room ADD FOREIGN KEY(reg_no) REFERENCES student(reg_no);

INSERT INTO `room` (`room_no`, `floor`, `reg_no`) VALUES
(201, 'L3', 'TG/2020/841'),
(401, 'L4', 'TG/2019/508'),
(428, 'L4', 'TG/2019/492');


CREATE TABLE `room_asset` (
  `asset_id` varchar(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `room_no` int(3) NOT NULL
);

ALTER TABLE `room_asset`
ADD PRIMARY KEY (`asset_id`,`room_no`);


INSERT INTO `room_asset` (`asset_id`, `name`, `room_no`) VALUES
('ass_b1', 'Bulb1', 101),
('ass_b2', 'Bulb2', 101),
('ass_b3', 'Bulb3', 101),
('ass_b4', 'Bulb4', 101),
('ass_bed1', 'Bed1', 101),
('ass_bed2', 'Bed2', 101),
('ass_c1', 'Cupboard1', 101),
('ass_c2', 'Cupboard2', 101),
('ass_chair1', 'Chair1', 101),
('ass_chair2', 'Chair2', 101),
('ass_chair3', 'Chair3', 101),
('ass_chair4', 'Chair4', 101),
('ass_m1', 'Mattress1', 101),
('ass_m2', 'Mattress2', 101),
('ass_m3', 'Mattress3', 101),
('ass_m4', 'Mattress4', 101),
('ass_t1', 'Table1', 101),
('ass_t2', 'Table2', 101),
('ass_t3', 'Table3', 101),
('ass_t4', 'Table4', 101),
('ass_r1', 'Rack1', 101),
('ass_r2', 'Rack2', 101),
('ass_b1', 'Bulb1', 301),
('ass_b2', 'Bulb2', 301),
('ass_b3', 'Bulb3', 301),
('ass_b4', 'Bulb4', 301),
('ass_bed1', 'Bed1', 301),
('ass_bed2', 'Bed1', 301),
('ass_c1', 'Cupboard1', 301),
('ass_c2', 'Cupboard2', 301),
('ass_chair1', 'Chair1', 301),
('ass_chair2', 'Chair2', 301),
('ass_chair3', 'Chair3', 301),
('ass_chair4', 'Chair4', 301),
('ass_m1', 'Mattress1', 301),
('ass_m2', 'Mattress2', 301),
('ass_m3', 'Mattress3', 301),
('ass_m4', 'Mattress4', 301),
('ass_t1', 'Table1', 301),
('ass_t2', 'Table2', 301),
('ass_t3', 'Table3', 301),
('ass_t4', 'Table4', 301),
('ass_r1', 'Rack1', 301),
('ass_r2', 'Rack2', 301)
;


CREATE TABLE `toilet` (
  `toilet_id` varchar(11) NOT NULL PRIMARY KEY,
  `floor` varchar(10),
  `name` varchar(50) NOT NULL
);


INSERT INTO `toilet` (`toilet_id`, `floor`, `name`) VALUES
('l1_l_t1', 'L1', 'Level1 left toilet1'),
('l1_l_t2', 'L1', 'Level1 left toilet2'),
('l1_l_t3', 'L1', 'Level1 left toilet3'),
('l1_l_t4', 'L1', 'Level1 left toilet4'),
('l1_l_t5', 'L1', 'Level1 left toilet5'),
('l1_r_t1', 'L1', 'Level1 right toilet1'),
('l1_r_t2', 'L1', 'Level1 right toilet2'),
('l1_r_t3', 'L1', 'Level1 right toilet3'),
('l1_r_t4', 'L1', 'Level1 right toilet4'),
('l1_r_t5', 'L1', 'Level1 right toilet5'),
('l3_l_t1', 'L3', 'Level3 left toilet1'),
('l3_l_t2', 'L3', 'Level3 left toilet2'),
('l3_l_t3', 'L3', 'Level3 left toilet3'),
('l3_l_t4', 'L3', 'Level3 left toilet4'),
('l3_l_t5', 'L3', 'Level3 left toilet5'),
('l3_r_t1', 'L3', 'Level3 right toilet1'),
('l3_r_t2', 'L3', 'Level3 right toilet2'),
('l3_r_t3', 'L3', 'Level3 right toilet3'),
('l3_r_t4', 'L3', 'Level3 right toilet4'),
('l3_r_t5', 'L3', 'Level3 right toilet5');


ALTER TABLE `complain`
  ADD PRIMARY KEY (`c_id`);

ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

ALTER TABLE `repair`
  ADD PRIMARY KEY (`repair_id`);


ALTER TABLE `damage`
  ADD CONSTRAINT `damage_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`),
  ADD CONSTRAINT `damage_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `room_asset` (`asset_id`);

ALTER TABLE `repair`
  ADD CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`),
  ADD CONSTRAINT `repair_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `room_asset` (`asset_id`);


------------------------------------------------------------------TG508----------------------------------------------------------------------------------------
/*Level table - for find student level*/
create table level (year int(4), level int(1));
INSERT INTO level VALUES 
(2019,3),
(2022,1);








