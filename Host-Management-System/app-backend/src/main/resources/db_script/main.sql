CREATE DATABASE user_manage;

USE user_manage;

CREATE TABLE users(
    user_id int not null AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE ,
    password VARCHAR(255) NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    PRIMARY KEY (user_id)
);

CREATE TABLE user(
    username VARCHAR(60), 
    password VARCHAR(255)
);

CREATE TABLE dean(
    dean_id VARCHAR(5) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), 
    address VARCHAR(100), 
    personal_no INT, 
    office_no INT
);

CREATE TABLE subwarden(
    swarden_id VARCHAR(5) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), 
    address VARCHAR(100), 
    personal_no INT, 
    office_no INT
); 

CREATE TABLE security(
    security_id VARCHAR(5) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), address VARCHAR(100), 
    personal_no INT, 
    office_no INT
); 

CREATE TABLE warden(warden_id VARCHAR(5) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), 
    address VARCHAR(100), 
    personal_no INT, 
    office_no INT
);  

CREATE TABLE student(
    st_id INT PRIMARY KEY, 
    reg_no VARCHAR(15), 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), 
    address VARCHAR(100), 
    phone_no INT
);


-------------TG508----------------------------------------------------------------------------------------

/*Trigger for users table update*/

DELIMITER //
CREATE TRIGGER after_dean_insert
AFTER
INSERT
ON dean FOR EACH ROW
BEGIN
IF NEW.dean_id IS NOT NULL THEN
INSERT INTO user VALUES(NEW.email,MD5(NEW.nic));
END IF;
END//
DELIMITER ;
