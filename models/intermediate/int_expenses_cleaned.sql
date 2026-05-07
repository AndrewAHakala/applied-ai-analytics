{{ config(materialized='table') }}

-- Intermediate transformation: int_expenses_cleaned

with
    cleaned as (
        select
            expense_id,
            policy_term_id,
            expense_type,
            coalesce(expense_amount, 0) as expense_amount,
            expense_date
        from {{ ref('stg_expenses') }}
        where expense_id is not null
    )

select * from cleaned
