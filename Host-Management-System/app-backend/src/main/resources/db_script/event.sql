DELIMITER //

CREATE EVENT two_minute_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 2 MINUTE
ON COMPLETION NOT PRESERVE
DO
BEGIN
    SELECT CONCAT(s.first_name," ",s.last_name) AS name, c.type, rs.name AS asset_name,r.room_no,c.subject,c.description,
    DATE(c.created_at) AS created_date,
    DATE(c.updated_at) AS updated_date,
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
    r.room_no = rs.room_no AND
    MONTH(c.created_at) = MONTH(CURRENT_TIMESTAMP)
    ;
END//
DELIMITER ;

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

DELIMITER //
CREATE PROCEDURE displayDeanComplaint()
BEGIN
SELECT *
FROM complain c, deancomplaintcheck d
WHERE c.c_id = d.cId;
END //
DELIMITER ;

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

------------------------------------------event to send complaint after 4 days to Warden---------------------------------

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

DELIMITER //
CREATE PROCEDURE displayWardenComplaint()
BEGIN
SELECT *
FROM complain c, wardencomplaintcheck w
WHERE c.c_id = w.cId;
END //
DELIMITER ;

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
----------------------------------------------------------------------------------------------------


DELIMITER //
create event showMsg
on schedule every 10 second
starts current_timestamp + interval 1 minute
ends current_timestamp + interval 2 minute

do
BEGIN

END //
DELIMITER ;


DELIMITER //
CREATE EVENT monthlyReportGenerate
ON SCHEDULE EVERY 2 Minute
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ends current_timestamp + interval 4 minute
DO
CALL monthlyReportGenerate();

DELIMITER ;


