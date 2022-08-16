-- *********************** function ***********************

-- *********************** 1st (Scalar Valued) ***********************
-- my example(sir)
select sample.dbo.fnCalAge('1992/10/21')
select *,dbo.fnCalAge(dob) from cust


alter function dbo.fn_name()
returns int
as
begin  
	declare @num int
	set @num = 5 + 5
    return @num
end

select dbo.fn_name()


alter function dbo.fn_name1(@a int,@b int,@c int)
returns int
as
begin  
	declare @num int
	set @num = @b - (@a + @c)
    return @num
end

select dbo.fn_name1(2,5,5)



-- *********************** 2nd (Table Valued) ***********************
create function dbo.fn_nameTblValue()
returns table
as
return(select * from emp)

select * from dbo.fn_nameTblValue()



alter function dbo.fn_nameTblValue2(@gender varchar(6))
returns table
as
return(select * from emp where e_gender = @gender)


select * from dbo.fn_nameTblValue2('male')
