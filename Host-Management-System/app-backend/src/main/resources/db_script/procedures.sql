---------------------------------------------------------------------Strored procedure-----------------------------------------------------------------------------------------------------------
/* ---------------------------------------User table procedures-------------------------------------------------------------- */
/*START checkLogin procedure for check login credential*/
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
/* END checkLogin procedure for check login credential*/


/* ---------------------------------------Notice table procedures-------------------------------------------------------------- */
/* START insert notice  procedure for insert notice */

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


/* START find notice details by id */
DELIMITER //
CREATE PROCEDURE GetNoticeDetails(IN p_notice_id INT)
BEGIN
SELECT * FROM notice WHERE notice_id = p_notice_id;
END //
DELIMITER ;
/* END find notice details by id */


-------------------------------------------------------/* Student Table */---------------------------------------------------------------------------
/* To get all student details */
DELIMITER //
CREATE PROCEDURE get_all_students()
BEGIN
	SELECT *FROM student;
END //

DELIMITER ;   


   /* complain table */

/* ---------------------------------------Complain table procedures-------------------------------------------------------------- */


/* START store data store in complain table*/
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
CALL InsertComplain('TG508', 'Service', 'Excellent service', 'Feedback');
/* END store data store in complain table*/


/* To get all complaint details */
DELIMITER //
CREATE PROCEDURE get_all_complaints()
BEGIN
SELECT *FROM complain;
END //

DELIMITER ;


/* START update the complain data using c_id */
DELIMITER //
CREATE PROCEDURE updateComplaint(
    IN complaint_id INT,
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
            subject = new_subject,
            description = new_description
        WHERE c_id = complaint_id;
        SET result_message = 'Success';
    ELSE
        SET result_message = 'Complaint not found or not updated.';
END IF;
END //
DELIMITER ;
/* END update the complain data using c_id */

/* START find complaint details by id */
DELIMITER //
CREATE PROCEDURE GetComplaintDetails(IN p_c_id INT)
BEGIN
SELECT * FROM complain WHERE c_id = p_c_id;
END //
DELIMITER ;
/* END find complaint details by id */

/* ---------------------------------------Room Asset table procedures-------------------------------------------------------------- */

    /* START generate asset code by room no */
DELIMITER //
CREATE PROCEDURE GenerateAssetCode(IN roomNo INT)
BEGIN
    SELECT CONCAT(asset_id,"/",name) AS "Asset Code" FROM room_asset WHERE room_no=roomNo;
END //
DELIMITER ;


/*start get asset_name, room_no code from room_asset */

DELIMITER //
CREATE PROCEDURE GetAllAssetInfo()
BEGIN
  SELECT name, room_no
  FROM room_asset;
END;
//
DELIMITER ;

/*end get asset_name, room_no code from room_asset */


/*------------------------------------------------Room table procedures----------------------------------------------------------------*/

/* START store data store in room table*/
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


/* To get all room details */
DELIMITER //
CREATE PROCEDURE get_all_rooms_details()
BEGIN
SELECT room_no,floor,reg_no,date(created_at) as created_at ,date(updated_at)as updated_at FROM room;
END //

DELIMITER ;

/* To update room details */
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
DELIMITER ;   //room not have foreign key



/* for showing complain details in table*/
DELIMITER //
CREATE PROCEDURE showingComplaintsDetails()
BEGIN
select  concat(s.first_name," ",s.last_name) as name, c.type, rs.name as asset_name,r.room_no,c.subject,c.description,
    date(c.created_at) AS created_date,
    date(c.updated_at) AS updated_date,
    CASE
    WHEN c.action = 0 THEN 'Not Accepted'
    WHEN c.action = 1 THEN 'Accepted'
    ELSE 'Unknown'
END AS action_status,
       c.remark as accepted_by
from student s,complain c,room_asset rs, room r
where substring(c.reg_no,3)=substring(s.reg_no,9) AND
    SUBSTRING_INDEX(c.asset_code, '/', 1) = rs.asset_id AND
    r.reg_no= s.reg_no and
    r.room_no = rs.room_no and
    month(c.created_at) = month(current_timestamp)
    ;

END//
DELIMITER ;



update complain set asset_code ="ass_b1/101" where c_id=1;
update complain set asset_code ="ass_bed1/101" where c_id=4;
update complain set asset_code ="ass_m1/101" where c_id=5;

update student set first_name="Kamal",last_name="Hassan" where reg_no="TG/2019/491";
update student set reg_no="TG/2019/490" where reg_no="TG_2019_490";



-------------------------------------------------DAMAGE Table------------------------------------------------------
/* To get all damages details*/

DELIMITER //
CREATE PROCEDURE get_all_damage_details()
BEGIN
SELECT *FROM damage;
END //

DELIMITER ;











