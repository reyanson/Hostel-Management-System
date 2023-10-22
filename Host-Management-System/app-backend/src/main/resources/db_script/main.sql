CREATE DATABASE user_manage;

USE user_manage;

CREATE TABLE users(
    user_id int not null AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE ,
    password VARCHAR(255) NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (user_id)

);


---------------------tg509------------------------------

CREATE TABLE `bathroom` (
  `bathroom_id` varchar(11) NOT NULL,
  `floor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `bathroom` (`bathroom_id`, `floor`) VALUES
('b01', 'ground flo'),
('b02', 'ground flo'),
('b03', '1st floor'),
('b04', '1st floor'),
('b05', '2nd floor'),
('b06', '2nd floor'),
('b07', '3rd floor'),
('b08', '3rd floor');


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
('c01', 'tg_2019_101', '2023-09-03', 'room issue', 0, 'warden not approve', 'chair is broken', NULL);


CREATE TABLE `damage` (
  `damage_id` varchar(11) NOT NULL,
  `asset_id` varchar(11) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `damage` (`damage_id`, `asset_id`, `description`) VALUES
('d01', 'a04', 'table is broken.'),
('d02', 'a09', 'lock missing');



CREATE TABLE `notice` (
  `notice_id` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `content` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `notice` (`notice_id`, `date`, `content`, `subject`) VALUES
('n01', '2023-10-20', 'Please respect quiet hours, maintain cleanliness, and report damages. Visitors must register, and security is crucial. Follow Covid-19 guidelines, and treat fellow residents with respect. Non-compliance may result in disciplinary action. Thank you for contributing to a safe and pleasant hostel environment.', 'NOTICE FOR THE STUDENTS USING HOSTEL FACILITIES');


CREATE TABLE `repair` (
  `repair_id` varchar(11) NOT NULL,
  `asset_id` varchar(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `repair` (`repair_id`, `asset_id`, `date`) VALUES
('r01', 'a04', '2023-09-13'),
('r02', 'a09', '2023-10-03'),
('r03', 'a14', '2023-10-18');



CREATE TABLE `room` (
  `room_no` int(3) NOT NULL,
  `floor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `room` (`room_no`, `floor`) VALUES
(101, 'ground flo'),
(128, 'ground flo'),
(201, '1st floor'),
(225, '1st floor'),
(301, '2nd floor'),
(328, '2nd floor'),
(401, '3rd floor'),
(428, '3rd floor');


CREATE TABLE `room_asset` (
  `asset_id` varchar(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `room_no` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `room_asset` (`asset_id`, `name`, `room_no`) VALUES
('a01', 'table', 101),
('a02', 'table', 101),
('a03', 'table', 101),
('a04', 'table', 101),
('a05', 'blub', 101),
('a06', 'bulb', 101),
('a07', 'bed', 101),
('a08', 'bed', 101),
('a09', 'cupboard', 101),
('a10', 'cupboard', 101),
('a11', 'chair', 101),
('a12', 'chair', 101),
('a13', 'chair', 101),
('a14', 'chair', 101),
('a15', 'bed', 101),
('a16', 'bed', 101),
('a17', 'bed', 101),
('a18', 'bed', 101);




CREATE TABLE `toilet` (
  `toilet_id` varchar(11) NOT NULL,
  `floor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `toilet` (`toilet_id`, `floor`) VALUES
('t01', 'ground flo'),
('t02', 'ground flo'),
('t03', '1st floor'),
('t04', '1st floor'),
('t05', '2nd floor'),
('t06', '2nd floor'),
('t07', '3rd floor'),
('t08', '3rd floor');


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


  ALTER TABLE `room_asset`
  ADD PRIMARY KEY (`asset_id`);


  ALTER TABLE `toilet`
  ADD PRIMARY KEY (`toilet_id`);