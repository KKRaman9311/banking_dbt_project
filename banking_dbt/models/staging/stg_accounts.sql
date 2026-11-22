{{
    config(
        materialized='table'
    )
}}

select
  account_id,
  customer_id,
  UPPER(TRIM(account_type)) as account_type,
  UPPER(TRIM(branch_name)) as branch_name,
  CAST(current_balance as decimal(18,2)) as current_balance,
  UPPER(TRIM(account_status)) as account_status,
  CAST(opened_date as date) as opened_date
from
{{source('raw_banking','raw_accounts')}}