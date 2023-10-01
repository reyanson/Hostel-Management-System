CREATE DATABASE user_manage;

USE user_manage;

CREATE TABLE users(
    user_id int not null AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE ,
    password VARCHAR(255) NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (user_id)

);

