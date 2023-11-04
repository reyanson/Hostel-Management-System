---------------------------------------------------------------------Strored function----------------------------------------------------------------------------------------------------------
/* START Find student reg_no with "TG___"*/
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


/* END Find student reg_no with "TG___"*/

/*START FIND THE LEVEL */
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


/*END FIND THE LEVEL */

/*START find user occasion*/
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


/*END find user occasion*/


/* ---------------------------------------COMPLAIN TABLE FUNCTIONS-------------------------------------------------------------- */

/* START delete complain data using id */
DELIMITER //
CREATE FUNCTION deleteComplain(
    p_complain_id INT
) RETURNS VARCHAR(255)
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
/* END delete complain data using id */

------------------------------------------------STUDENT TABLE FUNCTION--------------------------------------------
/* for delete student data using regNo */
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


----------------------------------------------ROOM TABLE FUNCTION-------------------------------------------------
/* Delete room student data */
DELIMITER //
CREATE FUNCTION deleteRoomStudentData(
    in_reg_no VARCHAR(15))
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


/* START Toggle room status */
DELIMITER //
CREATE FUNCTION ToggleRoomStatus(
    p_reg_no VARCHAR(15)
) RETURNS VARCHAR(255)
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
/* END Toggle room status */

------------------------------------------------User Table-----------------------------------------------
/*Users registration */
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



--------------------------------------------ROOM Table Function-----------------------------------------------------

-- DELIMITER //
-- CREATE FUNCTION deleteRoomStudentData(
--     in_reg_no VARCHAR(15))
--     RETURNS VARCHAR(255)
-- BEGIN
--     DECLARE result VARCHAR(255);
--     IF EXISTS (SELECT reg_no FROM room r, student s WHERE reg_no = in_reg_no AND s.reg_no = r.reg_no) THEN
--         DELETE FROM room  WHERE reg_no = in_reg_no;
--         UPDATE room SET reg_no="empty";
--         SET result = 'Success';
-- ELSE
--         SET result = 'Student data not found';
-- END IF;
-- RETURN result;
-- END //
-- DELIMITER ;

