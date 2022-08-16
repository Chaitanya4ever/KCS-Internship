alter proc sp_name
as
begin

select * from sample.dbo.aminesh

end

exec sp_name



alter proc sp_name2
as
begin

	update emp
	set e_name = 'heli'
	where  e_id = 16

end


select * from emp

exec sp_name2




alter proc sp_name3
@gender varchar(6) = 'male'
as
begin

	select * from emp where e_gender = @gender

end

exec sp_name3 'female'



create proc sp_name4
@id int
as
begin

	select * from emp where e_id = @id

end

exec sp_name4 @id=4



alter proc sp_nThSal
@nsal int = 2
as
begin

with cte
as
(select *,DENSE_RANK() over(order by e_salary desc) [Rank] from emp)
select * from cte where [Rank] = @nsal

end

exec sp_nThSal




create proc sp_calc
@num int, @num2 int
as
begin
	print 'Sum : ' + cast(@num as varchar(5)) + '+' + cast(@num2 as varchar(5)) + ' = ' + cast(@num + @num2 as varchar(5))
	print 'Sub : ' + cast(@num as varchar(5)) + '-' + cast(@num2 as varchar(5)) + ' = ' + cast(@num - @num2 as varchar(5))
	print 'Mul : ' + cast(@num as varchar(5)) + '/' + cast(@num2 as varchar(5)) + ' = ' + cast(@num * @num2 as varchar(5))
	print 'Div : ' + cast(@num as varchar(5)) + '*' + cast(@num2 as varchar(5)) + ' = ' + cast(@num / @num2 as varchar(5))
end

exec sp_calc 6
