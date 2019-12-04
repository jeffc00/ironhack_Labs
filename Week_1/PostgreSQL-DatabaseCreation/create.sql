CREATE TABLE cars (
car_id serial primary key,
car_name text,
manufacturer text,
"year" integer,
color text
);
--
CREATE TABLE salesperson (
staff_id serial primary key,
staff_name text NOT NULL,
store_place text NOT NULL
);
--
CREATE TABLE customers (
customer_id serial primary key,
cust_name text NOT NULL,
phone_number text,
email text NOT NULL,
address text,  
city text,
"state" text,
country text,
zip_postalcode integer
);
--
CREATE TABLE invoices (
invoice_id serial primary key,
in_number serial, 
"date" date not null, 
customer_id integer,
staff_id integer
);
--
CREATE TABLE cars_sold (
sold_id serial primary key,
invoice_id integer not null,  
car_id integer not null	
);


ALTER TABLE invoices
ADD CONSTRAINT cust_id FOREIGN KEY (customer_id)
	REFERENCES customers(customer_id),

ADD CONSTRAINT sales_id FOREIGN KEY (staff_id)
	REFERENCES salesperson(staff_id)
	
	
ALTER TABLE cars_sold
ADD CONSTRAINT invoice_id FOREIGN KEY (invoice_id)
	REFERENCES invoices(invoice_id),

ADD CONSTRAINT car_id FOREIGN KEY (car_id)
	REFERENCES cars(car_id)


