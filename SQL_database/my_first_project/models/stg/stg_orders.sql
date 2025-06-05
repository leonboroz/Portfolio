select * from {{ source('my_schema', 'orders') }}
