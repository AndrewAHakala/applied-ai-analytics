{{ config(materialized='view') }}

-- Staging model for REINSURANCE_TREATIES
-- Renames, casts, and cleans raw source columns

select
    TREATY_ID as treaty_id,
    POLICY_ID as policy_id,
    TREATY_TYPE as treaty_type,
    cast(CEDED_PREMIUM as decimal(18,2)) as ceded_premium,
    cast(CEDED_LOSS as decimal(18,2)) as ceded_loss
from {{ source('raw_data', 'REINSURANCE_TREATIES') }}
