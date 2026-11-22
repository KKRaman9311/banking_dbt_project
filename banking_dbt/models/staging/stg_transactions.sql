{{
    config(
        materialized='view'
    )
}}

select
    transaction_id,
    account_id,
    CAST(transaction_date as date) as transcation_date,
    UPPER(TRIM(transaction_type)) as transaction_type,
    CAST(amount as decimal(18,2)) as amount,
    UPPER(TRIM(transaction_status)) as transaction_status
from
    {{ source('raw_banking', 'raw_transactions')  }}