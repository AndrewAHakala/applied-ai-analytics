{{ config(materialized='table') }}

-- Intermediate transformation: int_expenses_pivoted

select
    treaty_id,
    policy_id,
    treaty_type,
    ceded_premium,
    ceded_loss
from {{ ref('int_reinsurance_treaties_cleaned') }}
