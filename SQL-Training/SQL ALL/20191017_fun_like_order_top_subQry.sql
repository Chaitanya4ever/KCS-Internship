select * from emp
where e_salary in (select max(e_salary) from emp)


select * from (select * from emp) a


select top 6 * from emp

select * from emp order by e_id

select * from emp order by e_id desc

select * from emp order by e_name

select * from emp order by e_name desc

select * from emp order by e_age

select * from emp order by e_salary


select top 5 * from emp order by e_id

select * from emp where e_id <= 5 order by e_id desc


-- ****************************** ranking function ******************************


select e_name,e_email,e_gender,e_salary,
rank() over(order by e_salary desc) as 'Salary_Rank'
from emp

select e_name,e_email,e_gender,e_salary,
rank() over(partition by e_gender order by e_salary desc) as 'Salary_Rank'
from emp


select e_name,e_email,e_gender,e_salary,
dense_rank() over(order by e_salary desc) as 'Salary_Dense'
from emp

select e_name,e_email,e_gender,e_salary,
dense_rank() over(partition by e_gender order by e_salary desc) as 'Salary_Dense'
from emp


select e_name,e_email,e_gender,e_salary,
row_number() over(order by e_salary desc) as 'Salary RowNumber'
from emp

select e_name,e_email,e_gender,e_salary,
row_number() over(partition by e_gender order by e_salary desc) as 'Salary RowNumber'
from emp


select e_name,e_email,e_gender,e_salary,
ntile(3) over(order by e_salary desc) as 'Salary nTile'
from emp

select e_name,e_email,e_gender,e_salary,
ntile(3) over(partition by e_gender order by e_salary desc) as 'Salary nTile'
from emp


-- ****************************** analytic function ******************************


select e_id,e_name,e_email,e_gender,e_salary from emp


select e_name,e_email,e_gender,e_salary,
lead(e_salary,3) over(order by e_name desc) as 'Salary lead'
from emp

select e_name,e_email,e_gender,e_salary,
lag(e_salary,2) over(order by e_name desc) as 'Salary lag'
from emp

select e_name,e_email,e_gender,e_salary,
first_value(e_name) over(order by e_salary desc) as 'Salary first_value'
from emp

select e_name,e_email,e_gender,e_salary,
last_value(e_name) over(order by e_salary desc) as 'Salary last_value'
from emp


-- ****************************** String Functions ******************************


select ascii('a')
select ascii('z')
select ascii('A')
select ascii('Z')
select ascii(' ')

select *,ascii(e_name) from emp


select char(97)
select char(122)
select char(65)
select char(90)
select char(32)

select *,char(e_age) from emp


select '         heli'
select ltrim('         heli')

select 'heli           '+'hello'
select rtrim('heli             ')+'hello'

select 'heli           '+'                   hello'
select rtrim('heli           ')+ltrim('                   hello')

select *,ltrim(e_name) from emp


select *,upper(e_name) from emp

select *,lower(e_name) from emp

select *,reverse(e_name) from emp


select *,len(e_name),datalength(e_name) from emp

select len('aminesh suthar'),datalength('aminesh suthar')

select *,left(e_name,2) from emp
select *,right(e_name,2) from emp

select CHARINDEX('a','aminesh suthar')
select CHARINDEX('a','aminesh suthar',2)
select *,CHARINDEX('a',e_name) from emp





select * from emp where e_name = 'aminesh suthar'

select * from emp where e_name like 'ami%'

select * from emp where e_name like 'ami_esh'

select * from emp where e_name like 'a%'

select * from emp where e_name like '_a%'

select 'heli'

select upper('h')+'eli'

select *,upper(left(e_name,1)) from emp

select upper(left('heli',1))

select left('heli',len('heli')-1)
