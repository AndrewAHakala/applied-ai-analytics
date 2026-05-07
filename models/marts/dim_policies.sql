{{ config(materialized='view') }}

-- Marts model: dim_policies

select distinct
    treaty_id,
    record_count,
    total_ceded_premium,
    avg_ceded_premium,
    total_ceded_loss,
    avg_ceded_loss
from {{ ref('int_accounts_combined') }}
