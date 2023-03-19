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

insert into keys.address values (1,'mannford','oklahoma(OK)',74044),
insert into keys.address values(2,'sidney','ohio(OH)',45365)
insert into keys.address values(3,'bk pudur','kovai',00200)


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

select * from keys.address
select * from keys.department
select * from keys.employee

drop table keys.address
drop table keys.department
drop table keys.employee

--Referential Integrity

--on delete cascade/on update cascade
alter table keys.employee drop constraint [FK__employee__deptid__42E1EEFE]

alter table keys.employee add constraint FK__employee__deptid foreign key(deptid) references keys.department (deptid) on delete cascade on update cascade

delete from keys.department where deptid=100

update keys.department set deptid=100 where deptid=101 

--on delete set null/on update set null

alter table keys.employee drop constraint [FK__employee__addres__43D61337]

alter table keys.employee add constraint FK__employee__address foreign key(address_id) references keys.address (address_id) on delete set null on update set null

update keys.address set address_id=3 where address_id=2

delete from keys.address where address_id=3

--on delete set default/on update set null

alter table keys.employee drop constraint [FK__employee__addres__55009F39]
alter table keys.employee drop column address_id
alter table keys.employee add address_id int default 4 constraint FK__employee__address foreign key(address_id) references keys.address (address_id) on delete set default on update set null

update keys.employee set address_id=1 where id=1
update keys.employee set address_id=2 where id=2
update keys.employee set address_id=3 where id=3

delete from keys.address where address_id=1

update keys.address set address_id=5 where pincode=45365