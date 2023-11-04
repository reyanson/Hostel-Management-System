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


    /* Student Table */

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
    IN p_asset_code VARCHAR(50),
    IN p_subject VARCHAR(50),
    IN p_description VARCHAR(50)
)
BEGIN
INSERT INTO complain (reg_no, asset_code,subject, description)
VALUES (p_reg_no, p_asset_code, p_subject, p_description);

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
SELECT *FROM room;
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












