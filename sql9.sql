--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.

create procedure p_conditional(@name varchar(25))
as
begin 
if ((select studentname from std where studentname=@name)=@name)
begin
print 'the name' + @name + 'is found';
end
else
begin
print 'the name' + @name + 'is not found';
end
end

execute p_conditional 'ranita'

--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.

alter procedure p_remarks
as
begin
select studentname,semester,totalmarks,securedmarks,
CASE securedmarks
 when ' 485' then 'excellent'
 when ' 400' then 'good'
 when ' 412' then 'good'
 when ' 457' then 'v.good'
 when ' 425' then 'goodgood'
 when ' 456' then 'claps'
  end as remarks
  from std
  end

  execute p_remarks

--3   Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--temporary table local
create table #ltemp
(
id int,
name varchar(20)
);

insert into #ltemp values(1,'ranita')

--temporary table global
create table ##gtemp
(
id int,
name varchar(20)
);

insert into ##gtemp values(2,'ashiiq')

--temporary stored procedure local
create procedure #temp
as
begin
print 'hey temp'
end

execute #temp
 --temporary stored procedure global
create procedure ##temp1
as
begin
print 'hey global temp'
end

execute ##temp1