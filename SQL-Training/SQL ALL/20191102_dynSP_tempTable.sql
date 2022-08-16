create proc sp_dyn
@name varchar(30),@id int
as
begin

update emp
set e_name = @name
where e_id = @id

end

exec sp_dyn @id=3,@name='ami'

select * from emp



alter proc sp_dyn2
@tbl_name varchar(20)
as
begin

declare @sql nvarchar(max)
declare @1st varchar(1) = left(@tbl_name,1)

set @sql = 
'create table '+@tbl_name+'
(
	'+@1st+'_id int,
	'+@1st+'_name varchar(10)
)'

--print @sql
exec (@sql)

end



exec sp_dyn2 'doctor'

select * from doctor








create proc sp_dyn3
@tbl_name varchar(20),
@col1 varchar(20),@col1DataType varchar(20),
@col2 varchar(20),@col2DataType varchar(20)
as
begin

declare @sql nvarchar(max)

set @sql = 
'create table '+@tbl_name+'
(
	'+@col1+' '+@col1DataType+',
	'+@col2+' '+@col2DataType+'
)'

--print @sql
exec (@sql)

end

exec sp_dyn3 't5','name','varchar(10)','mobile','numeric(10)'

select * from t1
select * from t5




-- ***************************** temp table *****************************

create table #tbl
(
	id int
)

select * from #tbl



-- ***************************** globaly table *****************************

create table ##tbl
(
	id int
)

select * from ##tbl
