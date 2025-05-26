create table subscriptions
(
id Serial primary key,
customer_id INT,
service_id INT,
start_date DATE,
end_date DATE,
price_per_period numeric (6,2),
billing_period interval,
is_active BOOLEAN
)

create table rentals
(
id SERIAL primary key,
customer_id  INT,
product_id INT,
rrental_start DATE,
rental_end DATE,
price_total numeric (6,2),
deposit_amount numeric(6,2),
status Varchar(50)  check (status in ('for rent','returned'))
)


alter table orderitem add column item_type Varchar(50) check (item_type in ('product','service','subscription','rental'))


alter table products add column is_rentable bit,
					 add column is_subscribable bit



