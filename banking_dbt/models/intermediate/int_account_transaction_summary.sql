{{
    config(
         materialized='view'
    )
}}

select 
  account_id,
  count(transaction_id) as total_transactions,
  sum(
    CASE
       WHEN transaction_type = 'DEPOSIT'
       AND transaction_status = 'SUCCESS'
       THEN amount
       ELSE
       0
    END
  ) as total_deposit_amount,
  sum(
    CASE
       WHEN transaction_type = 'WITHDRAWAL'
       AND transaction_status = 'SUCCESS'
       THEN amount
       ELSE
       0
    END

  ) as total_withdrawal_amount,
  SUM(
    CASE
       WHEN transaction_status = 'SUCCESS'
       THEN amount
       ELSE
       0
    END
  ) AS total_successful_transaction_amount,
   SUM(
    CASE
       WHEN transaction_status = 'FAILED'
       THEN 1
       ELSE
       0
    END
  ) AS failed_transaction_count

FROM

{{ ref('stg_transactions') }}

GROUP BY

account_id