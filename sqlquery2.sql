use data1
create data 1

create table trainees(
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)

select * from trainees

insert into trainees values
(101,'ranita','nagarajan',20000,2022/05/20,'backend'),
(102,'harita','nagarajan',30000,2022/05/20,'backend'),
(103,'hari','karthic',20000,2022/05/20,'backend'),
(104,'selva','ganapathi',20000,2022/05/20,'frontend'),
(105,'arun','karthi',50000,2022/05/20,'database'),
(106,'harshan','harsha',50000,2022/05/20,'frontend'),
(107,'sharon','david',60000,2022/05/20,'backend'),
(108,'harish','mitha',60000,2022/05/20,'frontend'),
(109,'yamini','priya',20000,2022/05/20,'backend'),
(110,'vikram','vik',20000,2022/05/20,'database'),
(111,'vikhi','vignesh',30000,2022/05/20,'backend'),
(112,'dharshan','shan',50000,2022/05/20,'database'),
(113,'vasanth','vasan',50000,2022/05/20,'database'),
(114,'karthic','kumar',45000,2022/05/20,'frontend'),
(115,'divya','prakash',36000,2022/05/20,'backend'),
(116,'arjun','venkit',25000,2022/05/20,'database'),
(117,'hemanth','hema',50000,2022/05/20,'backend'),
(119,'dhana','prakash',40000,2022/05/20,'frontend'),
(120,'siva','barath',40000,2022/05/20,'database')

select * from Trainees where FIRST_NAME LIKE '[J-T]%'

select * from Trainees where salary >=20000 and salary<=50000
select * from Trainees where FIRST_NAME LIKE '%i'
select distinct SALARY from Trainees
select * from Trainees where DEPARTMENT ='DESIGNER' OR DEPARTMENT = 'DEVELOPER'
select * from Trainees where Trainee_ID<5
select * from Trainees order by Trainee_ID offset 5 rows fetch next 10 rows only
select top 5 with ties * from Trainees order by Trainee_ID
select * from Trainees order by DEPARTMENT DESC
select * from Trainees where LAST_NAME LIKE 'A%'

