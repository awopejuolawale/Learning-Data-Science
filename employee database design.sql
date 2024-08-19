-- Class Assessment on SQL.
-- create employee database.
-- Company Analysis project.

create database if not exists company;

use company;
create table if not exists employees (
   employee_no int primary key,
   birth_date  Date,
   first_name varchar(14),
   last_name varchar (16),
   gender enum ('M', 'F'),
   hire_date Date);

create table if not exists dept_manager(
   dept_no char(4),
   emp_no int,
   from_date date, 
   to_date date);
   
ALTER TABLE dept_manager
ADD CONSTRAINT FOREIGN KEY (dept_no) references departments (dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT FOREIGN KEY (emp_no) references employees (employee_no);


create table if not exists departments(
   dept_no char(4) primary key,
   dept_name varchar(40));
  
create table if not exists titles(
      emp_no int,
      title varchar(50),
      from_date date,
      to_date date);
      
      ALTER TABLE titles
      ADD CONSTRAINT FOREIGN KEY(emp_no) references employees (employee_no);
      
create table if not exists salaries(
   emp_no int,
   salary int,
   from_date date,
   to_date date);      
   ALTER TABLE salaries
   ADD CONSTRAINT FOREIGN KEY (emp_no) references employees (employee_no);
   
   create table if not exists dept_emp(
  emp_no int,
  dept_no char(4),
  from_date date,
  to_date date);

ALTER TABLE dept_emp
ADD CONSTRAINT FOREIGN KEY (emp_no) references employees (employee_no);

ALTER TABLE dept_emp
ADD CONSTRAINT FOREIGN KEY (dept_no) references departments(dept_no);

-- insert data into company database created

insert into employees (employee_no, birth_date, first_name, last_name, gender, hire_date)
values(10001,  "1980/1/15", "John", "Smith", "M", "2001/7/15"),
	  (10002, "1982/3/25",  "Emily", "Johnson", "F", "2005/2/28"),
      (10003, "1975/12/10", "Michael", "Williams", "M", "2003/11/10"),
      (10004, "1988/5/20", "Jessica","Brown",	"F", "2007/9/15"),
      (10005, "1984/8/30", "David","Jones","M", "2002/4/20"),
      (10006, "1981/6/12", "Sarah","Anderson","F", "2004/3/18"),
      (10007, "1979/10/5", "Christopher","Davis","M","2006/8/22"),
      (10008, "1983/9/17", "Anna","Miller","F","2008/11/30"),
      (10009, "1986/2/28",  "Ryan","Moore","M","2010/5/14"),
      (10010, "1989/7/19",  "Amanda","Wilson","F", "2009/3/26");
      
      
insert into dept_manager(dept_no, emp_no, from_date, to_date)
values('d001', 10001, '2001/7/15', '2005/2/28'),
	  ('d002', 10002,	'2005/2/28',	'2007/9/15'),
      ('d003', 10003,	'2003/11/10',	'9999/1/1'),
      ('d004', 10004,	'2007/9/15', '2010/12/31'),
      ('d005', 10005,	'2002/4/20', '9999/1/1'),
      ('d001', 10006,	'2004/3/18',	'9999/1/1'),
      ('d002', 10007,	'2006/8/22', '9999/1/1'),
      ('d003', 10008,	'2008/11/30', '9999/1/1'),
      ('d004', 10009,	'2010/5/14', '9999/1/1'),
      ('d005', 10010,	'2009/3/26',	'9999/1/1');


insert into departments(dept_no, dept_name)
values('d001',	'HR'),
       ('d002',	'Finance'),
       ('d003',	'Marketing'),
       ('d004',	'Engineering'),
       ('d005',	'Sales'),
       ('d006',	'IT'),
       ('d007',	'Operations'),
       ('d008',	'Research'),
       ('d009',	'Quality Assurance'),	
       ('d010',	'Customer Service');
       
insert into titles(emp_no, title, from_date, to_date)
values(10001,	'Manager',	'2001/7/15',	'2005/2/28'),
			(10001,	'Senior Manager',	'2005/2/28',	'9999/1/1'),
            (10002,	'Analyst',	'2005/2/28',	'2007/1/1'),
            (10002,	'Senior Analyst',	'2007/1/1',	'9999/1/1'),
            (10003,	'Coordinator',	'2003/11/10',	'2006/1/1'),
            (10003,	'Manager',	'2006/1/1',	'2010/12/31'),
            (10004,	'Engineer',	'2007/9/15',	'9999/1/1'),
            (10005,	'Sales Associate',	'2002/4/20',	'9999/1/1'),
            (10006,	'Analyst',	'2004/3/18',	'9999/1/1'),
            (10007,	'Manager',	'2006/8/22',	'9999/1/1'),
            (10008,	'Coordinator',	'2008/11/30',	'9999/1/1'),
            (10009,	'Engineer',	'2010/5/14',	'9999/1/1'),
            (10010,	'Sales Associate',	'2009/3/26',	'9999/1/1');
            
insert into salaries (emp_no, salary, from_date, to_date) 
values(10001,	65000,	'2003/1/1', 	'2005/2/28'),
      (10001,	70000,	'2005/2/28',	'9999/1/1'),
      (10002,	55000,	'2005/2/28',	'2007/1/1'),
      (10002,	60000,	'2007/1/1',	   '9999/1/1'),
      (10003,	62000,	'2003/11/10',	'2006/1/1'),
      (10003,	65000,	'2006/1/1',	  '2010/12/31'),
      (10004,	70000,	'2007/9/15',	'9999/1/1'),
      (10005,	58000,	'2002/4/20',	'2004/1/1'),
      (10005,	62000,	'2004/1/1',	    '9999/1/1'),
      (10006,	63000,	'2004/3/18',	'9999/1/1'),
      (10007,	60000,	'2006/8/22',	'9999/1/1'),
      (10008,	64000,	'2008/11/30',	'9999/1/1'),
      (10009,	67000,	'2010/5/14',	'9999/1/1'),
      (10010,	59000,	'2009/3/26',	'9999/1/1');
      
insert into dept_emp(emp_no, dept_no, from_date, to_date)
values(10001,	'd001',	'2001/7/15',	'9999/1/1'),
	  (10002,	'd002',	'2005/2/28',	'9999/1/1'),
	  (10003,	'd003',	'2008/1/10',	'2010/12/31'),
      (10004,	'd004',	'2007/9/15',	'9999/1/1'),
      (10005,	'd005',	'2002/4/20',	'9999/1/1'),
      (10006,	'd001',	'2004/3/18',	'9999/1/1'),
      (10007,	'd002',	'2006/8/22',	'9999/1/1'),
      (10008,	'd003',	'2008/11/30',	'9999/1/1'),
      (10009,	'd004',	'2010/5/14',	'9999/1/1'),
      (10010,	'd005',	'2009/3/26',	'9999/1/1'); 
      
      
--- ANSWERS TO PROBLEM STATEMENTS

-- Answers To Problem Statement1 (Question Number 1).

select all first_name, last_name
from employees;

-- Answer To Problem Statement2 ( Question Number 2).

select dept_no, dept_name
from departments;

-- Answer To Problem Statement3 (Question Number 3).
-- Get the total number of employees.

select count(employee_no)
from employees;

--- Answer To Problem Statment 4 (Question Number 4).

select avg (salary)
from salaries;


--- Answer To Problem Statement 5 (Question Number 5).
select hire_date, birth_date
from employees
where employee_no  = '10003';

--- Answer To Problem Statement 6 (Question Number 6).
select all title
from titles;


--- Answer To Problem Statement 7 (Question Number 7).
select count(dept_name)
from departments;

--- Answer To Problem Statement 8 (Question Number 8).
select departments.dept_name, departments.dept_no
from departments
inner join dept_emp on dept_emp.dept_no = departments.dept_no
inner join employees on employees.employee_no = dept_emp.emp_no
where employee_no = "10004";

 --- Answer To Problem Statement 9 (Question Number 9).   
select gender
from employees
where employee_no ='10007';


--- Answer To Problem Statement 10 (Question Number 10).
select max(salary)
from salaries;
 
--- Answer To Problem Statement 11 (Question Number 11).

select employees.employee_no,employees.first_name,employees.last_name
from employees
inner join titles on title.emp_no = employee.first_name.last_name
