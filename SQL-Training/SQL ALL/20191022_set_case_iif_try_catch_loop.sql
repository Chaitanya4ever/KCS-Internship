-- ***************************************** set operator *****************************************

select * from test1
union
select * from test1_2

select * from test1
union all
select * from test1_2

select * from test1,test1_2


select * from test1
intersect
select * from test1_2


select * from test1
except
select * from test1_2


-- ***************************************** case/iif *****************************************

select *,case when e_gender = 'female' then 'f' else 'm' end as 'short gender' from emp
select *,case when e_salary >= 50000 then 'A' when e_salary >= 30000 and e_salary < 50000 then 'B' else 'C' end from emp

select *,iif(e_gender='female','f','m') from emp



declare @name varchar(20)
set @name = 'abc'

select * from emp where e_name = @name
select *,@name from emp where e_name = @name



declare @num int,@num2 int
set @num = 9
set @num2 = 3

print 'Sum : ' + cast(@num + @num2 as varchar(5))
print 'Sub : ' + cast(@num - @num2 as varchar(5))
print 'Mul : ' + cast(@num * @num2 as varchar(5))
print 'Div : ' + cast(@num / @num2 as varchar(5))



declare @num int,@num2 int
set @num = 9
set @num2 = 3

--print 'Sum : ' + cast(@num as varchar(5)) + cast(@num2 as varchar(5))
print 'Sum : ' + cast(@num as varchar(5)) + '+' + cast(@num2 as varchar(5)) + ' = ' + cast(@num + @num2 as varchar(5))
print 'Sub : ' + cast(@num as varchar(5)) + '-' + cast(@num2 as varchar(5)) + ' = ' + cast(@num - @num2 as varchar(5))
print 'Mul : ' + cast(@num as varchar(5)) + '/' + cast(@num2 as varchar(5)) + ' = ' + cast(@num * @num2 as varchar(5))
print 'Div : ' + cast(@num as varchar(5)) + '*' + cast(@num2 as varchar(5)) + ' = ' + cast(@num / @num2 as varchar(5))



-- ***************************************** if, else *****************************************

declare @value int = -5

if @value = 0
begin
	print 'zero'
end
else if @value > 0
begin
	print 'positive'
end
else 
begin
	print 'negetive'
end


-- ***************************************** try, catch *****************************************

BEGIN TRY
	SELECT 10/5 AS 'Result'
	SELECT 10/0 AS 'Result'
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS [Error Message]
END CATCH



-- ***************************************** loop *****************************************


declare @n int = 1
while @n <= 10
begin
	print @n
	set @n += 1
end


declare @n int = 1
while @n <= 10
begin
	print @n
	set @n = @n + 2
end


declare @n int = 2
while @n <= 10
begin
	print @n
	set @n = @n + 2
end




declare @n1 int = 1
while @n1 <= (select count(*) from emp1)
begin
	print @n1
	set @n1 = @n1 + 1
end


select top 1 * from tmpProduct
select * from tmpProductSales where tmpProductId = 1



declare @id int = 1
while(@id <= 100000)
begin
	insert into tmpProduct values('Product - ' + cast(@id as nvarchar(20)),
	'Product - ' + cast(@id as nvarchar(20)) + ' Description',1)
	set @id+=1
end




declare @randPid int
declare @randUnitPrice int
declare @randQtySold int
declare @randSoldDate date = '06/23/2018'
declare @counter int = 1
while(@counter <= 100000)
begin
	select @randPid = round(rand()*100000,0)
	select @randUnitPrice = round(rand()*5000,0)
	select @randQtySold = round(rand()*10,0)

	insert into tmpProductSales values (@randPid,@randUnitPrice,@randQtySold,@randSoldDate)
	set @counter+=1
end
