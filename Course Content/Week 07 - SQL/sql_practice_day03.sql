------------------------------------------- DAY 03 - WEDNESDAY - 13 SEPTEMBER 2023-------------------------------------------

-- Creating new table and use anywhere. It will not effect the original one.

create procedure  GetCustomers

as
begin
	select firstname as FirstName, lastname as LastName, city as City, country as Country, phone as Mobile
	from customer
end

exec [dbo].[GetCustomers]


--- create table and insert the rows
create procedure insertcustomer
@firstname varchar(50),
@lastname varchar(50),
@city varchar(50),
@country varchar (50),
@phone varchar(50)

as
begin
	insert into Customer(FirstName, LastName, City, Country, Phone)
	values
	(@firstname, @lastname, @city, @country,@phone)
end

exec insertcustomer 'asad', 'ali','isl','pak','0987654987'

select * from Customer
order by sr desc



--- 
--- create table with creating specific INDENTITY and insert the rows
alter procedure insertcustomer
@firstname varchar(50),
@lastname varchar(50),
@city varchar(50),
@country varchar (50),
@phone varchar(50)

as
begin
	insert into Customer(FirstName, LastName, City, Country, Phone)
	values
	(@firstname, @lastname, @city, @country,@phone)
	declare @id as int
	set @id = @@IDENTITY

	select * from Customer where id = @id
END

exec insertcustomer 'saad', 'ali','isl','pak','0987654987'

select * from Customer order by id desc;



alter procedure [dbo].[GetCustomers]
@id as int=Null
as
begin
	if(@id is not null)
		select firstname as FirstName, Lastname as LastName, City + ' ' + country as [location], phone as mobile from Customer where id = @id
	else
		select firstname as FirstName, Lastname as LastName, City + ' ' + country as [location], phone as mobile from Customer
end

alter procedure insertcustomer
@firstname varchar(50),
@lastname varchar(50),
@city varchar(50),
@country varchar (50),
@phone varchar(50)

as
begin

	declare @count int
	select @count = count(*) from Customer where firstname = @FirstName and lastname = @LastName

	if(@count >0)
		raiserror ('This customer already exist in DB',1,1)
	else
	begin
	
	insert into Customer(FirstName, LastName, City, Country, Phone)
	values
	(@firstname, @lastname, @city, @country,@phone)
	declare @id as int
	set @id = @@IDENTITY
	exec GetCustomers
	end
END

exec insertcustomer 'hamza','ramzan','berlin','germany','34567890987654'

select * from insertcustomer order by id desc;



-------
declare @RecordID int
exec GetSingleVariableOutput
'zain','ramzan','paris','france','4567890', @output = @RecordID

select @RecordID
select * from Customer order by id desc


declare @sql nvarchar(500) = 
'Select firstname as fname, lastname as lname, city + ' ' +  country as [location], phone as mobile from customer';



----------

drop table customer_history
select * into customer_history from Customer where 1=2
select * from customer_history



---------

alter trigger tbl_customer_insert
on customer after insert 
as
	insert into	customer_history (CustomerID, firstname, lastname, city, country, phone, Operation)

	select ID, firstname, lastname, city, country, phone, 'INSERT' from inserted

insert into Customer(FirstName, LastName, City, Country, Phone)
Values
('Tauseef','khan','Rawalpindi','Pakistan','34567890')



DELETE FROM Customer WHERE FirstName = 'Tauseef'


select * from customer_history