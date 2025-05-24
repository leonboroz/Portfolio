alter table customers alter column phone Type Varchar(100)--изменили длину телефона

alter table orders add column discount_amount numeric (6,2)--добавили поле с суммой скидки

alter table product alter column name type varchar (100),--имя может быть длинным поэтому увеличили длину
					add column discounted Boolean,-- тмеет ли товар скидку
					add column discounted_percent numeric(5,2) default null--величина скидки
					
alter table product RENAME column in_stock to allow_backorder --заказчик попросил изменить название поля
					