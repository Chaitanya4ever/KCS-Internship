select * from demo

-- ****************************** where clause ******************************


select * from sample.dbo.emp where e_salary = 25000

select * from sample.dbo.emp where e_gender = 'male'

select * from sample.dbo.emp where e_gender = 'female'

select * from sample.dbo.emp where e_salary = 5000 or e_gender = 'male'

select * from sample.dbo.emp where e_salary = 5500 or e_gender = 'male'


select * from sample.dbo.emp 
where e_city != 'baroda'

select * from sample.dbo.emp 
where e_city <> 'baroda'


select * from sample.dbo.emp where e_city = 'gandhinagar' or e_city = 'ratnanagari' or e_city = 'baroda'

select * from sample.dbo.emp where e_city in ('gandhinagar','ratnanagari','baroda')

select * from sample.dbo.emp 
where e_city not in ('baroda','ratnanagari')


-- ****************************** insert ******************************

--insert into demo values(1,'abc',9876543210)
--insert into demo values(2,'abc1',9876543211),(3,'abc2',9876543212),(4,'abc3',9876543213),(6,'abc4',9876543214)

insert into demo(id,name) values(7,'xyz')

insert into demo(mobile,id) values(123456879,8)


-- ****************************** update ******************************


update demo
set name = 'xyz'

update demo
set mobile = 1234567890
where id = 1

update demo
set mobile = 123
where id = 8

update demo
set mobile = 456
where name = 'xyz' and id = 8


-- ****************************** delete ******************************


truncate table demo

delete from demo where id = 8
