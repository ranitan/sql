create database task15
---1---
create table student_11
(
s_id int primary key,
sname varchar(20),
dept varchar(20),
yoc int
)

--auto commit

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

--auto rollback

insert into student_11 values(10,'dhoni','bsc',2020)

---2---
--implicit transactions

set implicit_transactions on
insert into student_11 values(24, 'san', 'bscit', 2023)
select iif(@@OPTIONS & 2=2,'implicit on','implicit off') as implicit_on_off
select @@TRANCOUNT as trancount
commit
select @@TRANCOUNT as next_trancount
set implicit_transactions off

select * from student_11

---3----
--explicit

--insert commit

begin tran
insert into student_11 values(27, 'tan', 'bscit', 2023)
select @@TRANCOUNT as trancount
commit
select @@TRANCOUNT as next_trancount

select * from student_11

--rollback update

begin tran
update student_11 set dept='bca' where s_id='25'
select * from student_11
rollback tran
select * from student_11

--savepoint -> update,insert
--rollback -> delete

begin tran
insert into student_11 values(26, 'yamini', 'bca', 2023),(27, 'harish', 'bscit', 2023)
update student_11 set dept='bca' where s_id=27
select * from student_11

save transaction insert_update
select * from student_11

delete from  student_11 where s_id='25'
select * from student_11
rollback tran insert_update

select * from student_11

