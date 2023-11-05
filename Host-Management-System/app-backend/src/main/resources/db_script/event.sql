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


create event showMsg
on schedule every 10 second
starts current_timestamp + interval 1 minute
ends current_timestamp + interval 2 minute
do
select ("Hello Dude");

