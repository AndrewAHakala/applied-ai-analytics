{{ config(materialized='table') }}

-- Intermediate transformation: int_policies_transformed

select
    claim_financial_id,
    claim_id,
    incurred_loss,
    paid_loss,
    case_reserve,
    incurred_loss_category,
    upper(incurred_loss_category) as incurred_loss_category_normalized,
    round(incurred_loss, 2) as incurred_loss_rounded
from {{ ref('int_claims_mapped') }}
