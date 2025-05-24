alter table rentals rename rrental_start to rental_start

alter table products drop column is_rentable,
  drop column is_subscribable
  
alter table orderitem  drop column item_type 

alter table orderitem add column item_type int not null

alter table orderitem alter column product_id drop not null

alter table orderitem add column rental_id int,
						add column subscribe_id int,
						add constraint fk_rentals foreign key (rental_id) references rentals(id),
						add constraint fk_subscribe foreign key (subscribe_id) references subscriptions(id)
						
create table itemtype
(
id Serial primary key,
descriprion Varchar(50) check (descriprion in ('product','service','subscription','rental'))
)

alter table orderitem  add constraint fk_itemtype foreign key (item_type) references itemtype(id)
on update cascade 
on delete cascade

alter table itemtype rename column descriprion to description


