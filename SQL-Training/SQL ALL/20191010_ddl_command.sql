select * from sys.tables
select * from sys.schemas

create schema sales
create schema purchase


create table sales.demo
(
	id int,
	name varchar(20),
	gender varchar(6)
)

select * from sales.demo
select * from demo


-- ******************************* alter command *******************************

-- add new column
alter table demo
add mobile varchar(5)

-- remove column
alter table demo 
drop column mobile

-- alter column
alter table demo 
alter column mobile numeric(10)


-- ******************************* drop command *******************************

drop table sales.demo
drop schema sales


-- ******************************* rename *******************************

execute sp_rename 'demo','temp'


-- ******************************* truncate *******************************

truncate table emp
