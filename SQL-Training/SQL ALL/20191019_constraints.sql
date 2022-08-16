select * from sample.dbo.department
select * from sample.dbo.emp

select *,len(e_name) as 'length of e_ename' from emp


create table temp
(
	id int identity(1,1) primary key,
	name varchar(20) not null,
	gender varchar(6) check(gender='male' or gender='female'),
	mobile numeric(10) check(len(mobile) = 10),
	email varchar(50) unique,
	city varchar(20) default 'ahmedabad'
)

select * from temp

--truncate table temp

insert into temp values(1,'abc','female',9876543210,'abc@gmail.com','surat')

insert into temp values('abc','female',9876543210,'abc@gmail.com','surat')
insert into temp values('abc','female',9876543210,'abc2@gmail.com','surat')
insert into temp(name,gender,mobile,email) values('xyz','female',9876543210,'xyz@gmail.com')

delete from temp where id = 3

insert into temp values('pqr','male',9876543210,'pqr@gmail.com','surat')

delete from temp

insert into temp values('heli','female',9876543210,'heli@gmail.com','surat')
insert into temp values('demo','male',9632587410,'demo@gmail.com','baroda')
insert into temp(name,gender,mobile,email) values('temp','female',7412589630,'temp@gmail.com')

delete from temp where id = 4 or id= 5

insert into temp values('heli','female',9876543210,'heli@gmail.com','surat')


select * from temp

set identity_insert temp on
insert into temp(id,name,gender,mobile,email,city) values(3,'ami','male',9876543210,'ami@gmail.com','surat')
insert into temp(id,name,gender,mobile,email,city) values(4,'ami2','male',9876543210,'ami2@gmail.com','surat')
insert into temp(id,name,gender,mobile,email,city) values(5,'ami3','male',9876543210,'ami3@gmail.com','surat')
set identity_insert temp off

insert into temp(name,gender,mobile,email,city) values('ami4','male',9876543210,'ami4@gmail.com','surat')
