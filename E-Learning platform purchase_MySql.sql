create database Employeedatabase;
use Employeedatabase;

Create table Departments(department_id int primary key not null,
						department_name varchar(50));
                        
Create table Location(location_id int primary key not null,	
						location varchar(50));

create table Employees(employee_id int primary key auto_increment not null,
						employee_name varchar(50),
						gender enum('M','F'),
						age int,
						hire_date date,
						designation varchar(50),
						department_id int,
						location_id int,
						salary decimal(10,2)	);
                        
                        
                        --  Table Alteration (ALTER)
--  Add a new column named "email" to the Employees table to store employee email addresses. 
alter table employees
add column email varchar(40) unique;

-- Modify the data type of the "designation" column in the Employees  table to support a wider range of values.

alter table employees
modify designation varchar(100);

--  Drop the “age” column from the Employees table.
alter table employees
drop column age ;

-- Rename the “hire_date” column to “date_of_joining”. 
alter table employees
rename column hire_date to date_of_joining ;

                                    -- Table Renaming (RENAME)

-- Rename the "Departments" table to "Departments_Info". 
alter table Departments 
rename to Departments_info;
  
-- Rename the "Location" table to "Locations". 
rename table Location to Locations;

--  Table Truncation (TRUNCATE): Write an SQL statement to truncate the  -- Employees table. 
truncate table employees;
-- Database & Table Dropping (DROP): Write the SQL statements to drop the Employees table and then the “employee” database.  
drop table employees;

-- 1 Database Recreation

-- Drop the 'employee' database if it exists and recreate it using the
-- provided schema, ensuring that all tables are created with the
-- appropriate constraints as instructed.

drop database if exists Employeedatabase;
create database Employeedatabase ;
use Employeedatabase;
create table Employees(employee_id int primary key auto_increment not null,
						employee_name varchar(50),
						gender enum('M','F'),
						age int,
						hire_date date,
						designation varchar(50),
						department_id int,
						location_id int,
						salary decimal(10,2)	);
                        

-- 2 Departments Table
                                 
--  Ensure that the "department_id" uniquely identifies each department.

alter table departments_info
modify department_id int  primary key auto_increment not null;

 --  Set up constraints on the "department_name" to avoid duplicate and null entries.
alter table departments_info
modify department_name varchar(50) not null;




-- Location Table:
--  Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
alter table locations 
modify location_id int auto_increment ; 

--  Implement constraints to prevent the insertion of null and duplicate locations.

alter table locations

modify location varchar(50) not null;

alter table locations 
add unique (location)  ;

-- Employees Table:
-- Guarantee that each employee has a distinct identifier.
-- Create a restriction to ensure that the employee's name is always provided.
-- Enforce a condition to ensure that the employee's age is 18 or above.
 -- Automatically assign the current date to the "hire_date" field if not specified.
-- Limit the acceptable values for the "gender" field to only 'M' or 'F'.
-- Establish links between the "department_id" and "location_id" fields in the "employees" table and their respective tables.

create table Employees(employee_id int primary key auto_increment not null,
						employee_name varchar(50),
						gender enum('M','F'),
						age int check(age>=18),
						hire_date DATE DEFAULT CURRENT_DATE,
						designation varchar(50),
						department_id int,
						location_id int,
						salary decimal(10,2),
	constraint department_fk
    foreign key (department_id) references  departments_info(department_id),
	constraint location_fk
    foreign key (location_id) references locations(location_id)
                      
            
                      
                        );
                        



 


	alter table employees

    
    