{{ config(materialized='view') }}

-- Intermediate transformation: int_claim_financials_combined

select
    treaty_id,
    record_count,
    total_ceded_premium,
    avg_ceded_premium,
    total_ceded_loss,
    avg_ceded_loss
from {{ ref('int_policies_aggregated') }}
