--using ny database
use mydb

--creating a table trainees
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--inserting values
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,JOINING_DATE, DEPARTMENT) VALUES
(001, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(002, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(003, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(004, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(005, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(006, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(007, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

select * from trainees

drop table trainees

--1 to count number of all the employees in each department
SELECT department, COUNT(*) as depts FROM trainees GROUP BY department;

--10 identity
create table stu(
s_id int identity(1,1),
s_name varchar(20),
s_mark int
)

insert into stu(s_name,s_mark) values('ranita',100)
insert into stu(s_name,s_mark) values('harish',95)
insert into stu(s_name,s_mark) values('mitha',50) 

select * from stu

set identity_insert stu on

--make it on to add insert values explicitly

set identity_insert stu off

insert into stu(s_name,s_mark) values('surya',78)

--2 calculate the estimated induction program day

 select dateadd(month , 5,'2023-03-20')as induction_date

--3 retrieve the month in words

SELECT joining_date,CHOOSE(MONTH([joining_date]),'January','February','March','April','May','June','July','August','September','October','November','December') AS months FROM trainees;

 --4 total and subtotal

 SELECT coalesce (department, 'All Departments') AS Department,sum(salary) as Total_salary FROM Trainees group by rollup (department)

-- 5 retriving 3 records randomly

 select top 3 with ties TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,JOINING_DATE, DEPARTMENT from trainees order by first_name

 --6  composite key
create table employ
(
employ_id int ,
employ_name varchar(20),
employ_number int,
constraint pk_id Primary Key(employ_id),
constraint uk_id_name Unique (employ_id,employ_name)
)

insert into employ(employ_id,employ_name) values(101,'ranita')
insert into employ(employ_id,employ_name) values(102,'harish')

select * from employ


--7 IIF

select first_name AS name,IIF(SALARY > 100000,'senior','junior') AS position from Trainees;

--8 working of sequence

create sequence [dbo].[sequencestud]
as int
start with 1
increment by 1

create table stud
(
stud_id int primary key,
stud_name varchar(20)
)

insert into stud values(next value for [dbo].[sequencestud],'ranita')

select * from stud

drop table stud --first drop the table and then sequence

drop sequence [dbo].[sequencestud]

--9 synonym

use db

create synonym e for mydb.dbo.employ

select * from e