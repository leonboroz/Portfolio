select to_char (order_date, 'YYYY-MM') as monthLy_order
    ,total_amount
    ,discount_amount
    ,status
from {{ref('stg_orders')}}