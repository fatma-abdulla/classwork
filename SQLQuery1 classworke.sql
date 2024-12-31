create database Demodb1
go
use Demodb1
create schema coded;
go
use coded;
create table coded.Employees
(
EmployeeID int primary key identity(1,1) not null, 
EmployeeName nvarchar(50) not null,
salary decimal(18,2)not null,
city nvarchar(50),
Email nvarchar (50)not null,
Bonus money,
promotion bit,
IsActive bit,
IsDeleted bit,
createtionDate Datetime
)
--insert data 
insert into coded.Employees
values('rami',1500,'kuwait','Ramy@gmail.com',250,1,1,0,GETDATE())
insert into coded.Employees(EmployeeName,city,salary,Email,Bonus)
values ('ahmad','Hawali',950,'ahmad@gmail.com',800)
select *from coded.Employees
insert into coded.Employees
values('fatma',1500,'kuwait','fatma@gmail.com',250,1,1,0,GETDATE()),
      ('sara',1500,'kuwait','sara@gmail.com',250,1,1,0,GETDATE()),
      ('mariam',1500,'kuwait','mariam@gmail.com',250,1,1,0,GETDATE()),
      ('nora',1500,'kuwait','nora@gmail.com',250,1,1,0,GETDATE())


	  ---------------------------------------------------

	  select *
	  from coded.Employees
	  where promotion is null 
	  
	  select *
	  from coded.Employees
	  where promotion is not null

	  select *
	  from coded.Employees
	  where promotion =1 and promotion is not null 

	  select *
	  from coded.Employees
	  where promotion =0 and promotion is not null 


	  select *
	  from coded.Employees
	  where city='kuwait' and salary>=100
	  
	  select *
	  from coded.Employees
	  where city='kuwait' and salary >=1000
	   select *
	  from coded.Employees
	  where city='kuwait' and salary >=2000

	  -- anathor wahy 
    select *
    from coded.Employees
    where salary between 1000 and 2000

	  select *
      from coded.Employees
	  where city='kuwait' or city='hawaly' 

	  select *
      from coded.Employees
	  where city in ('kuwait' , 'hawaly' ) and salary between 200 and 300


	  select * from coded.Employees
	  where EmployeeName like  '%ahmad%' 



	  select * from coded.Employees
	  where Email like  '%@gmail.com%' 

  select *
  from coded.Employees
  where EmployeeName like '____'

    select *
  from coded.Employees
  where EmployeeName like 'ahmed%' or EmployeeName like 'ahmed%'
  
     select *
  from coded.Employees
  where EmployeeName like 'ahm{a,e]d%'

       select distinct city from coded.Employees 
	
	   select * from coded.Employees order by salary asc 
	   ---asc تصاعدي
	   ----desc تنازلي 

	   select * from coded.Employees order by salary desc


	   select * from coded.Employees order by salary 
	     
     select *
  from coded.Employees 
  where salary =(select max(salary) from coded.Employees )

select top 2 * from coded.Employees order by salary desc

select top(1) *from coded.Employees
order by salary desc 



insert into coded.Employees
select concat('Name is : ' ,EmployeeName ,'Salary is : ', salary+Bonus)
from coded.Employees


select CONCAT ('Name : ' ,EmployeeName  , ' , salary is : ' ,(salary+bonus) )as 'Employee Information ' 
from coded.Employees 

select sum (salary) from coded.Employees

-- the sum for the all city 

select city, sum (salary) from coded.Employees group by city


--- anothor way 
select city , sum(salary) 
from coded.Employees
group by city


select *from dbo.vActiveEmployees
 go
create view dbo.vDeletedEmployees

as 
select EmployeeName,salary,IsDeleted
from coded.Employees
where IsDeleted=1
------------------------------------

select *from coded.Employees
update coded.Employees
set salary =salary+50
where salary <=1000


--- to delete data اذا بمسح الجدول كله 
delete from coded.Employees
------insert data 
------اذا برد الجدول مره ثانيه 
select *from coded.Employees
 ---اذا ابي امسج الاكتف 
 delete from coded.Employees where IsDeleted=1 









