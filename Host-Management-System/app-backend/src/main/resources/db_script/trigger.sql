****************************************************************Triggesr*******************************************************************


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


/*  */




