use mydb
create table student_11
(
s_id int,
sname varchar(20),
dept varchar(20),
yoc int
)

insert into student_11 values
(1, 'ronaldo', 'bscct', 2022),
(2, 'messi', 'bscit', 2023),
(3, 'neymar', 'bca', 2022),
(4, 'luiz', 'bca', 2020),
(5, 'philippe', 'bca', 2022),
(6, 'ronaldinho', 'bscit', 2023),
(7, 'paulo', 'bca', 2020),
(8, 'pele', 'bscit', 2021),
(9, 'diego', 'bsc', 2023),
(10, 'marco', 'bsc', 2021),
(11, 'zindaine', 'bca', 2022),
(12, 'angel', 'bca', 2023),
(13, 'kylian', 'Sociology', 2021),
(14, 'eden', 'bscct', 2021),
(15, 'johan', 'bscit', 2020),
(16, 'lizandro', 'bsc', 2020),
(17, 'Joshua Perez', 'bsc', 2023),
(18, 'manuel', 'bscct', 2021),
(19, 'markandre', 'bca', 2023),
(20, 'de', 'bscit', 2023)


select * from student_11
-- 1 Simplify the table to show the number of students in each department and categorize them based on yearofcompletion.

--pivot

select dept,[2020],[2021],[2022],[2023] from (select s_id,dept,yoc from student_11 ) as p1
pivot
(
count(s_id) for yoc in([2020],[2021],[2022],[2023])
) as p2 order by dept

--unpivot

select s_id,dept,yoc from(
select dept,[2020],[2021],[2022],[2023] from (select s_id,dept,yoc from student_11 ) as p1
pivot
(
count(s_id) for yoc in([2020],[2021],[2022],[2023])
) as p2 
)as p
unpivot(
s_id for yoc in([2020],[2021],[2022],[2023])
)as up

select * from student_11

-- 2 Create a database for Library Management. Analyse the required columns, perform a normalization and link the tables using primary and foreign key (using on update set default)

create database lib_mamagement
use lib_mamagement

create table student(
stu_id int,
s_name varchar(20),
book_id int references lib(book_id),
dept varchar(20),
b_name varchar(20) references branch(b_name)
)

insert into student values(101,'ranita',2345,'bsc','kovaipudur'),(120,'harish',5643,'bca','mettupalayam')

create table lib
(
book_id int primary key,
book_name varchar(20)
)

insert into lib values(2345,'harry'),(5643,'potter')

create table branch(
b_name varchar(20) primary key,
lib_ass_name varchar(20),
block_num int
)

insert into branch values('kovaipudur','ishu',20),('mettupalayam','meena',1)

select * from student
select * from branch
select * from lib

drop table branch
drop table lib

--on update set default

alter table student drop constraint [FK__student__b_name__4222D4EF]
alter table student drop column b_name
alter table student add b_name varchar(20) default 'coimbatore' constraint fk_b_name foreign key(b_name) references branch(b_name) on update set default

update student set b_name='mettupalayam' where stu_id=101
update student set b_name='mettupalayam' where stu_id=120

update branch set b_name='banglore' where b_name='kovaipudur'

