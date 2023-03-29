use mydb


create table training
(
e_id int,
fname varchar(20),
lname varchar(20),
email varchar(20),
pno bigint,
hire_date date,
jobid int,
salary int
)

insert into training values
(101,'ranita','nagarajan','ranita@gmail.com',9089767548,'2022-05-20',1,20000),
(102,'harita','nagarajan','harita@gmail.com',2453789103,'2022-05-20',2,20000),
(103,'hari','karthic','hari@gmail.com',3545287193,'2022-05-20',3,30000),
(104,'selva','ganapathi','selva@gmail.com',2348965402,'2022-05-20',4,40378),
(105,'arun','karthi','arun@gmail.com',4578653234,'2022-05-20',5,32456),
(106,'harshan','harsha','harshan@gmail.com',3564718934,'2022-05-20',6,40000),
(107,'sharon','david','sharon@gmail.com',9890987890,'2022-05-20',7,23000),
(108,'harish','mitha','harish@gmail.com',5454673850,'2022-05-20',8,55000),
(109,'yamini','priya','yamini@gmail.com',34345264357,'2022-05-20',9,80000),
(110,'vikram','vik','vikram@gmail.com',3489876780,'2022-05-20',10,30000),
(111,'vikhi','vignesh','vikhi@gmail.com',2313245231,'2022-05-20',11,20000),
(112,'dharshan','shan','dharshan@gmail.com',3409675420,'2022-05-20',12,30000),
(113,'vasanth','vasan','vasanth@gmail.com',25674892037,'2022-05-20',13,40000),
(114,'karthic','kumar','karthic@gmail.com',5627649098,'2022-05-20',14,20000),
(115,'divya','prakash','dhivya@gmail.com',2343156534,'2022-05-20',15,55000),
(116,'arjun','venkit','arjun2gmail.com',2341564589,'2022-05-20',16,35000),
(117,'hemanth','hema','hema@gmail.com',3450987656,'2022-05-20',17,10000),
(118,'dhana','prakash','dhana@gmail.com',9098789098,'2022-05-20',18,80000),
(119,'siva','barath','siva@gmail.com',3450984567,'2022-05-20',19,60000),
(120,'srikanth','sri','sri@gmail.com',3450984509,'2022-05-20',20,65000)

select * from training

drop table training

-- 1   Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

select fname,lname,salary from training where salary > (select salary from training where jobid=16)

-- 2  Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID

select fname,lname,jobid from training where hire_date =(select hire_date from training where jobid=11)

-- 3  Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name

select t.e_id,t.fname,t.lname,t.salary from(select avg(salary) as avgsalary from training)as a,Training as t where t.salary > a.avgsalary

-- 4 Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary

-- in simple way

select fname,lname,e_id,salary from training where fname='yamini'

--subquery

select fname,lname,e_id,salary from training where fname=(select fname from training where fname='yamini')

-- 5   Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

select * from training where salary >= (select min(salary) as minval from training) and salary<=25000



