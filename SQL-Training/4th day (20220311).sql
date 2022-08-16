declare @tbl as table
(
	id int
)
insert into @tbl values(1)

select * from @tbl



select 5/0
select 5/2


--BEGIN TRY
--END TRY
--BEGIN CATCH
--END CATCH


BEGIN TRY
	SELECT 10/0 AS Result
	--SELECT 10/5 AS Result
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS [Error Message]
	      ,ERROR_LINE() AS ErrorLine
	      ,ERROR_NUMBER() AS [Error Number]  
              ,ERROR_SEVERITY() AS [Error Severity]  
              ,ERROR_STATE() AS [Error State]  
			  ,@@ERROR
END CATCH



alter view [dbo].[VW_EMP]
as
select * from sample.dbo.emp where e_age >= 25

select * from [dbo].[VW_EMP]



create procedure <sp_name>
--<parameters> --optionally
as
begin
end


create proc sp_emp
as
begin
	select * from sample.dbo.emp
end

execute sp_emp


alter proc sp_emp
as
begin
	select * from emp where e_age >= 25
end

execute sp_emp

alter proc sp_emp
as
begin
	select * from emp where gender = 'male'
end

execute sp_emp

select * from emp

alter table emp
add gender varchar(10)

update emp
set gender = 'Male'
where e_id = 5

create proc sp_emp_GenderWise
@gender varchar(20)
as
begin
	select * from [Chaitanya.Patil].dbo.emp where gender = @gender
end


exec sp_emp_GenderWise @gender = 'male'
exec sp_emp_GenderWise 'female'


alter proc sp_emp_GenderWise
@gender varchar(20) = null
as
begin
	if @gender is null
	begin
		select * from sample.dbo.emp
	end
	else
	begin
		select * from sample.dbo.emp where e_gender = @gender
	end
end


exec sp_emp_GenderWise 'male'
exec sp_emp_GenderWise 'female'
exec sp_emp_GenderWise




alter proc sp_emp_GenderWise
@gender varchar(20) = null
as
begin
	select * from sample.dbo.emp where e_gender = @gender or @gender is null
end


exec sp_helptext 'sp_emp_GenderWise'


exec sp_emp_GenderWise 'male'
exec sp_emp_GenderWise 'female'
exec sp_emp_GenderWise



create proc sp_empGetData
@gender varchar(20) = null,
@city varchar(20) = null
as
begin
	select * from emp where gender = @gender and e_city = @city
end

exec sp_empGetData 'male','Shirpur'

exec sp_empGetData @city = 'Chopda', @gender = 'female'



select * from emp


create proc sp_InsEmp
@name varchar(20),
@gender varchar(20),
@salary numeric(5),
@email varchar(100)
as
begin
	insert into emp(name,gender,salary,email)
	values(@name,@gender,@salary,@email)
end

exec sp_InsEmp @name = 'abc', @gender = 'male', @salary = 12345, @email = 'abc@gmail.com'

select * from emp




ALTER proc [dbo].[spUpdateName]
as
begin
	begin try
		begin tran
			update test1 set name = 'mistry2' where id = 1
			update test2 set name = '1234567890123456789012345678901234567890123456789' 
			where id = 1
		commit tran
		print 'transaction commited'
	end try
	begin catch
		rollback tran
		print 'transaction rolled back'
	end catch
end




declare @sql nvarchar(max), @gender varchar(20) = 'male'
set @sql = 'select * from emp where gender = ''' + @gender + ''''
--exec (@sql)
exec sp_sqlexec @sql




declare @sql nvarchar(max), @data varchar(20) = '50000',@col varchar(20) = 'salary'
set @sql = 'select * from emp where ' + @col + ' = '' ' + @data + ''''
exec (@sql)

select * from emp where gender = 'male'




alter proc sp_dynEmp
@columnName varchar(20),
@data varchar(20)
as
begin
	select * from sample.dbo.emp where @columnName = @data
end

exec sp_dynEmp @columnName = 'gender', @data = 'male'


with duplicate
as
(
	select *,ROW_NUMBER() over(partition by e_name order by e_name) dup from emp
)
delete from duplicate where dup > 1
