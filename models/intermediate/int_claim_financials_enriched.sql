{{ config(materialized='view') }}

-- Intermediate transformation: int_claim_financials_enriched

select
    claim_financial_id,
    claim_id,
    incurred_loss,
    paid_loss,
    case_reserve,
    case when incurred_loss > 0 then 'positive' else 'non_positive' end as incurred_loss_category
from {{ ref('stg_claim_financials') }}
