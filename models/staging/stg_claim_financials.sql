{{ config(materialized='view') }}

-- Staging model for CLAIM_FINANCIALS
-- Renames, casts, and cleans raw source columns

select
    CLAIM_FINANCIAL_ID as claim_financial_id,
    CLAIM_ID as claim_id,
    cast(INCURRED_LOSS as decimal(18,2)) as incurred_loss,
    cast(PAID_LOSS as decimal(18,2)) as paid_loss,
    cast(CASE_RESERVE as decimal(18,2)) as case_reserve
from {{ source('raw_data', 'CLAIM_FINANCIALS') }}
