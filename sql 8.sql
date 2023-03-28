use mydb

--create table
create table std (
studentid int identity(1,1),
studentname varchar(20),
semester varchar(20), 
securedmarks int, 
totalmarks int
)

insert into std values('john','sem 5',457,500),('ranita','sem 1',485,500),('harish','sem 3',456,500),('ashiq','sem 1',425,500),('salman','sem 2',412,500)
select * from std

-- 1  Create User-define Scalar function to calculate percentage of all students 
create  function calpercent(@mark int,@totalmarks int)
returns int
as
begin
declare @percent int
set @percent=((@mark * 100)/@totalmarks)
return @percent
end

--function call
select studentname,dbo.calpercent(securedmarks,totalmarks)  as percentage  from  std;

--2   Create user-defined function to generate a table that contains result of Sem 3 students
create function sem1res(@sem varchar(20))
returns table
as
return (select * from dbo.std where semester = @sem)

--function call
select * from dbo.sem1res('sem 3')

--3    Write SQL stored procedure to retrieve all students details(no parameter)

create procedure p_std_details
as
begin
select * from std
end

--procedure execution
execute p_std_details

-- 4  Write SQL store procedure to display Sem 1 students details.(1 parameter)

create procedure p_std_details2(@semresult varchar(20))
as
begin
select * from std where (semester = @semresult )
end

--procedure execution
execute p_std_details2 'sem 1'

-- 5  Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create procedure p_stud_details3(@semres varchar(20) output)
AS
BEGIN
select COUNT(studentid)AS totalstudents from std
end

declare @total int
exec p_stud_details3 @total output
print @total

-- 6  Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
--TARGET TABLE
select*into backup_std from std

select * from backup_std
select * from std

insert into std values('sam','sem 1',400,500)
insert into backup_std values('resh','sem 3 ',450,500)

--merge statement
merge backup_std as b using (select * from std where semester='sem 1') as s
on (s.studentid=b.studentid )
when matched 
then update set 
b.studentname=s.studentname,
b.semester=s.semester,
b.securedmarks=s.securedmarks,
b.totalmarks=s.totalmarks
when not matched by target then 
insert(studentname,semester,securedmarks,totalmarks)values(s.studentname,s.semester,s.securedmarks,s.totalmarks)
when not matched by source 
then delete;

--select
select * from backup_std
select * from std

--drop
drop table std
drop table backup_std

