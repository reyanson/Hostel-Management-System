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

--------------------------------------------ROOM Table-----------------------------------------------------------

CREATE TABLE `room`
(
    `room_id`    int(11) NOT NULL AUTO_INCREMENT,
    `room_no`    int(3) NOT NULL,
    `floor`      varchar(10) NOT NULL,
    `reg_no`     varchar(15) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp (),
    `updated_at` timestamp NULL DEFAULT current_timestamp () ON UPDATE current_timestamp (),
    `status`     int(1) DEFAULT 0,
    PRIMARY KEY (`room_id`)
);

INSERT INTO `room` VALUES
(17,101,'L1','TG/2019/491','2023-11-02 10:56:16','2023-11-05 03:35:59',1),
(18,101,'L1','TG/2019/494','2023-11-02 10:56:16','2023-11-05 03:37:32',0),
(19,201,'L2','TG/2021/760','2023-11-02 10:56:16','2023-11-02 10:56:16',0),
(20,225,'L2','TG/2021/780','2023-11-02 10:56:16','2023-11-02 10:56:16',0),
(21,301,'L3','TG/2019/490','2023-11-02 10:56:16','2023-11-05 03:35:26',0),
(22,328,'L3','TG/2021/423','2023-11-02 10:56:16','2023-11-02 12:26:10',0),
(23,401,'L4','TG/2019/508','2023-11-02 10:56:16','2023-11-02 10:56:16',0),
(24,428,'L4','TG/2019/492','2023-11-02 10:56:16','2023-11-02 16:21:09',0);

-----------------------------------------------DAMAGE Table------------------------------------------

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

------------------------------------------deancomplaintcheck Table---------------------------------------------------

CREATE TABLE deancomplaintcheck(cId INT PRIMARY KEY );

------------------------------------------event to send complaint after 7 days to Dean---------------------------------

CREATE TABLE deancomplaintcheck(cId INT PRIMARY KEY );

DELIMITER //
CREATE EVENT checkActionNullValueForDean
ON SCHEDULE EVERY 7 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
INSERT INTO deancomplaintcheck (cId)
SELECT c_id
FROM complain c
WHERE DATEDIFF(CURDATE(), c.created_at) > 7 AND
        c.action = 0 AND c.remark IS NULL;
END //
DELIMITER ;

------------------------------------------------TRIGGERS----------------------------------------------------------------

/* Trigger for user table update with warden details */
DELIMITER //
CREATE TRIGGER after_warden_insert
    AFTER INSERT ON warden FOR EACH ROW
BEGIN
    IF NEW.warden_id IS NOT NULL THEN
    INSERT INTO user(username, password)
    VALUES (CONCAT(NEW.first_Name,"warden",NEW.warden_id),MD5(NEW.nic));

END IF;
END //
DELIMITER ;

/* Trigger for user table update with subwarden details */
DELIMITER //
CREATE TRIGGER after_subwarden_insert
    AFTER INSERT ON subwarden FOR EACH ROW
BEGIN
    IF NEW.swarden_id IS NOT NULL THEN
    INSERT INTO user(username, password)
    VALUES (CONCAT(NEW.first_Name,"subwarden",NEW.swarden_id),MD5(NEW.nic));

END IF;
END //
DELIMITER ;

/* After Dean take Action the complaintId deleted from dean complaintcheck */
DELIMITER //
CREATE TRIGGER after_update_action_on_complainTable
    AFTER UPDATE ON complain FOR EACH ROW
BEGIN
    IF NEW.action =1 THEN
    DELETE
    FROM deancomplaintcheck
    WHERE OLD.c_id = deancomplaintcheck.cId;

END IF;
END //
DELIMITER ;

------------------------------------------------PROCEDURES----------------------------------------------------------------
/* Procedure START display complaint to Dean */
DELIMITER //
CREATE PROCEDURE displayDeanComplaint()
BEGIN
SELECT *
FROM complain c, deancomplaintcheck d
WHERE c.c_id = d.cId;
END //
DELIMITER ;

/* Procedure To get all student details */
DELIMITER //
CREATE PROCEDURE get_all_students()
BEGIN
SELECT *FROM student;
END //
DELIMITER ;

