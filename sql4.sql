use mydb

--creating a schema keys

create schema keys

create table keys.department(
deptid int primary key,
deptname varchar(20) 
)

insert into keys.department values(100,'developer'),(101,'ui/ux')




create table keys.address(
address_id int primary key,
city varchar(20),
state varchar(20),
pincode int
)

insert into keys.address values (1,'mannford','oklahoma(OK)',74044),(2,'sidney','ohio(OH)',45365)



create table keys.employee(
id int primary key,
name varchar(10) not null unique,
designation varchar(20),
deptid int references keys.department(deptid),
mobile1 bigint,
mobile2 bigint,
street_address varchar(25),
address_id int references keys.address(address_id)
)

insert into keys.employee values(1,'john','developer',100,9025457758,123456789,'243 hinton rd',1)
insert into keys.employee(id,name,designation,deptid,mobile1,street_address,address_id)values(2,'jamie','designer',101,9786657055,'214 dorley rd',2)
insert into keys.employee values(3,'jack','developer',100,6383125860,362578951,'236 hinton rd',1)

select * from keys.department
select * from keys.address
select * from  keys.employee

