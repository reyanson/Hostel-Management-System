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

INSERT INTO dean (dean_id, first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('D001', 'John', 'Smith', 'chandimal@ictec.com', '195756789V', '24 Main Street, Galle', 0764567892, 0234567890);

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

INSERT INTO subwarden (swarden_id, first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('SW001', 'Jeyapala', 'Wardana', 'jayapala@example.com', '198756789V', '456 Park Street, Matara', 0716894375, 0234567236);


CREATE TABLE security(
    security_id VARCHAR(5) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), address VARCHAR(100), 
    personal_no INT, 
    office_no INT
); 

INSERT INTO security (security_id, first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('S001', 'Vimal', 'Gunaseela', 'vimal@example.com', '886504257V', 'Patri Road Kamburupitiya, Matara', 0777421005, 0234567410),
('S002', 'Srikanth', 'Davis', 'srikanth@example.com', '857654321V', 'Guard Road Kamburupitiya, Matara', 0759865123, 0234567410),
('S003', 'Mithran', 'Davis', 'mithran@example.com', '830728643V', 'Guru Road Kamburupitiya, Matara', 0742000586, 0234567410);

CREATE TABLE warden(warden_id VARCHAR(5) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), 
    address VARCHAR(100), 
    personal_no INT, 
    office_no INT
);  

INSERT INTO warden (warden_id, first_Name, last_Name, Email, nic, address, personal_no, office_no)
VALUES
('W001', 'Kashun', 'Johnson', 'kasun@example.com', '918856423V', '11 Himalaya Road, Matara', 0726541834, 0234567456);

CREATE TABLE student(
    reg_no VARCHAR(15) PRIMARY KEY, 
    first_Name VARCHAR(50), 
    last_Name VARCHAR(50), 
    Email VARCHAR(50), 
    nic VARCHAR(12), 
    address VARCHAR(100), 
    phone_no INT
);

INSERT INTO student (reg_no, first_Name, last_Name, Email, nic, address, phone_no)
VALUES
('tg_2019_508', 'Reyanson', 'Sosai', 'reyanson@example.com', '990910703V', '3/6 Raja Road Vankala, Mannar', 0769678453),
('tg_2019_492', 'Sunil', 'Vadivel', 'sunil@example.com', '997024986V', '39A Boundary Road, Kalmunai', 0760725590),
('tg_2018_317', 'Jane', 'Jeyan', 'jane@example.com', '9876543213V', 'Elme Street, Colombo', 0756958721),
('tg_2019_509', 'Hammil', 'Rajanikanth', 'hammil@example.com', '200052104409', 'Pointpettro Road Kodikamam, Jaffna', 0766831044),
('tg_2020_841', 'Krishanth', 'Veluraj', 'krishanth@example.com', '200065432164', 'PTK Road Pandiruppu, Batticalo', 0719832164);
