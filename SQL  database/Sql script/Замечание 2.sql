alter table customers add column is_vip Boolean

alter table orders add column status Varchar(50) check (status in ('New','In Progress','Completed','Cancelled'))

alter table product add column expiration_date  DATE

alter table orders add column comment Text

alter table product rename  to products