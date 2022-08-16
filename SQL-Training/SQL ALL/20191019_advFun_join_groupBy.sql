select *,coalesce(e_city,'no city') from emp
select *,coalesce(d_id,0) from emp


if exists(select * from emp)
begin
	print 'data available'
end
else
begin
	print 'data not available'
end


select * from emp where e_city is null

select * from emp where e_city is not null


select getdate()
select cast(getdate() as varchar(11))

select 3 + 5
select '3' + '5'
select cast('3' as int) + cast('5' as int)


select getdate()
select convert(varchar(11),getdate())

select 3 + 5
select '3' + '5'
select convert(int,'3') + convert(int,'5')


select * from sample.dbo.department
select * from sample.dbo.emp


select e_name,e_gender,e_city,d_name
from sample.dbo.emp e
inner join sample.dbo.department d
on e.d_id = d.d_id


select e_name,e_gender,e_city,d_name
from sample.dbo.emp e left join sample.dbo.department d
on e.d_id = d.d_id


select e_name,e_gender,e_city,d_name
from sample.dbo.emp e right join sample.dbo.department d
on e.d_id = d.d_id


select e_name,e_gender,e_city,d_name
from sample.dbo.emp e
full outer join sample.dbo.department d
on e.d_id = d.d_id


select e_name,e_gender,e_city,d_name
from sample.dbo.emp
cross join sample.dbo.department


select * from emp

select max(e_salary),e_name from emp
group by e_name

select min(e_salary),e_name from emp
group by e_name

select sum(e_salary) from emp

select sum(e_salary),e_name from emp
group by e_salary,e_name


select e_name,e_email,e_age,e_city,d_id,e_year from emp
group by e_name,e_email,e_age,e_city,d_id,e_year


select sum(e_salary),d_name 
from sample.dbo.emp e
inner join sample.dbo.department d
on e.d_id = d.d_id
group by d_name

select sum(e.e_salary)
from sample.dbo.emp e
inner join sample.dbo.department d
on e.d_id = d.d_id
where d_name = 'hr'


select sum(e_salary),d_name 
from sample.dbo.emp e
inner join sample.dbo.department d
on e.d_id = d.d_id
group by d_name
having d_name = 'it'
