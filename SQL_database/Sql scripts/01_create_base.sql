create table orders 
(
id Serial primary key,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
customer_id int not null,
total_amount numeric (8,2) check (total_amount>0.00)
)

create table customers
(
id Serial,
name Varchar(50) default 'Noname',
email Varchar(20) unique,
phone Varchar(50) not null,
registration_date Date default current_date
)


alter table customers add constraint pk primary key (id) -- Был упущен первичный ключ - исправил

create table orderitem 
(
id Serial primary key,
order_id  int not null,
product_id int not null,
quantity numeric (5,3) check (quantity>=0.00)
)

create table product
(
id Serial primary key,
name Varchar(50) not null,
category Varchar(50) default 'no category',
price numeric(6,2) check (price>0.00),
in_stock Boolean
)

alter table customers alter column email type varchar (100) -- По замечанию заказчика изменил тип данных

alter table orderitem alter column quantity type int    -- По специфике товара предполагается продажа целыми единицами

alter table orders add constraint fk_customers foreign key (customer_id) references customers(id)

alter table orderitem  add constraint fk_order foreign key (order_id) references orders(id),
add constraint fk_product foreign key (product_id) references product(id)
