create database task16

create table student_11
(
s_id int primary key,
sname varchar(20),
dept varchar(20),
yoc int
)

insert into student_11 values
(1, 'ronaldo', 'bscct', 2022),
(2, 'messi', 'bscit', 2023)

---1---
--restrict DML operations on Saturday and Sunday

alter trigger res_date on student_11 for insert,update,delete 
as
begin
  if datepart(dw,getdate()) in (7,1)
 begin
 print 'DML operations cannot be performed on Saturday and Sunday'
 rollback tran
 end
 end

 insert into student_11 values
(4, 'ronaldo', 'bscct', 2022)

--2---
-- restrict delete operations between 11:00AM to 15:00PM

create trigger res_del_time on student_11 for delete
as
begin
if datepart(hh,getdate()) between 11 and 15
begin
print 'cannot preform delete operations between 11:00AM to 15:00PM'
rollback tran
end
end

delete from student_11 where s_id=3

--3--
--show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed

create trigger ddl_server on all server for create_table,drop_table,alter_table,rename
as
begin
print 'trigged cannot perform operations'
rollback tran
end 
use mydb
create table trigger_mydb_ddl(id int)  