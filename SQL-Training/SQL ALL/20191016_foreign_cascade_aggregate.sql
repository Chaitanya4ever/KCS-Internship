create table department
(
	d_id int identity(1,1),
	d_name varchar(20),
	constraint pk_department primary key(d_id)
)


create table employee
(
	e_id int identity(1,1),
	e_name varchar(20) not null,
	e_gender varchar(6),
	e_city varchar(20) constraint df_employee_city default 'ahmedabad',
	e_email varchar(50),
	d_id int,
	constraint pk_employee primary key(e_id),
	constraint ck_employee_gender check(e_gender = 'male' or e_gender = 'female'),
	constraint uq_employee_email unique(e_email),
	constraint fk_employee_did foreign key(d_id) references department(d_id)
)

select * from department
select * from employee

insert into employee(e_name,e_gender,e_city,e_email) values('abc','male','gandhinagar','abc@gmail.com')

insert into department values('it'),('comp'),('civil'),('arts'),('sales')

insert into employee values('heli','female','surat','heli@gmail.com',3)

insert into employee values('salman','male','bombay','salman@gmail.com',4),('shahrukh','male','rajkot','shahrukh@gmail.com',3),
('sonakshi','female','goa','sonakshi@gmail.com',4),('alia','female','rajasthan','alia@gmail.com',3)

insert into employee values('modi','male','gandhinagar','modi@gmail.com',1)



select * from department
select * from employee


delete from department where d_id = 3
delete from department where d_id = 1



alter table employee
drop constraint fk_employee_did

alter table employee
add constraint fk_employee_did foreign key(d_id) references department(d_id)




-- ******************************** inbuilt function ********************************

--	aggregate function


select avg(e_salary) from emp
select sum(e_salary) from emp

select count(*) from emp
select count(d_id) from emp

select min(e_salary) from emp
select max(e_salary) from emp
