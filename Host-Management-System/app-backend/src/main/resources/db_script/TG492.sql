CREATE DATABASE user_manage;

USE user_manage;


CREATE TABLE `user`
(
    `username` varchar(60)  NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`username`)
);
------------------------------------------------DEAN table--------------------------------------------------------------

CREATE TABLE `dean`
(
    `dean_id`     int(11) NOT NULL AUTO_INCREMENT,
    `first_Name`  varchar(50)  NOT NULL,
    `last_Name`   varchar(50)  NOT NULL,
    `email`       varchar(50) DEFAULT NULL,
    `nic`         varchar(12) DEFAULT NULL,
    `address`     varchar(100) NOT NULL,
    `personal_no` int(10) DEFAULT NULL,
    `office_no`   int(10) DEFAULT NULL,
    PRIMARY KEY (`dean_id`),
    UNIQUE KEY `Email` (`email`),
    UNIQUE KEY `nic` (`nic`),
    UNIQUE KEY `personal_no` (`personal_no`),
    UNIQUE KEY `office_no` (`office_no`)
);

INSERT INTO `dean` VALUES
    (2,'Chandimal','Gunaweera','chandimal@ictec.com','195756789V','24 Main Street, Galle',764567892,234567890);


------------------------------------------SECURITY TABLE----------------------------------------------------------

CREATE TABLE `security`
(
    `security_id` int(11) NOT NULL AUTO_INCREMENT,
    `first_Name`  varchar(50)  NOT NULL,
    `last_Name`   varchar(50)  NOT NULL,
    `Email`       varchar(50) DEFAULT NULL,
    `nic`         varchar(12) DEFAULT NULL,
    `address`     varchar(100) NOT NULL,
    `personal_no` int(10) NOT NULL,
    `office_no`   int(10) DEFAULT NULL,
    PRIMARY KEY (`security_id`),
    UNIQUE KEY `Email` (`Email`),
    UNIQUE KEY `nic` (`nic`),
    UNIQUE KEY `unique_email` (`Email`),
    UNIQUE KEY `unique_nic` (`nic`)
);

INSERT INTO `security` VALUES
(1,'Vimal','Gunaseela','vimal@example.com','886504257V','Patri Road Kamburupitiya, Matara',777421005,234567410),
('Srikanth', 'Davis', 'srikanth@example.com', '857654321V', 'Guard Road Kamburupitiya, Matara', 0759865123, 0234567410),
('Mithran', 'Davis', 'mithran@example.com', '830728643V', 'Guru Road Kamburupitiya, Matara', 0742000586, 0234567410);

------------------------------------------------STUDENT Table----------------------------------------------

CREATE TABLE `student`
(
    `reg_no`     varchar(255) NOT NULL,
    `address`    varchar(255) DEFAULT NULL,
    `email`      varchar(255) DEFAULT NULL,
    `first_name` varchar(255) DEFAULT NULL,
    `last_name`  varchar(255) DEFAULT NULL,
    `nic`        varchar(255) DEFAULT NULL,
    `phone_no`   int(11) DEFAULT NULL,
    PRIMARY KEY (`reg_no`)
);

INSERT INTO `student` VALUES
('TG/2019/490','39A Boundary Road, Kalmunai','kumar@example.com','Kumar','Murukeshan','997024986V',0760725590),
('TG/2019/491','3/6 Raja Road Vankala, Mannar','kamal@example.com','Kamal','Hassan','990910703V',0769678453),
('TG/2019/492','Pointpettro Road Kodikamam, Jaffna','sunil@example.com','Sunil','Vadivel','9876543213V',0756958721),
('TG/2019/494','PTK Road Pandiruppu, Batticalo','reyan@gmail.com','Reyanson','Sosai','990910804V',0766831044);

--------------------------------------------LEVEL TABLE------------------------------------------------
CREATE TABLE `level`
(
    `year`  int(4) DEFAULT NULL,
    `level` int(1) DEFAULT NULL
);

INSERT INTO `level` VALUES
(2019,3),(2022,1);

-----------------------------------------------SUB WARDEN Table---------------------------------------------------

CREATE TABLE `subwarden`
(
    `swarden_id`  int(11) NOT NULL AUTO_INCREMENT,
    `first_Name`  varchar(50)  NOT NULL,
    `last_Name`   varchar(50)  NOT NULL,
    `Email`       varchar(50) DEFAULT NULL,
    `nic`         varchar(12) DEFAULT NULL,
    `address`     varchar(100) NOT NULL,
    `personal_no` int(10) NOT NULL,
    `office_no`   int(10) NOT NULL,
    PRIMARY KEY (`swarden_id`),
    UNIQUE KEY `Email` (`Email`),
    UNIQUE KEY `nic` (`nic`)
);

---------------------------------------------------WARDEN Table------------------------------------------------------

CREATE TABLE `warden`
(
    `warden_id`   int(11) NOT NULL AUTO_INCREMENT,
    `first_Name`  varchar(50)  NOT NULL,
    `last_Name`   varchar(50)  NOT NULL,
    `Email`       varchar(50) DEFAULT NULL,
    `nic`         varchar(12) DEFAULT NULL,
    `address`     varchar(100) NOT NULL,
    `personal_no` int(10) NOT NULL,
    `office_no`   int(10) NOT NULL,
    PRIMARY KEY (`warden_id`),
    UNIQUE KEY `Email` (`Email`),
    UNIQUE KEY `nic` (`nic`)
);

INSERT INTO warden (first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('Kashun', 'Johnson', 'kasun@example.com', '918856423V', '11 Himalaya Road, Matara', 0726541834, 0234567456);