/* Procedure START store data in complain table */
DELIMITER //
CREATE PROCEDURE InsertComplain(
    IN p_reg_no VARCHAR(20),
    IN p_type VARCHAR(20),
    IN p_asset_code VARCHAR(50),
    IN p_subject VARCHAR(50),
    IN p_description VARCHAR(50)
)
BEGIN
INSERT INTO complain (reg_no, type,asset_code,subject, description)
VALUES (p_reg_no, p_type,p_asset_code, p_subject, p_description);
SELECT 'Success' AS Message;
END//
DELIMITER ;

CALL InsertComplain('TG/2018/492', 'Service', 'Excellent service', 'Feedback');

/* Procedure To get all complaint details */
DELIMITER //
CREATE PROCEDURE get_all_complaints()
BEGIN
    SELECT c.c_id, CONCAT(s.first_name," ",s.last_name) AS name, c.type, rs.name AS asset_name,r.room_no,c.subject,c.description,
    DATE(c.created_at) AS created_date, DATE(c.updated_at) AS updated_date,
    CASE
        WHEN c.action = 0 THEN 'Not Accepted'
        WHEN c.action = 1 THEN 'Accepted'
    ELSE 'Unknown'
    END AS action_status,
        c.remark AS accepted_by
        FROM student s,complain c,room_asset rs, room r
        WHERE SUBSTRING(c.reg_no,3)=SUBSTRING(s.reg_no,9) AND
        SUBSTRING_INDEX(c.asset_code, '/', 1) = rs.asset_id AND
        r.reg_no= s.reg_no AND
        r.room_no = rs.room_no
    ;
END //
DELIMITER ;

/* Procedure Start store data store in room table*/
DELIMITER //
CREATE PROCEDURE InsertRoom(
IN d_room_no int,
IN d_floor varchar(10),
IN d_reg_no varchar(15))
BEGIN
    INSERT INTO room (room_no, floor, reg_no)
    VALUES (d_room_no, d_floor, d_reg_no);
    SELECT 'Success' AS Message;
END//
DELIMITER ;

CALL InsertRoom(228, 'L2', 'TG/2021/785');


/* Procedure To get all room details */
DELIMITER //
CREATE PROCEDURE get_all_rooms_details()
BEGIN
    SELECT room_id,room_no,floor,reg_no,date(created_at) as created_at ,date(updated_at)as updated_at ,status FROM room;
END //
DELIMITER ;


------------------------------------------------FUNCTIONS----------------------------------------------------------------

/* Function for delete student data using regNo */
DELIMITER //
CREATE FUNCTION deleteStudent(inregno VARCHAR(15))
RETURNS VARCHAR(255)
BEGIN
        DECLARE result VARCHAR(255);
        IF EXISTS (SELECT * FROM student WHERE substring(reg_no,9) = substring(inregno,3)) THEN
            DELETE FROM student WHERE substring(reg_no,9) = substring(inregno,3);
            UPDATE room SET reg_no = 'Empty' WHERE substring(reg_no,9) = substring(inregno,3);
            SET result = 'Success';
        ELSE
            SET result = 'Student not found';
        END IF;
        RETURN result;
END //
DELIMITER ;

/* Function Start delete complain data using id */
DELIMITER //
CREATE FUNCTION deleteComplain(p_complain_id INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE result VARCHAR(255);
    IF EXISTS (SELECT * FROM complain WHERE c_id = p_complain_id) THEN
        DELETE FROM complain WHERE c_id = p_complain_id;
        SET result = 'Success';
    ELSE
        SET result = 'Complaint not found';
    END IF;
    RETURN result;
END //
DELIMITER ;

/* Function Delete room student data */
DELIMITER //
CREATE FUNCTION deleteRoomStudentData(in_reg_no VARCHAR(15))
RETURNS VARCHAR(255)
BEGIN
    DECLARE result VARCHAR(255);
    IF EXISTS (SELECT room_no FROM room WHERE substring(reg_no,9) = substring(in_reg_no,3)) THEN
        UPDATE room SET reg_no = 'empty' WHERE substring(reg_no,9) = substring(in_reg_no,3);
        SET result = 'Success';
    ELSE
        SET result = 'Student data not found';
    END IF;
    RETURN result;
END //
DELIMITER ;


