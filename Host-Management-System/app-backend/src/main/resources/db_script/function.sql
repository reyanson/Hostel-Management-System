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


/* complain table */

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

/*START update complain data using id */
DELIMITER //
CREATE FUNCTION UpdateComplaint(
    new_category VARCHAR(255),
    new_subject VARCHAR(255),
    new_description TEXT
) RETURNS VARCHAR(255)
BEGIN
    DECLARE rows_affected INT;
    SELECT COUNT(*) INTO rows_affected FROM complaints WHERE c_id = complaint_id;
    IF rows_affected > 0 THEN
        UPDATE complaints
        SET category = new_category,
        subject = new_subject,
        description = new_description
        WHERE id = complaint_id;
        RETURN 'Success';
    ELSE
        RETURN 'Complaint not found or not updated.';
    END IF;
END //
DELIMITER ;
/*END update complain data using id */
