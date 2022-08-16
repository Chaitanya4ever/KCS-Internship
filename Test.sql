--Name : Chaitanya Rajendra Patil
--Emp Id: 20029


--1st Paper
--1. Create table student
create table student
(
s_id int not null,
s_name varchar(50) not null,
s_subject varchar(20) not null,
s_mark numeric not null
)
 
select * from student
--2. Insert 10 records
insert into student(s_id,s_name,s_subject,s_mark) values (1,'Sam','English',87)
insert into student(s_id,s_name,s_subject,s_mark) values (1,'Sam','Science',69)
insert into student(s_id,s_name,s_subject,s_mark) values (1,'Sam','Maths',87)

insert into student(s_id,s_name,s_subject,s_mark) values (2,'Vips','English',67)
insert into student(s_id,s_name,s_subject,s_mark) values (2,'Vips','Science',94)
insert into student(s_id,s_name,s_subject,s_mark) values (2,'Vips','Maths',78)

insert into student(s_id,s_name,s_subject,s_mark) values (3,'Dips','English',75)
insert into student(s_id,s_name,s_subject,s_mark) values (3,'Dips','Science',34)
insert into student(s_id,s_name,s_subject,s_mark) values (3,'Dips','Maths',75)

insert into student(s_id,s_name,s_subject,s_mark) values (4,'Avi','English',78)
insert into student(s_id,s_name,s_subject,s_mark) values (4,'Avi','Science',91)
insert into student(s_id,s_name,s_subject,s_mark) values (4,'Avi','Maths',63)

--Display student records which have 50 to 90 marks in science
select * from student where s_mark between 50 and 90 and s_subject = 'science'

--4 Display record with grade

select * from student where
 when s_mark >= 90 Grade = 'A',
 when s_mark < 35 then Grade = 'F'



--5 Message Display

declare @subject varchar(20), @total int, @id int
set @subject = s_subject
