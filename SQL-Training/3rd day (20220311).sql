--Advanced function : null, Coalesce, exists, Cast, Convert

select * from emp
select e_name,e_gender,isnull(e_city,'abc') city,e_age from emp

update emp
set e_city = 'abc'
where e_city is null


select coalesce('a','b','c','d','e')
select coalesce('','b','c','d','e')
select coalesce(null,'b','c','d','e')

select *,coalesce(e_city,'abc') from emp


select top 5 * from sys.databases order by create_date desc

select * from sys.tables

create table demo
(
date varchar(20)
)

insert into demo values('2022/05/03'),('2021/06/06'),('31/12/2022')

select *,year(date) from demo

update demo
set date = '2022/12/31'
where date = '31/12/2022'

alter table demo
alter column date datetime

--cast : (<column_name> as <datatype>)
select *,cast(date as date) from demo
select *,cast(date as varchar(20)) from demo

--convert : (<datatype>,<column_name>)
select *,convert(date,date) from demo
select *,convert(varchar(20),date),convert(varchar(5),date) from demo

select *,len(convert(varchar(5),date)) from demo

select *,datalength(convert(varchar(5),date)) from demo

select len(' abc'),len(' abc ')
select datalength(' abc'),datalength(' abc ')



select * from emp

select distinct e_city,e_salary from emp

select e_city,sum(e_salary) from emp
group by e_city

select distinct e_name,e_gender,e_salary from emp

select e_name,e_gender,e_salary from emp
group by e_name,e_gender,e_salary


select e_name,e_gender,e_salary,count(*) a from emp
group by e_name,e_gender,e_salary
having a > 1

select e_name,e_gender,e_salary,count(*) a from emp
group by e_name,e_gender,e_salary
having count(*) > 1


select *,e_city city from emp
where city is null


select *,e_city city from emp order by e_city

select *,e_city city,e_gender city from emp order by city



select e_name from emp1
union
select e_name from emp3


select e_name from emp1
union all
select e_gender from emp3


select e_name,e_gender from emp1
union all
select e_gender from emp3


select e_name from emp1
intersect
select e_name from emp3


select e_name from emp1
except
select e_name from emp3



print 'xyz'
select 'abc'

print 3+4



declare @name varchar(10) = 'hello'
print @name

declare @name varchar(10)
set @name = 'hello'
print @name

declare @name varchar(10)
select @name = 'hello'
print @name


declare @name varchar(10) = 'hi'
set @name = 'hello'
print @name


declare @name varchar(10) = 'hi'
print @name
set @name = 'hello'
print @name



declare @name varchar(10) = 'hi'
print @name
set @name = @name + 'hello'
print @name


-- case when then else end
select *,case when e_gender = 'male' then 'M' else 'F' end newGender from emp

-- iif
select *,iif(e_gender='Male','M','F') newGender from emp

select *,
case when e_salary >= 300 then 'high' when e_salary < 300 and e_salary >= 150 then 'mid' else 'low' end newGender 
from emp



declare @val int = 1
if @val < 0
	print 'neg'
else
	print 'pos'



declare @val int
if @val < 0
begin
	print 'neg'
end
else if @val > 0
begin
	print 'pos'
end
else if @val is null
begin
	print 'non'
end
else
begin
	print 'zero'
end



--while <condition>
--begin

--<incr/decr>
--end


declare @c1 int = 1, @c2 int = 10
while @c1 <= @c2
begin
	print @c1
	--select @c1
set @c1 += 1
end


declare @c1 int = 1, @c2 int = 10
while @c1 <= @c2
begin
	print @c1
	break

set @c1 += 1
end


declare @c1 int = 1, @c2 int = 10
while @c1 <= @c2
begin
	print @c1
	continue

	print @c2

set @c1 += 1
end



declare @c1 int = 1, @c2 int = 10
while @c1 <= @c2
begin
	print @c1
	if @c1 = 5
		continue

	print @c2

set @c1 += 1
end



--5 * 1 = 5
--5 * 2 = 5
--5 * 3 = 5
--.
--.
--.
--5 * 10 = 50


--cte

select *,e_salary+100 sal from emp
where sal = 445

select *,e_salary+100 sal from emp
where e_salary+100 = 445


--with <cte_name>
--as
--()
--use of cte

with abc
as
(select *,e_salary+100 sal from emp)
select * from abc
where sal = 445


select e_name,max(e_salary) from emp
group by e_name


declare @sal int
--select @sal = max(e_salary) from emp
set @sal = (select max(e_salary) from emp)
select * from emp where e_salary = @sal



select max(e_salary) from emp

select * from emp where e_salary = (select max(e_salary) from emp)


select * from emp where e_salary = (select max(e_salary) from emp where e_gender = 'male')
select * from emp where e_salary = (select max(e_salary) from emp where e_gender = 'female')


select max(e_salary) from emp 
group by e_gender

select * from emp where e_age in (23,23,23,23,23)


select * from emp where e_salary in
(
	select max(e_salary) from emp 
	group by e_gender
)


select * from (select * from emp) a


select *,(select * from emp) from emp

select *,'hello' from emp

select *,(select max(e_salary) from emp) from emp


select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'emp'




--create view <view_name>
--as
--<query>


create view VW_EMP
as
select * from sample.dbo.emp


select top 5 * from tmpProduct
select * from tmpProductSales_20200504




--temporary tables : local temporary table, global temporary table

select * from emp

create table #demo1
(
	id int identity(1,1),
	name varchar(10)
)

select * from #demo1



create table ##demo1
(
	id int identity(1,1),
	name varchar(10)
)

select * from ##demo1

select * into demoDup from
(select name,mob from demo) a


select * from demoDup
