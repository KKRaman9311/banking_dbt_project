{{
    config(
        materialized='table'
    )
}}

select
  {{ dbt_utils.generate_surrogate_key( ['account_id'] ) }} as account_key,
  account_id,
  customer_id,
  account_type,
  branch_name,
  current_balance,
  account_status,
  opened_date
from
{{ ref('stg_accounts') }}