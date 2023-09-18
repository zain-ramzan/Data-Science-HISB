------------WINDOW FUNCTIONS

--	ROW_NUMBERS()
-- RANK()
-- DENSE_RANK()

select * from Customer


---- Create Rows with numbering by targeting id
select *, 
ROW_NUMBER() over(order by id) row_num
from Customer

---- Create Rows with numbering by targeting a Firstname
select *, 
ROW_NUMBER() over(order by Firstname) row_num
from Customer

---- Create Columns by ordering country name like every country people start from 1
select *, 
ROW_NUMBER() over
(partition by city, country order by Firstname) row_num
from Customer

---- Query over query - subquery (select 1st member in every country)
with rankingnum as (
	select *, 
	ROW_NUMBER() over
	(partition by country order by Firstname) row_num
	from Customer)

select * from rankingnum where row_num =1

---- Join customer and order tables, seperated by country and order by Total Amount spent between 1 to 5
with top_five as(
select FirstName, LastName, Country, sum(totalamount) as TotalAmount, 
-- we used rank() in place of ROW_NUMBER() - because RANK() assigns the same rank to rows with equal values in the ordering criteria. In other words, 
RANK() over(partition by country order by sum(totalamount) desc) row_num
from Customer c
inner join [order] o on c.id = o.customerid
group by FirstName, LastName, Country)
select * from top_five
where row_num <=5


---- Difference between RANK() and ROW_NUMBER()

create table rank_demo(
v varchar(10)
);

insert into rank_demo(v)
values ('A'),('B'),('B'),('C'),('C'),('D'),('E');

select
v,
rank() over (order by v) rank_no,
ROW_NUMBER() over (order by v) row_no,
dense_rank() over (order by v) dense_no,
NTILE(3) over(order by v) nitle_no
from rank_demo;

------------------------------INDEXES
---- CLUSTERED INDEXES
---- NON-CLUSTERED INDEXES


create index idx_customer_country
on customer(country)
where country='uk'