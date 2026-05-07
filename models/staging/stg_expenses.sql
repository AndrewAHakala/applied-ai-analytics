{{ config(materialized='view') }}

-- Staging model for EXPENSES
-- Renames, casts, and cleans raw source columns

select
    EXPENSE_ID as expense_id,
    POLICY_TERM_ID as policy_term_id,
    EXPENSE_TYPE as expense_type,
    cast(EXPENSE_AMOUNT as decimal(18,2)) as expense_amount,
    cast(EXPENSE_DATE as date) as expense_date
from {{ source('raw_data', 'EXPENSES') }}
