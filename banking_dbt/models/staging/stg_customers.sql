{{ 
    config(
        materialized='view'
        )
 }}


 select 
    customer_id,
    UPPER(TRIM(customer_name)) as customer_name,
    UPPER(TRIM(city)) as city,
    UPPER(TRIM(status)) as status
from {{source('raw_banking','raw_customers')}}
