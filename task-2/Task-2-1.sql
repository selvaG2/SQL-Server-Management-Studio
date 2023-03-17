create table emp
(
emp_id int primary key,
emp_name varchar(25) unique,
age int check(age>18),
designation varchar(20) default 'dev'
)

insert into emp values (1,'selva',19,'Dev')

insert into emp values (1,'prakash',20,'Des')

insert into emp values (2,'selva',49,'Dev')

insert into emp values (2,'harsha',16,'Des')

insert into emp(emp_id,emp_name,age) values (3,'Alex',19)

select * from emp


