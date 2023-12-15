-- 1
-- Alter the rental duration and rental rates of the film you inserted before
-- to three weeks and 9.99, respectively.
update film
set rental_duration = 21, rental_rate = 9.99
where upper(title) = upper('Ocean''s eleven');

-- 2
-- Alter any existing customer in the database with at least 10 rental and 10 payment records.
-- Change their personal data to yours (first name, last name, address, etc.). 
-- You can use any existing address from the "address" table.
-- Please do not perform any updates on the "address" table, 
-- as this can impact multiple records with the same address.
update customer
set first_name = 'Aleksey',
    last_name = 'Vetelkin',
    email = 'vetelkin.aleksey@student.ehu.lt',
    address_id = 4,
	store_id = 2
where customer_id = 3
    and (select count(*) from rental where customer_id = 3) >= 10
    and (select count(*) from payment where customer_id = 3) >= 10;

-- 3
-- Change the customer's create_date value to current_date.
update customer
set create_date = current_date
where customer_id = 3

-- simple selects to check workability of programm
-- select film_id, title, rental_duration, rental_rate from film order by film_id desc
-- select * from customer where customer_id = 3