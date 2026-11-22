{{
    config(
         materialized='table'
    )
}}

select 
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_id,
    customer_name,
    city,
    status
from
    {{ ref('stg_customers') }}