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

--------------------------------------------LEVEL TABLE------------------------------------------------
CREATE TABLE `level`
(
    `year`  int(4) DEFAULT NULL,
    `level` int(1) DEFAULT NULL
);

INSERT INTO `level` VALUES
(2019,3),(2022,1);




--------------------------------------------------------EVENT-----------------------------------------------------

/*START event for report generate */
DELIMITER //
CREATE PROCEDURE monthlyReportGenerate()
BEGIN
    DECLARE viewName VARCHAR(30);
    SET viewName = CONCAT(MONTHNAME(CURRENT_TIMESTAMP()), '_ComplainReport',YEAR(CURRENT_TIMESTAMP));
    SET @createViewSQL = CONCAT('CREATE VIEW ', viewName, ' AS ', '
        SELECT CONCAT(s.first_name," ",s.last_name) AS name, c.type, rs.name AS asset_name, r.room_no, c.subject, c.description,
            DATE(c.created_at) AS created_date, DATE(c.updated_at) AS updated_date,
            CASE
                WHEN c.action = 0 THEN ''Not Accepted''
                WHEN c.action = 1 THEN ''Accepted''
                ELSE ''Unknown''
            END AS action_status,
            c.remark AS accepted_by
        FROM student s, complain c, room_asset rs, room r
        WHERE SUBSTRING(c.reg_no,3) = SUBSTRING(s.reg_no,9)
        AND SUBSTRING_INDEX(c.asset_code, ''/'', 1) = rs.asset_id
        AND r.reg_no = s.reg_no
        AND r.room_no = rs.room_no
        AND MONTH(c.created_at) = MONTH(CURRENT_TIMESTAMP())
    ');

PREPARE stmt FROM @createViewSQL;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;
/*START event for report generate */



------------------------------------------------TRIGGERS----------------------------------------------------------------

/* Trigger for user table update with student details*/
DELIMITER //
CREATE TRIGGER after_student_insert
    AFTER INSERT ON student FOR EACH ROW
BEGIN
    DECLARE tgNo VARCHAR(10);

    -- Extract the numeric part from reg_no
    SET tgNo = CONCAT('TG',SUBSTRING(NEW.reg_no, 9));

    -- Insert a new user record
    INSERT INTO user (username, password)
    VALUES (tgNo, MD5(NEW.nic));
END//
DELIMITER ;

/* Trigger for user table update with security details */
DELIMITER //
CREATE TRIGGER after_security_insert
    AFTER INSERT ON security FOR EACH ROW
BEGIN
    IF NEW.security_id IS NOT NULL THEN
    INSERT INTO user(username, password)
    VALUES (CONCAT(NEW.first_Name,"sec",NEW.security_id),MD5(NEW.nic));

END IF;
END //
DELIMITER ;

------------------------------------------------PROCEDURES----------------------------------------------------------------
 /* Procedure start checkLogin procedure for check login credential*/
DELIMITER //
CREATE PROCEDURE CheckLogin(IN in_username VARCHAR(255), IN in_password VARCHAR(32))
BEGIN
    DECLARE hashed_password VARCHAR(32);

SELECT MD5(in_password) INTO hashed_password;

IF EXISTS (
        SELECT 1
        FROM user
        WHERE username = in_username AND password = hashed_password
    ) THEN
SELECT 'Login Successful' AS result;
ELSE
        IF NOT EXISTS (SELECT 1 FROM user WHERE username = in_username) THEN
SELECT 'Username wrong' AS result;
ELSE
SELECT 'Password wrong' AS result;
END IF;
END IF;
END //
DELIMITER ;

/* Procedure start update the complain data using c_id */
DELIMITER //
CREATE PROCEDURE updateComplaint(
    IN complaint_id INT,
    IN new_type VARCHAR(10),
    IN new_asset_code VARCHAR(255),
    IN new_subject VARCHAR(255),
    IN new_description TEXT,
    OUT result_message VARCHAR(255)
)
BEGIN
    DECLARE rows_affected INT;
SELECT COUNT(*) INTO rows_affected FROM complain WHERE c_id = complaint_id;
IF rows_affected > 0 THEN
UPDATE complain
SET asset_code = new_asset_code,
    type = new_type,
    subject = new_subject,
    description = new_description
WHERE c_id = complaint_id;
SET result_message = 'Success';
ELSE
        SET result_message = 'Complaint not found or not updated.';
END IF;
END //
DELIMITER ;

/* Procedure start find complaint details by id */
DELIMITER //
CREATE PROCEDURE GetComplaintDetails(IN p_c_id INT)
BEGIN
SELECT * FROM complain WHERE c_id = p_c_id;
END //
DELIMITER ;

/*Procedure start To update room details */
DELIMITER //
CREATE PROCEDURE updateRoom(
    IN rm_id INT,
    IN new_room_num INT,
    IN new_floor VARCHAR(3),
    IN new_reg_no VARCHAR(20),
    OUT result_message VARCHAR(255)
)
BEGIN
    DECLARE rows_affected INT;
SELECT COUNT(*) INTO rows_affected FROM room WHERE room_id = rm_id;
IF rows_affected > 0 THEN
UPDATE room
SET room_num = new_room_num,
    floor = new_floor,
    reg_no = new_reg_no
WHERE room_id = rm_id;
SET result_message = 'Success';
ELSE
    SET result_message = 'Room Datas not found or not updated.';
END IF;
END //
DELIMITER ;

/* START Procedure for find subwarden by id*/
DELIMITER //
CREATE PROCEDURE FindSubwardenDetailsById(
    IN swardenId INT
)
BEGIN
SELECT * FROM subwarden WHERE swarden_id = swardenId;
END //
DELIMITER ;
/* END Procedure for find subwarden by id*/


/* START Procedure for find warden by id*/
DELIMITER //
CREATE PROCEDURE FindWardenDetailsById(
    IN wardenId INT
)
BEGIN
SELECT * FROM warden WHERE warden_id = wardenId;
END //
DELIMITER ;
/* END Procedure for find warden by id*/

/* START Procedure for find dean by id*/
DELIMITER //
CREATE PROCEDURE FindWardenDetailsById(
    IN wardenId INT
)
BEGIN
SELECT * FROM warden WHERE warden_id = wardenId;
END //
DELIMITER ;
/* END Procedure for find dean by id*/

------------------------------------------------FUNCTIONS----------------------------------------------------------------

/* function start Find student reg_no with "TG___"*/
DELIMITER //
CREATE FUNCTION getRegNo(IN num VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC --always produces the same output for the same input It helps the database optimize query execution.
BEGIN
    DECLARE regnum VARCHAR(50);
    SELECT reg_no INTO regnum FROM student WHERE SUBSTRING(reg_no, 9) = SUBSTRING(num, 3);
    RETURN regnum;
END//
DELIMITER ;


/*function start FIND THE LEVEL */
DELIMITER //
CREATE FUNCTION getLevelOfStudent(IN num VARCHAR(50))
RETURNS INT(1)
DETERMINISTIC
BEGIN
    DECLARE result INT(1);
    SELECT level INTO result FROM level WHERE year = SUBSTRING(num, 4, 4);
    RETURN result;
END//
DELIMITER ;


/*function start find user occasion*/
DELIMITER //
CREATE FUNCTION findUserOccasion(IN username VARCHAR(60))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(10);
    IF SUBSTRING(username, 1,2)="TG" THEN
        SET result = "student";
    ELSEIF SUBSTRING(username, LENGTH(username)- 3, 3) = "sec" THEN
        SET result = "security";
    ELSEIF SUBSTRING(username, LENGTH(username) - 4, 4)="dean" THEN
        SET result = "dean";
    ELSEIF SUBSTRING(username, LENGTH(username)- 3, 3) = "sub" THEN
        SET result = "subwarden";
    ELSEIF SUBSTRING(username, LENGTH(username)- 3, 3) = "war" THEN
        SET result = "warden";
    ELSE
        SET result="wrong";
    END IF;
    RETURN result;
END //
DELIMITER ;


/* function start room status */
DELIMITER //
CREATE FUNCTION ToggleRoomStatus(p_reg_no VARCHAR(15))
RETURNS VARCHAR(255)
BEGIN
    DECLARE roomId INT;
    DECLARE current_status INT;
    DECLARE result_message VARCHAR(255);

    SELECT room_id, status INTO roomId, current_status
    FROM room
    WHERE reg_no = p_reg_no;

    IF roomId IS NOT NULL THEN
        IF current_status = 0 THEN
            UPDATE room
            SET status = 1
            WHERE room_id = roomId;
            SET result_message = 'In';
            ELSE
            UPDATE room
            SET status = 0
            WHERE room_id = roomId;
            SET result_message = 'Out';
        END IF;
        ELSE
                SET result_message = CONCAT('Room not found for reg_no ', p_reg_no);
    END IF;

    RETURN result_message;
END //
DELIMITER ;

/* START function for update action and remark in complain table */
DELIMITER //
CREATE FUNCTION complainAccept(cId int,occation varchar(20))
    RETURNS VARCHAR(20)
BEGIN
DECLARE result VARCHAR(20);
IF EXISTS (SELECT * FROM complain where c_id=cId) THEN
UPDATE complain SET action=1 ,remark=occation WHERE c_id=cId;
SET result = 'Accepted Success';
ELSE
    SET result = 'Accepted not success';
END IF;
RETURN result;

END//
DELIMITER ;

/* END function for update action and remark in complain table */

/* START Function for update subwarden details  */
DELIMITER //
CREATE FUNCTION UpdateSubwarden(
    swardenId INT,
    new_first_name VARCHAR(50),
    new_last_name VARCHAR(50),
    new_email VARCHAR(50),
    new_nic VARCHAR(12),
    new_address VARCHAR(100),
    new_personal_no INT,
    new_office_no INT)
    RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255);
    DECLARE rows_affected INT;
SELECT COUNT(*) INTO rows_affected FROM subwarden WHERE swarden_id =swarden_id;
IF rows_affected > 0 THEN
UPDATE subwarden
SET
    first_Name = new_first_name,
    last_Name = new_last_name,
    Email = new_email,
    nic = new_nic,
    address = new_address,
    personal_no = new_personal_no,
    office_no = new_office_no
WHERE swarden_id = swardenId;
SET result = "Success";
ELSE
    SET result = " Not fount or Not updated";
END IF;
RETURN result;
END //
DELIMITER ;
/* END Function for update subwarden details  */


/* START Function for update warden details  */
DELIMITER //
CREATE FUNCTION UpdateWarden(
    wardenId INT,
    new_first_name VARCHAR(50),
    new_last_name VARCHAR(50),
    new_email VARCHAR(50),
    new_nic VARCHAR(12),
    new_address VARCHAR(100),
    new_personal_no INT,
    new_office_no INT)
    RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255);
    DECLARE rows_affected INT;
