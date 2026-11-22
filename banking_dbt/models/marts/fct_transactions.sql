{{
    config(
         materialized='table'
    )
}}

select
t.transaction_id,
t.account_id,
a.customer_id,
a.account_type,
a.branch_name,
t.transcation_date,
t.transaction_type,
t.amount,
t.transaction_status,
CASE
    WHEN t.transaction_status = 'SUCCESS' then 1
    else 0 end as is_successful,
CASE
    WHEN t.transaction_status = 'FAILED' then 1
    else 0 end as is_failed
from
{{ ref('stg_transactions') }} as t
left join
{{ ref('stg_accounts') }} as a
on
t.account_id = a.account_id
