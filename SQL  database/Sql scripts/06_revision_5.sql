create table gift_cards
(
id Serial primary key,
card_number Varchar(50) not null,
balance Numeric(8,2),
is_actived Boolean,
actived_date Date,
expriration_date date
)

alter table orders add column gift_card_id int,
add constraint fk_gc foreign key (gift_card_id)  references gift_cards(id) -- добавил  внешний ключ

alter table products add column max_order_quality int -- дабавили максимальное количество товара в заказе