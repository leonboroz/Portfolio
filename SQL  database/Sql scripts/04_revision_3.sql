alter table customers add column loyalty_points int check (loyalty_points>=0)

alter table orders add column delivery_date Date check (delivery_date>=order_date)

alter table orderitem add column discount_percentage Numeric(5,2) check (discount_percentage>=0)

create table suppliers
(
id Serial primary key,
name Varchar(100),
contact_num Varchar(50) not null,
email Varchar(100) not null,
address Varchar(150)
)


alter table products 
add column supplier_id int,
add constraint fk_suppl foreign key (supplier_id) references suppliers (id)
on update cascade
on delete cascade

create table order_status_histiry
(
id Serial primary key
,order_id  int   
,status varchar(50)
,chanded_at timestamp
,constraint fk_orders foreign key (order_id) references orders(id)
)

alter table  order_status_histiry rename  to order_status_history --заметил опечатку исправил




