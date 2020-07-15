/*create table customer with primary key is id*/
CREATE TABLE customers(
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(40),
   address VARCHAR(255),
   email VARCHAR(255));
   
   /*create table orders with primary key is id and  foreign key references from customers id*/
   CREATE TABLE orders(
   id INT AUTO_INCREMENT,
   staff VARCHAR(50),
   PRIMARY KEY(id),
   FOREIGN KEY(customer_id) REFERENCES customers(id)
);