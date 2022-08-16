create table pkTbl
(
	id int
)

alter table pkTbl
alter column id int not null

alter table pkTbl
add constraint pk_tbl primary key (id)


exec [dbo].[sp_emp]
exec dbo.sp_getEmp

exec sp_rename 'sp_emp','sp_getEmp'

select * from emp

exec sp_rename 'emp.mob','mobile'


--user define function: (Scalar Valued, Table Valued)
--a function is a sp that you can pass parameters into and then return value


alter function fun_name()
returns int
as  
begin  
    return 5.3+5.2
end

select dbo.fun_name()


create function dbo.fun_name2()    
returns table
as    
return(select * from emp)


select * from dbo.fun_name2()

select *
from emp e
join dbo.fun_name2() e2
on e.id = e2.id




create trigger [trMyFirstTrigger]
on database
for create_table, alter_table, drop_table, rename
as
begin
	print 'you are create, alter, rename or drop table'
end


create trigger [trCantDrop]
on database
for drop_table
as
begin
	print 'table can'' drop'
	print 1/0
end

--disable trigger all on database
--enable trigger all on database

--disable trigger trCantDrop on database
--enable trigger trCantDrop on database



select * from emp

declare @id int = 1004

if exists(select top 1 id from emp where id = @id)
begin
update emp
set name = 'mno'
where id = @id
end



select * from studUnPvt


select name,math,sci,eng
from 
(select name,sub,mark from studUnPvt2) tbl
pivot
(
	sum(mark)
	for sub in (math,sci,eng)
) as b


select * from studUnPvt2

alter table studUnPvt2
add id int identity(1,1)


select * from studPvt


select sub,name,mark
from dbo.studPvt
unpivot
(
	mark
	for name in (abc,pqr,xyz)
) as b


select *
from tmpProduct a
join tmpProduct2 b
on a.description = b.description

create index idx_desc on tmpProduct([description])

create clustered index idx_name on tmpProduct(name)



GRANT ALL ON emp TO hello -- (SELECT/INSERT/UPDATE/DELETE)

REVOKE ALL ON emp FROM hello -- (SELECT/INSERT/UPDATE/DELETE)


TRUNCATE TABLE TestTable
 
BEGIN TRANSACTION 
 
   SAVE TRANSACTION FirstInsert

   INSERT INTO TestTable( ID, Value )
   VALUES  ( 1, '10')
   -- this will create a savepoint after the first INSERT
   
   SAVE TRANSACTION SecondInsert

   INSERT INTO TestTable( ID, Value )
   VALUES  ( 2, '20')
 
   -- this will rollback to the savepoint right after the first INSERT was done
   ROLLBACK TRANSACTION SecondInsert

-- this will commit the transaction leaving just the first INSERT 
COMMIT
 
SELECT * FROM TestTable