SELECT COUNT(*) INTO rows_affected FROM warden WHERE warden_id =wardenId;
IF rows_affected > 0 THEN
UPDATE warden
SET
    first_Name = new_first_name,
    last_Name = new_last_name,
    Email = new_email,
    nic = new_nic,
    address = new_address,
    personal_no = new_personal_no,
    office_no = new_office_no
WHERE warden_id = wardenId;
SET result = "Success";
ELSE
    SET result = " Not fount or Not updated";
END IF;
RETURN result;
END //
DELIMITER ;
/* END Function for update warden details  */

/* START Function for update dean details  */
DELIMITER //
CREATE FUNCTION UpdateDean(
    deanId INT,
    new_first_name VARCHAR(50),
    new_last_name VARCHAR(50),
    new_email VARCHAR(50),
    new_nic VARCHAR(12),
    new_address VARCHAR(100),
    new_personal_no INT,
    new_office_no INT)
    RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255);
    DECLARE rows_affected INT;
SELECT COUNT(*) INTO rows_affected FROM dean WHERE dean_id =deanId;
IF rows_affected > 0 THEN
UPDATE dean
SET
    first_Name = new_first_name,
    last_Name = new_last_name,
    Email = new_email,
    nic = new_nic,
    address = new_address,
    personal_no = new_personal_no,
    office_no = new_office_no
WHERE dean_id =deanId;
SET result = "Success";
ELSE
    SET result = " Not fount or Not updated";
END IF;
RETURN result;
END //
DELIMITER ;
/* END Function for update dean details  */









