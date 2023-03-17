create database data1

use data1

create table student(
stuname varchar(20),
stuclass varchar(5),
subjects varchar(20),
age int
)

select * from student

insert into student values('ranita','B','maths',15,'B+'),
('nija','A','science',15,'B-'),('manya','B','maths',16,'A+'),
('vinthiya','A','chemistry',15,'B+'),('sanjana','A','social',16,'O+'),
('abishek','B','chemistry',15,'AB-'),
('parthiban','A','english',15,'O-')

alter table student add bloodgroup varchar(20)

truncate table student

alter table student drop column age

update student set subjects='social' where stuname='ranita'

select * from student where bloodgroup= 'B-'

delete student