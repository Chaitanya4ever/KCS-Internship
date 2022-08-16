create table department
(
d_id int identity(1,1) primary key,
d_name varchar(10) not null
)

select * from sys.tables
select * from INFORMATION_SCHEMA.TABLES

select * from sys.all_columns
select * from INFORMATION_SCHEMA.COLUMNS



create table employee
(
e_id int primary key identity(1,1),
e_name varchar(20) not null,
e_mail varchar(100) unique,
e_salary numeric(5) check(e_salary >= 10000),
e_dob date,
e_mob numeric(10) unique,
e_state varchar(10) default ('Gujarat'),
department_id int foreign key references department(d_id)
)





insert into department values('it'),('sales'),('finance'),('hr')

select * from department

insert into employee
values('abc','abc@gmail.com',15000,'12/31/2000',9876543210,'gujarat',1)

--yyyy-mm-dd
--mm-dd-yyyy

select * from employee


insert into employee
values('xyz','xyz@gmail.com',15000,'12/31/2000',9876543211,'gujarat',2)

insert into employee
values('pqr','pqr@gmail.com',15000,'12/31/2000',9876543213,'gujarat',2)


set identity_insert employee on
insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob,e_state,department_id)
values(1,'mno','mno@gmail.com',15000,'12/31/2000',9876543214,'gujarat',2)

select * from employee


insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob,e_state,department_id)
values(3,'tyu','tyu@gmail.com',15000,'12/31/2000',9876543216,'gujarat',2)
,(6,'lkj','lkj@gmail.com',15000,'12/31/2000',9876543219,'gujarat',2)


set identity_insert employee off

insert into employee
values('ert','ert@gmail.com',15000,'12/31/2000',9876543222,'gujarat',2)

select * from employee


set identity_insert employee on
insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob)
values(101,'mnb','mnb@gmail.com',17500,'05/06/1999',9875543214)
set identity_insert employee off

select * from employee

insert into employee(e_name,e_mail,e_salary,e_dob,e_mob)
values('add','add@gmail.com',15500,'07/15/1995',8875543214)


select * from department
select * from employee

--delete from department where d_id = 3

delete from department where d_id = 2



select * into employee_bkp from employee

select * from employee_bkp

select * from employee_bkp where e_salary > 500

select * from employee_bkp where e_salary between 15000 and 17000


select * from employee_bkp where department_id = NULL
select * from employee_bkp where department_id = ''
select * from employee_bkp where department_id = 'NULL'
select * from employee_bkp where department_id is null
select * from employee_bkp where department_id is not null

select * from employee_bkp where department_id != null


select * from employee_bkp where e_name = 'abc'
select * from employee_bkp where e_name != 'abc'

select * from employee_bkp where e_salary = 15000 and department_id = 2
select * from employee_bkp where e_salary = 20000 or department_id = 2
select * from employee_bkp where e_salary = 20000 and department_id = 2

select * from employee_bkp where e_name in ('abc','mno')
select * from employee_bkp where e_name = 'abc' or e_name = 'mno'

select * from employee_bkp where e_name not in ('abc','mno')


select * from department
select * from emp

select * from emp where e_name like 'a%'
select * from emp where e_name like '_a%'


select * from department
select * from emp

select e.e_name,d.d_name
from emp e
join department d
on d.d_id = e.d_id

select e.e_name,d.d_name
from emp e
left join department d
on d.d_id = e.d_id


select e.e_name,d.*
from emp e
left join department d
on d.d_id = e.d_id
where d.d_id is not null


select e.*,d.*
from department d
right join emp e
on d.d_id = e.d_id


select e.*,d.*
from department d
full join emp e
on d.d_id = e.d_id


select e.*,d.*
from emp e
cross join department d


select * from emp order by e_name asc

select * from emp order by e_city

select * from emp order by e_name desc

select e_name,e_email,e_salary from emp order by e_city desc

select * from emp order by 1 desc

select * from emp
select distinct e_gender from emp
select distinct e_gender,d_id from emp

select top 3 * from emp order by d_id desc

select * from emp


--ranking function: (partition by --optional)
--rank,dense_rank,row_number,ntile

select *,'hello' a from student

select name student_name from student

select *,
rank() over(order by mark desc) [rank],
dense_rank() over(order by mark desc) [dense rank],
row_number() over(order by name desc) [row_number],
ntile(2) over(order by name desc) [ntile]
from student


select *,
rank() over(partition by e_gender order by e_salary desc) [rank],
dense_rank() over(partition by e_gender order by e_salary desc) [dense rank],
row_number() over(partition by e_gender order by e_salary desc) [row_number],
ntile(2) over(partition by e_gender order by e_salary desc) [ntile]
from emp



select *,
rank() over(partition by e_gender order by e_salary desc) [rank],
dense_rank() over(partition by e_gender order by e_salary desc) [dense rank],
row_number() over(partition by e_gender order by e_salary desc) [row_number],
ntile(2) over(partition by e_gender order by e_salary desc) [ntile]
into emp5 from emp

select * from emp5



--analytic function: (partition by --optional)
--lead,lag,first_value,last_value

select *,
LEAD(e_salary,3) over(order by e_id)
from emp

select *,
lag(e_salary,3) over(order by e_id)
from emp

select *,
first_value(e_salary) over(order by e_id desc)
from emp

select *,
last_value(e_salary) over(order by e_gender desc)
from emp


--String Functions : ascii, char, TRIM(2017), ltrim, rtrim, lower, upper, reverse, len, 
--DATALENGTH, left,right, charindex, patindex, substring, replicate, space, replace, 
--stuff, CONCAT, QUOTENAME, CONCAT_WS(2017)

select ascii('Abfasdasd'),ascii('Z'),ascii('a'),ascii('z')

select *,ascii(name) from student

select char(100)

select left('aminesh',3)


select charindex('s','suresh',2)

select patindex('%sur%','suresh')

select replicate('abc',3)

select stuff('aminesh',1,3,'*')


select 'hello' + 'abc' + 'pqr'
select 6+5
select 'abc'+5
select 'abc'+'5'
select '6'+'5'
select '6'+5
select '6a'+5

select concat('abc','pqr','xyz')
select concat('abc','pqr',5)
select concat(5,4,5)

select QUOTENAME('hello','(')
select QUOTENAME('hello','}')


--math function : abs, ceiling, floor, power, rand, square, sqrt, round

select abs(-6.5)
select abs(6.5)

select ceiling(123.45)
select ceiling(123.0)

select floor(123.0)
select floor(123.5)

select rand()

select SQUARE(2)
select SQUARE('a')

select round(123.55,1),round(123.45,1),round(123.0,1),round(123.554,1)
select round(123.55,2),round(123.45,2),round(123.0,2),round(123.555,2)



--date-time functions : CURRENT_TIMESTAMP,getdate,sysdatetime,DATEADD,datediff,
--DATEFROMPARTS,DATENAME,DATEPART,day,month,year,getutcdate,ISDATE

select getdate(),CURRENT_TIMESTAMP,SYSDATETIME(),GETUTCDATE()
/*
2022-03-10 15:21:36.767	
2022-03-10 15:21:36.767	
2022-03-10 15:21:36.7677150	
2022-03-10 09:51:36.767
*/

select DATEADD(day,2,'2022/02/02')
select DATEADD(day,-2,'2022/02/01')
select DATEADD(month,2,'2022/02/02')

select DATEPART(year,'2022/02/02')
select year('2022/02/02')

select *,ISDATE(dob) from cust
select * from cust where ISDATE(dob) = 1
