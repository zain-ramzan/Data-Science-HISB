--------------Assignment No : 02

---- Write a query to show the customers names with totalAmount spent order by TotalAmount desc. 


CREATE TABLE CustomerOrder (
    CustomerName VARCHAR(255),
    TotalAmount DECIMAL(10, 2) -- Adjust the data type and precision as needed
);

insert into CustomerOrder (CustomerName, TotalAmount)
SELECT CONCAT(c.firstname, ' ', c.lastname) AS CustomerName, o.TotalAmount AS TotalAmount
FROM customer c
JOIN [order] o ON c.Id = o.CustomerId
order by TotalAmount desc

select * from CustomerOrder


---- Write a sql query to insert the following data in customer table. 
---- Name Jhon Doe, City: Paris Country: France, Phone: 898 0975 124

INSERT INTO Customer(FirstName, LastName, City, Country, Phone)
VALUES ('Ananya', 'Doe', 'Paris', 'France', '123-456-7890');

select * from Customer


-- Update customer information based on a specific condition (e.g., using customer_id)
UPDATE customer
SET City='London', Country='UK', Phone = '‘987 3487 9879'
WHERE Id = 45;

select * from Customer

---- Write a query to get the customer name where totalAmount spent is greater than 10000, The output should be as follows:

-- insert into Customers (CustomerName, TotalAmount)
-- Insert into Customers (CustomerName)
SELECT CONCAT(c.firstname, ' ', c.lastname) AS CustomerName, o.TotalAmount
FROM customer c
JOIN [order] o ON c.Id = o.CustomerId
WHERE o.TotalAmount > 10000;

