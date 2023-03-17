use data1
--renaming a schema
create schema sql

create table sql.stud(
id int,
)

insert into sql.stud values(101)

select * from sql.stud

create schema sqlts

alter schema sqlts transfer sql.stud

alter schema sqlts transfer dbo.trainees

drop table stud

--renaming a database

exec sp_renamedb 'data1','mydb'

--renaming a table

create table sqlts.employee(
id int identity(1,1) primary key,
name varchar(20) unique,
salary int default 20000,
increment int check(increment>4)
)

select * from sqlts.employee
drop table sqlts.employee
insert into sqlts.employee values('ranita',30000,5)
insert into sqlts.employee values('harita',40000,6)
insert into sqlts.employee values('yamini',50000,6)
insert into sqlts.employee values('harish',40000,16)
insert into sqlts.employee values('rama',100000,7)
insert into sqlts.employee (name,increment) values('ram',25)

--computed column

alter table sqlts.employee add revised_salary as (salary +' ' +increment)

--selecting records and moving them into new  table

select * from sqlts.employee where salary>20000 

select * into sqlts.emp from sqlts.employee where salary>20000 

select * from sqlts.emp
