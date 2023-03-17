--table creation
create table g2
(
e_id int identity(1,1),
e_name varchar(25),
salary int,
increment int
)

select * from g2

--insertion
insert into g2(e_name,salary,increment) values('Selva',50000,5000),('subasurya',30000,9000),('kanakaraj',20000,6000)

--computed column
alter table g2 add revised_salary as (salary+increment);

--extra values to show the difference
insert into g2(e_name,salary,increment) values('Siva',5000,5000),('surya',13000,9000),('raj',12000,6000)

--select into
select * into cgvak from g2 where revised_salary>20000

select * from cgvak