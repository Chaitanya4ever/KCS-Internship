create table taskdept(
did int NOT NULL identity(1,1),
id int,
JobTitle varchar(250)
)

select * from taskdept where dept_id = 3

drop table emp_details

create table emp_details(
id int,
EmployeeName varchar(150),
BasePay numeric(10),
OvertimePay numeric(10),
OtherPay numeric(10),
Benefits numeric(10),
TotalPay numeric(10),
TotalPayBenefits numeric(10),
Year numeric(10),
Notes varchar(2),
Agency varchar(150),
Status varchar(2),
did int
)

select * from emp_details

create table dept_name(
did int,
dept_name Varchar(150)
)


create proc deptdata
AS
BEGIN
SELECT did, ROW_NUMBER() OVER (ORDER BY JobTitle) AS did,JobTitle
                                       FROM   taskdept;
END



truncate table taskdept



kcstest.database.windows.net

drop table empovertimepay

create table empovertimepay(
id int,
EmpName varchar(100),
did int,
BasePay numeric(10),
OverTimePay numeric(10),
Agency varchar(150),
Benefits varchar(2),
Notes varchar(2),
OtherPay numeric(10),
[Status] varchar(2),
TotalPay numeric(10),
TotalPayBenefits numeric(10),
[Year] numeric(10)
)

select * from taskdept order by id
select count(*) from emp_details
select count(*) from empovertimepay

select * from taskdept
select * from emp_details
select * from empovertimepay

select * from emp_details where did = 6
select * from taskdept where did = 6

truncate table empovertimepay





select * from jsonload order by id

create table jsonload(
id int identity(1,1),
fileName varchar(200),
jsondata nvarchar(max))

alter proc importjson
@jsonfilename varchar(200),
@jsondata nvarchar(max)
AS
BEGIN
INSERT INTO  dbo.jsonload (fileName, jsondata) values (@jsonfilename,@jsondata)
END






-----------------------------------------------------------------------------------------------------------

create table metadept(
did int NOT NULL identity(1,1),
id int,
JobTitle varchar(250)
)


select * from metadept 

drop table metadept

select did from metadept where JobTitle ='DEPUTY DIRECTOR OF INVESTMENTS'

select did from metadept where JobTitle ='@{variables('jobtitle')}'


CREATE TABLE MetaEmpDet(
	id int,
	EmployeeName varchar(100),
	Agency varchar(100),
	did int,
	BasePay numeric(9,2),
	OvertimePay numeric(9,2),
	Benefits varchar(10),
	Notes varchar(20),	
	OtherPay numeric(9,2),
	Status varchar(20),
	TotalPay numeric(9,2),
	TotalPayBenefits numeric(9,2),
	Year int
)

select * from MetaEmpDet order by id

truncate table MetaEmpDet

ALTER TABLE MetaEmpDet
ADD PRIMARY KEY  (id)

if not exists(
	select top 1 1 from MetaEmpDet where JobTitle = op)
		begin
			insert into MetaEmpDet values(op)  
end



****************************************************************************************************************
create table masterdata(
	id int primary key,
	EmployeeName varchar(100),
	JobTitle varchar(150),
	Agency varchar(100),
	BasePay numeric(9,2),
	OvertimePay numeric(9,2),
	Benefits varchar(10),
	Notes varchar(20),	
	OtherPay numeric(9,2),
	Status varchar(20),
	TotalPay numeric(9,2),
	TotalPayBenefits numeric(9,2),
	Year int
)

truncate table masterdata

select * from masterdata

create table masterdept(
did int primary key identity(1,1),
dept_name varchar(150) unique
)


select * from masterdept order by did

truncate table masterdept


CREATE proc masterdatasp
@jobtitle nvarchar(50)
as
begin
	if not exists(select top 1 1 from masterdept where dept_name = @jobtitle)
	begin
		insert into masterdept values(@jobtitle)    
	end
end

CREATE proc masterdatasp
@table_name nvarchar(30)
@jobtitle nvarchar(50)
@col_name nvarchar(50)
as
begin
	declare @sql nvarchar(max)
	if not exists(select top 1 1 from masterdept where @tablename = @jobtitle)
	begin
		insert into masterdept values(@jobtitle)    
	end
end



select *
from masterdata
join masterdept
on JobTitle = dept_name

select * from dbo.MetaEmpDet


create table masterdata_overtime(
	id int primary key,
	EmployeeName varchar(100),
	did int,
	Agency varchar(100),
	BasePay numeric(9,2),
	OvertimePay numeric(9,2),
	Benefits varchar(10),
	Notes varchar(20),	
	OtherPay numeric(9,2),
	Status varchar(20),
	TotalPay numeric(9,2),
	TotalPayBenefits numeric(9,2),
	Year int
)


create table masterdata_not_ot(
	id int primary key,
	EmployeeName varchar(100),
	did int,
	Agency varchar(100),
	BasePay numeric(9,2),
	OvertimePay numeric(9,2),
	Benefits varchar(10),
	Notes varchar(20),	
	OtherPay numeric(9,2),
	Status varchar(20),
	TotalPay numeric(9,2),
	TotalPayBenefits numeric(9,2),
	Year int
)


select * from MetaEmpDet where OvertimePay <= 0

select * from masterdata where JobTitle ='CAPTAIN III (POLICE DEPARTMENT)'
select * from masterdept where did = 5
select * from MetaEmpDet where did = 5
select * from masterdata_overtime
select * from masterdata_not_ot


