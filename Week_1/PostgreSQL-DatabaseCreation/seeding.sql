INSERT INTO cars(car_name, manufacturer, "year", color)
VALUES
('Fusion', 'Ford',2018, 'White'),
('RAV4', 'Toyota', 2018, 'Silver'),
('V60', 'Volvo', 2019, 'Gray'),
('147', 'Fiat', 1978, 'Pink')
select * from cars;


INSERT INTO customers(cust_name, phone_number, email, address, city, "state", country, zip_postalcode)
VAlUES
('Pablo Picasso', '+34 636 17 63 82', 'picasso@gmail.com', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045),
('Abraham Lincoln','+1 305 907 7086', 'linconl@yahoo.com.br', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
('Napoléon Bonaparte', '+33 1 79 75 40 00', 'nomail', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008)
select * from customers;


INSERT INTO salesperson(staff_name, store_place)
VALUES
('Petey Cruiser', 'Madrid'),
('Anna Sthesia', 'Barcelona'),
('Paul Molive', 'Berlin'),
('Gail Forcewind', 'Paris'),
('Paige Turner', 'Mimia'),
('Bob Frapples', 'Mexico City'),
('Walter Melon', 'Amsterdam'),
('Shonda Leer', 'São Paulo')
select * from salesperson;


INSERT INTO invoices (in_number, "date", customer_id, staff_id)
VALUES
(852399038, '2018-08-22', 1, 3),
(731166526, '2018-12-31', 3, 5),
(271135104, '2019-01-22', 2, 7)
select * from invoices;

INSERT INTO cars_sold(invoice_id, car_id)
VALUES
(1, 3),
(3, 4),
(2, 1)
select * from cars_sold;

