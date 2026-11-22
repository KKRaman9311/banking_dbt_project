{{
    config(
        materialized='view'
    )
}}

select
    c.customer_id,
    c.customer_name,
    c.city,
    count(a.account_id) as total_accounts,
    sum(a.current_balance) as total_balance
from 
   {{ ref('stg_customers') }} as  c 
left join 
   {{ ref('stg_accounts') }} as  a
on
   c.customer_id = a.customer_id
group by
   c.customer_id,
   c.customer_name,
   c.city


