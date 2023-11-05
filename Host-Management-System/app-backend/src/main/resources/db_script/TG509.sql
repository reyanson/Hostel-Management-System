CREATE DATABASE user_manage;

USE user_manage;

-----------------------------------------------------------------NOTICE Table--------------------------------------

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

-------------------------------------------------------------Bathroom Table--------------------------------------

CREATE TABLE `bathroom` (
    `bathroom_id` varchar(10) NOT NULL PRIMARY KEY ,
    `floor` varchar(2),
    `name` varchar(50) NOT NULL
);

INSERT INTO `bathroom` (`bathroom_id`, `floor`, `name`) VALUES
('l1_l_b1', 'L1', 'level1 left bathroom1'),('l1_l_b2', 'L1', 'level1 left bathroom2'),('l1_l_b3', 'L1', 'level1 left bathroom3'),
('l1_l_b4', 'L1', 'level1 left bathroom4'),('l1_l_b5', 'L1', 'level1 left bathroom5'),('l1_l_b6', 'L1', 'level1 left bathroom6'),
('l1_r_b1', 'L1', 'level1 right bathroom1'),('l1_r_b2', 'L1', 'level1 right bathroom2'),('l1_r_b3', 'L1', 'level1 right bathroom3'),
('l1_r_b4', 'L1', 'level1 right bathroom4'),('l1_r_b5', 'L1', 'level1 right bathroom5'),('l1_r_b6', 'L1', 'level1 right bathroom6'),
('l3_l_b1', 'L3', 'level3 left bathroom1'),('l3_l_b2', 'L3', 'level3 left bathroom2'),('l3_l_b3', 'L3', 'level3 left bathroom3'),
('l3_l_b4', 'L3', 'level3 left bathroom4'),('l3_l_b5', 'L3', 'level3 left bathroom5'),('l3_l_b6', 'L3', 'level3 left bathroom6'),
('l3_r_b1', 'L3', 'level3 right bathroom1'),('l3_r_b2', 'L3', 'level3 right bathroom2'),('l3_r_b3', 'L3', 'level3 right bathroom3'),
('l3_r_b4', 'L3', 'level3 right bathroom4'),('l3_r_b5', 'L3', 'level3 right bathroom5'),('l3_r_b6', 'L3', 'level3 right bathroom6');

------------------------------------------------------TOILET table-----------------------------------------

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

-----------------------------------------------ROOM ASSET Table---------------------------------------------

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
 ('ass_r2', 'Rack2', 301);

---------------------------------------------------REPAIR Table---------------------------------------

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

-----------------------------------------wardencomplaintcheck Table-------------------------------------------

CREATE TABLE wardencomplaintcheck(cId INT INT PRIMARY KEY );

--------------------------------------------------------EVENT-----------------------------------------------------

/*event to send complaint after 4 days to Warden */

CREATE TABLE wardencomplaintcheck(cId INT INT PRIMARY KEY );

DELIMITER //
CREATE EVENT checkActionNullValueForWarden
ON SCHEDULE EVERY 4 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
INSERT INTO wardencomplaintcheck (cId)
SELECT c_id
FROM complain c
WHERE DATEDIFF(CURDATE(), c.created_at) > 7 AND
        c.action = 0 AND c.remark IS NULL;
END //
DELIMITER ;

------------------------------------------------TRIGGERS----------------------------------------------------------------

/* Trigger for user table update with dean details */
DELIMITER //
CREATE TRIGGER after_dean_insert
    AFTER INSERT ON dean FOR EACH ROW
BEGIN
    IF NEW.dean_id IS NOT NULL THEN
    INSERT INTO user(username, password)
    VALUES (CONCAT(NEW.first_Name,"dean",NEW.dean_id),MD5(NEW.nic));

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
    WHERE OLD.c_id = wardencomplaintcheck.cId;

END IF;
END //
DELIMITER ;

------------------------------------------------PROCEDURES----------------------------------------------------------------
/* Procedure start display complaint to warden */
DELIMITER //
CREATE PROCEDURE displayWardenComplaint()
BEGIN
SELECT *
FROM complain c, wardencomplaintcheck w
WHERE c.c_id = w.cId;
END //
DELIMITER ;

/* Procedure start insert notice  procedure for insert notice */

DELIMITER //
CREATE PROCEDURE InsertNotice(
    IN p_content MEDIUMTEXT,
    IN p_subject VARCHAR(255)
)
BEGIN
INSERT INTO notice ( content, subject)
VALUES ( p_content, p_subject);
END//
DELIMITER ;
/*END insert notice  procedure for insert notice */


/* Procedure start find notice details by id */
DELIMITER //
CREATE PROCEDURE GetNoticeDetails(IN p_notice_id INT)
BEGIN
SELECT * FROM notice WHERE notice_id = p_notice_id;
END //
DELIMITER ;
/* END find notice details by id */

/* Procedure start generate asset code by room no */
DELIMITER //
CREATE PROCEDURE GenerateAssetCode(IN roomNo INT)
BEGIN
SELECT CONCAT(asset_id,"/",name) AS "Asset Code" FROM room_asset WHERE room_no=roomNo;
END //
DELIMITER ;


/*Procedure start get asset_name, room_no code from room_asset */
DELIMITER //
CREATE PROCEDURE GetAllAssetInfo()
BEGIN
SELECT name, room_no
FROM room_asset;
END;
//
DELIMITER ;


/*Procedure start get all details of asset by asset_id code from room_asset */
DELIMITER //
CREATE PROCEDURE GetAssetDetails(IN assetId varchar(11), IN roomNumber int(3))
BEGIN
    SELECT *
    FROM room_asset
    WHERE asset_id = assetId AND room_no = roomNumber;
END //
DELIMITER ;

------------------------------------------------FUNCTIONS----------------------------------------------------------------
/* Function Users registration */
DELIMITER //
CREATE FUNCTION InsertUserData(
    p_first_Name VARCHAR(255),
    p_last_Name VARCHAR(255),
    p_Email VARCHAR(255),
    p_nic VARCHAR(255),
    p_address VARCHAR(255),
    p_personal_no VARCHAR(255),
    p_office_no VARCHAR(255),
    p_position VARCHAR(255))
    RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
  DECLARE msg VARCHAR(255);
CASE p_position
    WHEN 'Dean' THEN
      INSERT INTO dean (first_Name, last_Name, Email, nic, address, personal_no, office_no)
		    VALUES (p_first_Name, p_last_Name, p_Email, p_nic, p_address, p_personal_no, p_office_no);
      SET msg = "Success to Register the user as dean";
WHEN 'Warden' THEN
      INSERT INTO warden (first_Name, last_Name, Email, nic, address, personal_no, office_no)
          	   VALUES (p_first_Name, p_last_Name, p_Email, p_nic, p_address, p_personal_no, p_office_no);
      SET msg = "Success to Register the user as warden";
WHEN 'Subwarden' THEN
      INSERT INTO subwarden (first_Name, last_Name, Email, nic, address, personal_no, office_no)
          	   VALUES (p_first_Name, p_last_Name, p_Email, p_nic, p_address, p_personal_no, p_office_no);
      SET msg = "Success to Register the user as subwarden";
WHEN 'Security' THEN
      INSERT INTO security (first_Name, last_Name, Email, nic, address, personal_no, office_no)
          	   VALUES (p_first_Name, p_last_Name, p_Email, p_nic, p_address, p_personal_no, p_office_no);
      SET msg = "Success to Register the user as security";
ELSE
      SET msg = 'Invalid position';
END CASE;

RETURN msg;
END //
DELIMITER ;




