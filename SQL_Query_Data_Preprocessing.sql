-- Library Management System 
CREATE DATABASE Library_Management_System;

--Create tables
DROP TABLE IF EXISTS Branch;
CREATE TABLE branch(
       branch_id VARCHAR(10) PRIMARY KEY,
	   manager_id VARCHAR(10),
	   branch_address VARCHAR(60),
	   contact_no VARCHAR(20)
);
SELECT * FROM branch;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
       emp_id VARCHAR(10) PRIMARY KEY,
	   emp_name VARCHAR(25),
	   position VARCHAR(25),
	   salary FLOAT,
	   branch_id VARCHAR(25)
);
SELECT * FROM employees;

DROP TABLE IF EXISTS books;
CREATE TABLE books(
      isbn VARCHAR(25) PRIMARY KEY,
	  book_title VARCHAR(75),
	  category VARCHAR(30),
	  rental_price FLOAT,
	  status VARCHAR(20),
	  author VARCHAR(25),
	  publisher VARCHAR(40)
);
SELECT * FROM books;

DROP TABLE IF EXISTS members;
CREATE TABLE members(
      member_id VARCHAR(10) PRIMARY KEY,	
	  member_name VARCHAR(35),
	  member_address VARCHAR(35),
	  reg_date DATE
);
SELECT * FROM members;

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
      issued_id VARCHAR(10) PRIMARY KEY,
	  issued_member_id VARCHAR(10),
	  issued_book_name VARCHAR(55),
	  issued_date DATE,
	  issued_book_isbn VARCHAR(35),
	  issued_emp_id VARCHAR(25)
);
SELECT * FROM issued_status;

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(
      return_id VARCHAR(10) PRIMARY KEY,	
	  issued_id VARCHAR(10),
	  return_book_name VARCHAR(55),
	  return_date DATE,
	  return_book_isbn VARCHAR(15)
);
SELECT * FROM return_status;

-- Connect Tables via Foreign Keys
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);
