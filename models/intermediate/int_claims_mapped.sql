{{ config(materialized='table') }}

-- Intermediate transformation: int_claims_mapped

select
    claim_financial_id,
    claim_id,
    incurred_loss,
    paid_loss,
    case_reserve,
    incurred_loss_category
from {{ ref('int_claim_financials_enriched') }}
