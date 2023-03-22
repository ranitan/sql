use mydb

--create table salesman

create table salesman
(salesman_id int ,
name varchar(20),
city varchar(20),
commision float)


insert into salesman values(5001,'James Hoog','new york',0.15),
(5002,'Nail Knite','paris',0.13),
(5005,'Pit Alex','london',0.11),
(5006,'Mc Lyon','paris',0.14),
(5007,'Paul Adam','rome',0.13),
(5003,'Lauson Hen','san jose',0.12)



--create customer table

create table customer
(customer_id int,
cust_name varchar(20),
city varchar(20),
grade int ,
salesman_id int)


insert into customer values
(3002,'Nick Rimando','new york',100,5001),
(3007,'Brad Davis','new york',200,5001),
(3005,'Graham Zusi','california',200,5002),
(3008,'Julian Green','london',300,5002),
(3004,'Fabian Johnson','paris',300,5006),
(3009,'Geoff Cameron','berlin',100,5003),
(3003,' Jozy Altidor','moscow',200,5007)
insert into customer (customer_id ,cust_name ,city ,salesman_id)values(3001,' Brad Guzan','london',5005)



--create table orders

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(8,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);

select * from salesman
select * from customer
select * from orders

drop table salesman
drop table customer
drop table orders

--1  based on city

select s.salesman_id,s.name,s.city,s.commision,c.cust_name,c.city from salesman as s inner join customer as c on s.city=c.city

--2 commision>12%

select s.salesman_id,s.name,s.city,s.commision,c.cust_name,c.city from salesman as s inner join customer as c on s.salesman_id=c.salesman_id where commision>0.12

--3 details of order

select s.salesman_id,s.name,s.city,s.commision,c.cust_name,grade,o.ord_no,o.purch_amt,o.ord_date from salesman as s inner join customer as c on s.salesman_id=c.salesman_id inner join orders as o on c.customer_id=o.customer_id 

--4 order amt exists between 500 and 2000

select o.ord_no,o.purch_amt,c.cust_name,c.city from customer as c inner join orders as o on c.customer_id=o.customer_id where purch_amt>500 and purch_amt<2000

--5 order by ascending 

  select c.cust_name,c.city ,c.grade,c.customer_id,s.name from customer as c inner join salesman as s on s.salesman_id=c.salesman_id order by customer_id