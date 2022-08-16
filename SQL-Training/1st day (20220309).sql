create database kcs

select * from sys.schemas


create table tmp
(
id int,
name varchar(20)
)

select * from kcs.dbo.tmp

create schema abc


create table kcs.abc.tmp
(
id int,
name varchar(20),
gender varchar(10)
)

select * from abc.tmp



select * from tmp


alter table tmp
add mob numeric(10)

alter table tmp
alter column name varchar(100)

alter table tmp
drop column mob


--ddl : create,alter,drop,truncate,rename (sp_rename)
--dml : insert,update,delete


select * from tmp

insert into tmp values(1,'hello',654)
insert into tmp(id,name) values(2,'demo')

insert into tmp(mob,id,name) values(56654,5,'demo')


insert into tmp(mob,name,id)
select 9876543,'xyz',6

insert into tmp(mob,name,id)
select 'xyz',6,9876543


select * from tmp
select * from abc.tmp

insert into abc.tmp(id,name)
select id,name from tmp

select * from tmp

update tmp
set mob = 6564
where id = 2


select * from tmp

delete from tmp where id = 6


create table emp
(
id int primary key identity(1,1),
name varchar(20) not null,
gender varchar(10),
salary numeric(5) check(salary > 10000),
email varchar(100) unique
)

select * from emp


insert into emp
values('xyz','mel',50000,'xyz@gmail.com')

select * from emp


alter table emp
drop constraint [CK__emp__salary__15502E78]


alter table emp
add constraint CK_emp_gender check(gender = 'male' or gender = 'female')

select * from emp

delete from emp


insert into emp
values('xyz','MaLe',50000,'xyz@gmail.com')

select * from emp

insert into emp
values('xyz','MaLe ',50000,'xyz@gmail.com')
