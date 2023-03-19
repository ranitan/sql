USE mydb

-- table worker([PK__Worker__03DCC97FA8F0A17B])

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001, 'Ranita', 'Nagarajan', 80000, '2000-02-02', 'Admin'),
(002, 'Niharika', 'Verma', 80000, '2000-02-02', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2000-02-02', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2000-02-02', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2000-02-02', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2000-02-02', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2000-02-02', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2000-02-02', 'Admin');


--table bonus([FK__Bonus__WORKER_RE__671F4F74])

CREATE TABLE Bonus (

WORKER_REF_ID INT, BONUS_AMOUNT INT, BONUS_DATE DATETIME, FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE);

INSERT INTO Bonus

(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES

(001,	5000,	'2016-02-02'),
(002,	3000,	'2016-06-01'),
(003,	4000,	'2016-02-02'),
(001,	4500,	'2016-02-02'),
(002,	3500,	'2016-06-01');

--table title([FK__Title__WORKER_RE__690797E6])

CREATE TABLE Title (

WORKER_REF_ID INT, WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME, FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title

(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES

(001, 'Manager', '2016-02-20 00:00:00'),

(002, 'Executive', '2016-06-11 00:00:00'),

(008, 'Executive', '2016-06-11 00:00:00'),

(005, 'Manager', '2016-06-11 00:00:00'),

(004, 'Asst. Manager', '2016-06-11 00:00:00'),

(007, 'Executive', '2016-06-11 00:00:00'),

(006, 'Lead', '2016-06-11 00:00:00'),

(003, 'Lead', '2016-06-11 00:00:00');


select * from worker
select * from bonus
select * from title

--fetching firstname from worker table to a column workername

Select FIRST_NAME AS WORKER_NAME from Worker

--changes the firstname from workertable to uppercase

Select upper(first_name) from worker

--selecting unique values in the department column of worker table

select distinct department from worker

--selecting first 3 characters from firstname column in worker table

select first_name,substring(first_name, 1,3) as short_names from worker

--selecting unique values from department table and length of the department in worker table

select distinct(department),len(department) from worker

--selecting the firstname and lastname and concatinating with one space as a new column completename

select concat(first_name, space(1),last_name) as complete_name from worker

--printing the details of vipul and satish

select * from worker where first_name in ('vipul','satish')

--printing the admin details

select * from worker where department in ('admin')

--printing the firstname ends with a

select * from worker where FIRST_NAME LIKE '%a'

--printing firstname that contains letter a

select * from worker where FIRST_NAME LIKE '%a%'