
--database rename
alter database [practice] modify name=[task]

--schema creation
create schema task2

create table task2.table2
(
std_id int,
std_name varchar(25)
)

insert into task2.table2 values (1,'selva'),(2,'ganapathi')

create schema schema1

--rename schema
alter schema schema1 transfer task2.table2;

--drop unwanted schema
drop schema task2

--renaming the table
exec sp_rename 'schema1.table2','table'

exec sp_rename 'schema1.table','table2'