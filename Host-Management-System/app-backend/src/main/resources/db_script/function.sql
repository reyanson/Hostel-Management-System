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

/* for delete student data using regNo */
DELIMITER //
    CREATE FUNCTION deleteStudent(inregno VARCHAR(15))
        RETURNS VARCHAR(255)
        BEGIN
            DECLARE result VARCHAR(255);
            IF EXISTS (SELECT * FROM student WHERE reg_no  = inregno) THEN
                DELETE FROM student WHERE reg_no  = inregno;
                SET result = 'Success';
            ELSE
                SET result = 'Student not found';
            END IF;

        RETURN result;
        END //
DELIMITER ;

/*room*/
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

/*dean*/
/*dean registration */
DELIMITER //
CREATE FUNCTION InsertDean(
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  email VARCHAR(50),
  nic VARCHAR(12),
  address VARCHAR(100),
  personalnum INT(10),
  officenum INT(10)
) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  INSERT INTO dean (firstname, lastname, email, nic, address, personalnum, officenum)
  VALUES (firstname, lastname, email, nic, address, personalnum, officenum);
  RETURN NULL;
END //
DELIMITER ;
