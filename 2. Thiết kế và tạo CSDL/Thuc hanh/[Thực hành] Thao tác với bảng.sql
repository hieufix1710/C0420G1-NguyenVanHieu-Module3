
CREATE DATABASE manipulation_table;

USE manipulation_table;

/*create table contacts constraint id is primary key and auto increment*/
CREATE TABLE contacts(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) ,
last_name VARCHAR (30)  NOT NULL,
birthday DATE,
CONSTRAINT contact_pk PRIMARY KEY(id));

/*create table supplier */
CREATE TABLE supplier(
id INT (11) NOT NULL AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
account VARCHAR(30) NOT NULL DEFAULT 'TBD',
CONSTRAINT supplier_pk PRIMARY KEY (id));

/*alter table and add new column*/
ALTER TABLE contacts
   ADD note VARCHAR(50)
     AFTER birthday ;
     
/*drop one colums*/     
ALTER TABLE contacts
DROP note;   

/*edit table*/  
ALTER TABLE contacts
CHANGE COLUMN  contact_id id 
 INT (11) NOT NULL AUTO_INCREMENT;

/*read table contact*/
 SELECT * FROM contacts;
 
 /*rename table */
 ALTER TABLE contacts
 RENAME TO contacts;
 
 
 






