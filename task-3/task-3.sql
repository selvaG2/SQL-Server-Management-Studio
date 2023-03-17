--Department table

create table department
(
dep_id int primary key,
dep_name varchar(25)
)

--department values insertion
insert into department values (100,'Developer'),(101,'UI/UX')

-------------------------------------------------------------------------------------------------------------
--Address table 
create table address
(
address_id int primary key,
city varchar(15),
states varchar(20),
pincode int
)

--Address insertion
insert into address values (1,'Mannford','Oklahoma(OK)',74044),(2,'Sidney','Ohio(OH)',45365)

select * from department
select * from address
---------------------------------------------------------------------------------------------------------

--employee table
create table employee
(
e_id int primary key,
e_name varchar(25) unique,
designation varchar(25),
d_id int references department(dep_id),
mobile1 bigint,
mobile2 bigint default 9875625272,
roomno int,
add_id int references address(address_id)
)

insert into employee values(1,'jackie','Developer',100,1234567890,0987654321,103,1)
insert into employee values(2,'Bheema','Designer',101,9087612345,5432109876,106,2)
insert into employee values(3,'Ben','Developer',100,9612345087,5098764321,102,1)
insert into employee(e_id,e_name,designation,d_id,mobile1,roomno,add_id) values(4,'Gwen','Developer',100,9650871234,104,2)

select * from employee

--drop table
drop table employee
