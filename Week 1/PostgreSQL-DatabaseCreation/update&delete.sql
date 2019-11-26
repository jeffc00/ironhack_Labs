select * from customers;
UPDATE customers
	set email = 'ppicasso@gmail.com'
	where cust_name = 'Pablo Picasso';
UPDATE customers	
	set email = 'lincoln@us.gov'
	where cust_name = 'Abraham Lincoln';
UPDATE customers
	set email = 'hello@napoleon.me'
	where cust_name = 'Napoléon Bonaparte';

select * from customers;
select * from cars;
select * from cars_sold;

--Delete rows.
-- Devido a necessidade de criar 
DELETE FROM cars_sold
where sold_id = 2
DELETE FROM cars
WHERE car_id = 4;





