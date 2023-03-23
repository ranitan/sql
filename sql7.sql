use mydb

create table students(
s_id int primary key,
s_name varchar(25),
dept varchar(25),
score int
)

INSERT INTO students (s_id, s_name, dept, score) VALUES
(1, 'ronaldo', 'bsc ct', 85),
(2, 'messi', 'bsc it', 92),
(3, 'neymar', 'bca', 76),
(4, 'luiz', 'bca', 89),
(5, 'philippe', 'bca', 78),
(6, 'ronaldinho', 'bsc it', 91),
(7, 'paulo', 'bca', 84),
(8, 'pele', 'bsc it', 72),
(9, 'diego', 'bsc', 87),
(10, 'marco', 'bsc', 80),
(11, 'zindaine', 'bca', 93),
(12, 'angel', 'bca', 75),
(13, 'kylian', 'Sociology', 88),
(14, 'eden', 'bsc ct', 82),
(15, 'johan', 'bsc it', 79),
(16, 'lizandro', 'bsc', 86),
(17, 'Joshua Perez', 'bsc', 73),
(18, 'manuel', 'bsc ct', 90),
(19, 'markandre', 'bca', 77),
(20, 'de', 'bsc it', 83),
(21, 'virgil', 'Management', 81),
(22, 'mappae', 'bca', 74),
(23, 'robert', 'bsc it', 85),
(24, 'lewan', 'bsc ct', 89),
(25, 'dowski', 'bca', 76);

select * from students

drop table students

--1  non-clustered index

create index students_index on students(dept)

--2  filtered index

create index filter_students_index on students(dept) where dept='bca'

-- 3  view

create view students_view as select * from students 

select * from students_view

drop view students_view

-- 4  rank

select s_id,s_name,dept,score,rank()over(order by score desc)as score_rank from students

-- 5 dense rank

select s_id,s_name,dept,score,rank()over(partition by dept order by score) as for_each_dep_rank from students

create table manager(
m_id int primary key,
m_name varchar(20)
)

insert into manager values(101,'ranita'),(102,'harish'),(103,'salman'),(104,'hari'),(105,'ashiq')



create table emp(
e_id int primary key,
e_name varchar(20),
m_id int references manager(m_id),
e_dept varchar(20)
)

insert into emp values(1,'jim',101,'science'),(2,'jam',102,'bio'),(3,'juck',103,'science'),(4,'jimmy',104,'social')

select * from manager
select * from emp


-- 1  view

create view manager_emp_view as select m.m_id,m.m_name,e.e_id,e.e_name,e.e_dept from manager as m inner join emp as e on m.m_id=e.m_id

select * from manager_emp_view

--2 on delete cascade on update set default

--on delete cascade
alter table emp drop [FK__emp__m_id__4E1E9780]

alter table emp add constraint fk_emp_m_id foreign key(m_id) references manager(m_id) on delete cascade



delete from manager where m_name='ranita'

--on update set default

alter table emp drop [FK__emp__m_id__603D47BB]

alter table emp drop column m_id

alter table emp add m_id int default 102 constraint fk_emp_m_id foreign key (m_id) references manager (m_id) on update set default



update emp set m_id=100 where e_id=1
update emp set m_id=101 where e_id=2
update emp set m_id=102 where e_id=3
update emp set m_id=103 where e_id=4


update manager set m_id=200 where m_id=103