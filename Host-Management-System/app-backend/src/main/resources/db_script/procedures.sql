---------------------------------------------------------------------Strored procedure-----------------------------------------------------------------------------------------------------------
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


   /* complain table */

/* START store data store in complain table*/
DELIMITER //
CREATE PROCEDURE InsertComplain(
    IN p_reg_no VARCHAR(20),
    IN p_category VARCHAR(50),
    IN p_subject VARCHAR(50),
    IN p_description VARCHAR(50)
)
BEGIN
INSERT INTO complain (reg_no, category,subject, description)
VALUES (p_reg_no, p_category, p_subject, p_description);

SELECT 'Success' AS Message;
END//

DELIMITER ;
CALL InsertComplain('TG508', 'Service', 'Excellent service', 'Feedback');
/* END store data store in complain table*/


/* START update the complain data using c_id */
DELIMITER //
CREATE PROCEDURE updateComplaint(
    IN complaint_id INT,
    IN new_category VARCHAR(255),
    IN new_subject VARCHAR(255),
    IN new_description TEXT,
    OUT result_message VARCHAR(255)
)
BEGIN
    DECLARE rows_affected INT;
    SELECT COUNT(*) INTO rows_affected FROM complain WHERE c_id = complaint_id;
    IF rows_affected > 0 THEN
        UPDATE complaints
        SET category = new_category,
            subject = new_subject,
            description = new_description
        WHERE id = complaint_id;
        SET result_message = 'Success';
    ELSE
        SET result_message = 'Complaint not found or not updated.';
END IF;
END //
DELIMITER ;
/* END update the complain data using c_id */













