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
    Email VARCHAR(50), 
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
('tg_2019_508', 'Reyanson', 'Sosai', 'reyanson@example.com', '990910703V', '3/6 Raja Road Vankala, Mannar', 0769678453),
('tg_2019_492', 'Sunil', 'Vadivel', 'sunil@example.com', '997024986V', '39A Boundary Road, Kalmunai', 0760725590),
('tg_2018_317', 'Jane', 'Jeyan', 'jane@example.com', '9876543213V', 'Elme Street, Colombo', 0756958721),
('tg_2019_509', 'Hammil', 'Rajanikanth', 'hammil@example.com', '200052104409', 'Pointpettro Road Kodikamam, Jaffna', 0766831044),
('tg_2020_841', 'Krishanth', 'Veluraj', 'krishanth@example.com', '200065432164', 'PTK Road Pandiruppu, Batticalo', 0719832164);


---------------------tg509------------------------------

CREATE TABLE `bathroom` (
  `bathroom_id` varchar(11) NOT NULL,
  `floor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `bathroom` (`bathroom_id`, `floor`) VALUES
('l1_l_b1', 'L1'),
('l1_l_b2', 'L1'),
('l1_l_b3', 'L1'),
('l1_l_b4', 'L1'),
('l1_l_b5', 'L1'),
('l1_l_b6', 'L1'),
('l1_r_b1', 'L1'),
('l1_r_b2', 'L1'),
('l1_r_b3', 'L1'),
('l1_r_b4', 'L1'),
('l1_r_b5', 'L1'),
('l1_r_b6', 'L1'),
('l2_l_b1', 'L2'),
('l2_l_b2', 'L2'),
('l2_l_b3', 'L2'),
('l2_l_b4', 'L2'),
('l2_l_b5', 'L2'),
('l2_l_b6', 'L2'),
('l2_r_b1', 'L2'),
('l2_r_b2', 'L2'),
('l2_r_b3', 'L2'),
('l2_r_b4', 'L2'),
('l2_r_b5', 'L2'),
('l2_r_b6', 'L2');


CREATE TABLE `complain` (
  `c_id` varchar(11) NOT NULL,
  `reg_no` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `action` int(2) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `complain` (`c_id`, `reg_no`, `date`, `category`, `action`, `remark`, `subject`, `description`) VALUES
('c1', 'tg_2019_101', '2023-09-03', 'room issue', 0, 'warden not approve', 'chair is broken', NULL);

CREATE TABLE `damage` (
  `damage_id` varchar(11) NOT NULL,
  `asset_id` varchar(11) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `damage` (`damage_id`, `asset_id`, `room_no`, `description`) VALUES
('d1', 'ass_t1', 101, 'table is broken.'),
('d2', 'ass_c1', 101, 'lock missing');


CREATE TABLE `notice` (
  `notice_id` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `content` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `notice` (`notice_id`, `date`, `content`, `subject`) VALUES
('n1', '2023-10-20', 'Please respect quiet hours, maintain cleanliness, and report damages. Visitors must register, and security is crucial. Follow Covid-19 guidelines, and treat fellow residents with respect. Non-compliance may result in disciplinary action. Thank you for contributing to a safe and pleasant hostel environment.', 'NOTICE FOR THE STUDENTS USING HOSTEL FACILITIES');

CREATE TABLE `repair` (
  `repair_id` varchar(11) NOT NULL,
  `asset_id` varchar(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `repair` (`repair_id`, `asset_id`, `room_no`, `date`) VALUES
('r01', 'ass_c1', 101, '2023-09-13'),
('r02', 'ass_b1', 101, '2023-10-03'),
('r03', 'ass_m1', 101, '2023-10-18');



CREATE TABLE `room` (
  `room_no` int(3) NOT NULL,
  `floor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `room` (`room_no`, `floor`) VALUES
(101, 'L1'),
(128, 'L1'),
(201, 'L2'),
(225, 'L2'),
(301, 'L3'),
(328, 'L3'),
(401, 'L4'),
(428, 'L4');



CREATE TABLE `room_asset` (
  `asset_id` varchar(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `room_no` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `room_asset` (`asset_id`, `name`, `room_no`) VALUES
('ass_b1', 'blub', 101),
('ass_b2', 'bulb', 101),
('ass_bed1', 'bed', 101),
('ass_bed2', 'bed', 101),
('ass_c1', 'cupboard', 101),
('ass_c2', 'cupboard', 101),
('ass_chair1', 'chair', 101),
('ass_chair2', 'chair', 101),
('ass_chair3', 'chair', 101),
('ass_chair4', 'chair', 101),
('ass_m1', 'mattress', 101),
('ass_m2', 'mattress', 101),
('ass_m3', 'mattress', 101),
('ass_m4', 'mattress', 101),
('ass_t1', 'table', 101),
('ass_t2', 'table', 101),
('ass_t3', 'table', 101),
('ass_t4', 'table', 101);




CREATE TABLE `toilet` (
  `toilet_id` varchar(11) NOT NULL,
  `floor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `toilet` (`toilet_id`, `floor`) VALUES
('l1_l_t1', 'L1'),
('l1_l_t2', 'L1'),
('l1_l_t3', 'L1'),
('l1_l_t4', 'L1'),
('l1_l_t5', 'L1'),
('l1_l_t6', 'L1'),
('l1_r_t1', 'L1'),
('l1_r_t2', 'L1'),
('l1_r_t3', 'L1'),
('l1_r_t4', 'L1'),
('l1_r_t5', 'L1'),
('l1_r_t6', 'L1'),
('l2_l_t1', 'L2'),
('l2_l_t2', 'L2'),
('l2_l_t3', 'L2'),
('l2_l_t4', 'L2'),
('l2_l_t5', 'L2'),
('l2_l_t6', 'L2'),
('l2_r_t1', 'L2'),
('l2_r_t2', 'L2'),
('l2_r_t3', 'L2'),
('l2_r_t4', 'L2'),
('l2_r_t5', 'L2'),
('l2_r_t6', 'L2');


ALTER TABLE `bathroom`
  ADD PRIMARY KEY (`bathroom_id`);


ALTER TABLE `complain`
  ADD PRIMARY KEY (`c_id`);


  ALTER TABLE `damage`
  ADD PRIMARY KEY (`damage_id`);


  ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);


  ALTER TABLE `repair`
  ADD PRIMARY KEY (`repair_id`);


ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`);


  ALTER TABLE `room_asset`
  ADD PRIMARY KEY (`asset_id`,`room_no`);


  ALTER TABLE `toilet`
  ADD PRIMARY KEY (`toilet_id`);


  ALTER TABLE `damage`
  ADD CONSTRAINT `damage_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`),
  ADD CONSTRAINT `damage_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `room_asset` (`asset_id`);


ALTER TABLE `repair`
  ADD CONSTRAINT `repair_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`),
  ADD CONSTRAINT `repair_ibfk_2` FOREIGN KEY (`asset_id`) REFERENCES `room_asset` (`asset_id`);


  ALTER TABLE complain
ADD FOREIGN KEY (reg_no) REFERENCES student(reg_no);





