-- ********************************** string function cont... **********************************

select *,PATINDEX('%@g%',e_email) from emp

select *,SUBSTRING(e_gender,2,2) from emp

select *,REVERSE(e_email) from emp

select *,reverse(SUBSTRING(REVERSE(e_email),1,10)) from emp

select *,REPLICATE(e_gender,3) from emp

select 'meet'+' joshi'
select 'meet'+space(1)+'joshi'

select REPLACE('aminesh suthar','suthar','joshi')
select REPLACE(123,2,4)

select *,replace(e_email,'@g','@y') from emp

select *,STUFF(e_gender,2,3,'*') from emp

select stuff('meet joshi',2,2,'*')
select stuff('meet joshi',7,2,'*')

select stuff('meet joshi',2,2,'*')
select stuff(stuff('meet joshi',2,2,'*'),7,2,'*')

select CONCAT('my','name','is','ami')
select 'my'+'name'+'is'+'ami'

select *,concat(name,m_name,l_name) from sample.dbo.test1

--select CONCAT_WS('_','my','name','is','ami')

select DIFFERENCE('m','z')

select SOUNDEX('meet')
select SOUNDEX('meet'),SOUNDEX('ami')

select QUOTENAME('meet','(')

select *,QUOTENAME(e_name,'"') from emp

select str(97)
select str(3)+'meet'



-- ********************************** math function **********************************


select abs(-5)

select CEILING(123.95)
select CEILING(123.1)
select CEILING(123.0)
select CEILING(123)

select floor(123.95)
select floor(123.1)
select floor(123.0)
select floor(123)
select floor(0.123)


select POWER(2,3) --2*2*2
select POWER(3,3) --3*3*3


select rand()  -- 0 > rand < 0.999999999999
select rand()*10
select CEILING(rand()*10) -- 1 to 10
select floor(rand()*10) -- 0 to 10


select SQUARE(5)

select sqrt(16)

select ROUND(123.49,2)
select ROUND(123.49,1)

select round(123.1235,3)

select round(123.12345,3)
select round(123.12345,4)
select round(123.12345,1)

select round(123.123456,4)

select round(123.12345,4,0)
select round(123.123456,4,2)



-- ********************************** date function **********************************


select CURRENT_TIMESTAMP
select getdate()


select DATEADD(day,1,getdate())
select DATEADD(month,1,getdate())
select DATEADD(year,1,getdate())
select DATEADD(hour,1,getdate())


select datediff(day,'2019/10/05','2019/10/18')
select datediff(MONTH,'2019/5/05','2019/10/18')
select datediff(year,'1992/10/21','2019/10/18')


select DATEFROMPARTS(2015,7,5)


select getdate()

select DATENAME(month,getdate())
select DATENAME(WEEKDAY,getdate())


select datepart(year,getdate())
select datepart(month,getdate())

select *,DATEPART(year,e_dob),DATEPART(month,e_dob),DATEPART(day,e_dob) from emp


select day(GETDATE())
select month(GETDATE())
select year(GETDATE())

select *,year(e_dob),month(e_dob),day(e_dob) from emp


select GETUTCDATE()

select ISDATE('heli')
select ISDATE('18/10/2019')
select ISDATE('10/10/2019')

select SYSDATETIME()

