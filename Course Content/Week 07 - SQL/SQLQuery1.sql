------------------------------------------- DAY 02 - TUESDAY - 12 SEPTEMBER 2023-------------------------------------------


select companyname,
SUBSTRING(companyname, 5, 3)
from supplier;

select companyname,
SUBSTRING(companyname, 5, 3), SUBSTRING(companyname, 2,7)
from supplier;

select companyname, 
LEFT(companyname, 4) _left,
RIGHT (companyname, 7) Right_
from Supplier;



insert into 
Empolyes(FirstName, LastName,Salary, isActive)
values
('Zain','Ramzan', 45600, 1),
('Zai','Ramzan', 45600, 1),
('Zan','Ramzan', 45600, 1),
('Zin','Ramzan', 45600, 1),
('ain','Ramzan', 45600, 1)

select * from Empolyes




select * from Customer


insert into Empolyes (FirstName, LastName, Salary, isActive)
select FirstName, LastName,4567,1 from Customer

select * from Empolyes


Alter Table Empolyes
add country varchar (50)


-- update Empolyes set country='Pakistan'

Delete from Empolyes where ID=4

-- UNION
-- MERGES TWO STATEMENTS
-- Number of columns of both statements should be same
--also the data types should be the same

select ID, FirstName, LastName from Empolyes
UNION
select ID, FirstName, LastName from Customer
--186 rows (don't show duplicate rows)

select ID, FirstName, LastName from Empolyes
UNION ALL
select ID, FirstName, LastName from Customer
UNION all
select id, companyname, phone from Supplier
--187 rows ( show all the rows even duplicated)


--- VIEWS

create view emp as 
select FirstName, LastName from Empolyes
where id between 1 and 10

select * from emp

delete from emp

drop view emp



---  COMMON TABLE EXPRESSION (CTE)
with tempCTE as (
select * from Customer where id between 10 and 20)

select * from tempCTE;


--- GROUP by Clause
--- Aggregate Functions
--- MIN, MAX, AVG, SUM, COUNT

--check rows in the table
select  count  (distinct Country) from Customer;

-- check the minimum value
select min(totalamount) from [order]

-- check the maxmium value
select max(totalamount) from [order]

-- check the average value
select avg(totalamount) from [order]

-- calculate the sum
select sum(totalamount) from [order]

-- Display customer count against country

select country, count(*) customer from customer
group by country


-- Country which have more than 10 customer
select country, count(id) customer 
from customer
where id <51
group by country
having count(id)>10


---------------------------- TASK -----------------

---- Write a query to display customer name and total amount
-- order table wher order amount >1000
-- Name, country, order amount

select CONCAT(firstname,lastname),totalamount
from Customer c inner join [order] o c.id=o.customerid
where TotalAmount >  1000

select firstname,sum(totalamount) as totalAmount
from Customer c
inner join [order] o on c.Id = o.CustomerId
group by c.Id,FirstName
having (sum(TotalAmount)) >1000

----------------------------

--- subqueries
-- people who order
select * from [order]

select * from Customer
where id in (select customerid from [order]);

-- people whodidn't order
select * from Customer
where id not in (select customerid from [order]);


------------------------------

--- Order by clause
select * from Customer
where id in (select customerid from [order])
order by firstname asc, City desc;

