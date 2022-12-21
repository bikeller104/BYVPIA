DROP DATABASE IF EXISTS byvpia_db;
CREATE DATABASE byvpia_db;

use byvpia_db;

Create Table byvpia_users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,username varchar(255) NOT NULL
    ,password varchar(255) NOT NULL
    ,is_primary Bool
);

Create Table byvpia_policy(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,insured_amount DECIMAL(10,2) NOT NULL
    ,policy_holder INT NOT NULL
    ,policy_address Text NOT NULL
    ,FOREIGN KEY (policy_holder) 
    REFERENCES byvpia_users (id)
    ON DELETE CASCADE
);


Create Table byvpia_item  (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,item_name varchar(255) NOT NULL
    ,purchace_amount DECIMAL(10,2)
    ,purchace_date DATE
    ,replacement_cost DECIMAL(10,2) NOT NULL
    ,creation_date DATE NOT NULL
    ,link Text
    ,reciept_number INT
    ,is_scheduled Bool
    ,policy_number INT NOT NULL
    ,FOREIGN KEY (policy_number) 
    REFERENCES byvpia_policy (id)
    ON DELETE CASCADE
); 

Create Table junction(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,user_id INT 
    ,FOREIGN KEY (user_id)
     REFERENCES byvpia_users (id)
     ON DELETE SET NULL
    
    ,policy_id INT 

    ,FOREIGN KEY (policy_id) 
    REFERENCES byvpia_policy (id)
    ON DELETE SET NULL
);