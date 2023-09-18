--------------Assignment Day 1 - Zain Ramzan------------------

--- Select all the customers whose last name starts with "S" and ending with "R"
select * from Customer
where LastName like 'S%R'

 --- Select all the customers whose phone contains ‘778’
 select * from Customer
 where Phone like '%778%'

 --- Select all the records from Product table where UnitPrice is greater than 15 and less than 30
 select * from Product
 where UnitPrice > 15 and UnitPrice < 30

 ---  Select all the suppliers from Supplier table who contains Fax number
 select * from Supplier
 where Fax is not null