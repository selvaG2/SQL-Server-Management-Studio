--database

create database g2

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
designation varchar(25) default 'Traineer',
d_id int references department(dep_id),
mobile1 bigint,
mobile2 bigint default 9875625272,
roomno int,
add_id int references address(address_id)
)

insert into employee values(1,'jackie','Developer',100,1234567890,0987654321,103,1)
insert into employee values(2,'Bheema','Designer',101,9087612345,5432109876,106,2)
insert into employee values(3,'Ben','Developer',100,9612345087,5098764321,102,1)
insert into employee(e_id,e_name,designation,d_id,mobile1,roomno,add_id) values(4,'Gwen 10','Developer',101,9650871234,104,2)

select * from employee

-----------------------------------------------------------------------------------------------

--drop constraints 
alter table employee drop constraint FK__employee__d_id__4F7CD00D

--add constraint (on delete cascade on update cascade)
alter table employee add constraint FK__employee__d_id foreign key (d_id) references department(dep_id) on delete cascade on update cascade 

--on update cascade
update department set dep_id=102 where dep_id=101

select * from department
select * from employee

--on delete cascade
delete from department where dep_id=102

------------------------------------------------------------------------------------------------------------------------------
--drop constraints 
alter table employee drop constraint FK__employee__d_id

--add constraint (on delete set null on update set null)
alter table employee add constraint FK__employee__d_id foreign key (d_id) references department(dep_id) on delete set null on update set null

--add column
insert into department values (101,'UI/UX')

--add column
insert into employee values(2,'Bheema','Designer',101,9087612345,5432109876,106,2)
insert into employee(e_id,e_name,designation,d_id,mobile1,roomno,add_id) values(4,'Gwen 10','Developer',101,9650871234,104,2)


--on update set null
update department set dep_id=102 where dep_id=101

select * from department
select * from employee

--update the null value
update employee set d_id=102 where e_id=2 or e_id=4

-- on delete set null
delete from department where dep_id=102

--add column
insert into department values (101,'UI/UX')

--update the null value
update employee set d_id=101 where e_id=2 or e_id=4

---------------------------------------------------------------------------------------------------------------------------------------

--drop constraints 
alter table employee drop constraint FK__employee__d_id

--drop column
alter table employee drop column d_id

--add constraint (on delete set default on update set default)
alter table employee add d_id int default 100 constraint FK__employee__d_id foreign key(d_id) references department(dep_id) on delete set default on update set default

select * from department
select * from employee

--on update set default
update department set dep_id=102 where dep_id=101

--update the d_id values
update employee set d_id=102

--on update set default
update department set dep_id=101 where dep_id=102

--update the d_id values
update employee set d_id=101

--on delete set default
delete from department where dep_id=101

select * from department
select * from employee