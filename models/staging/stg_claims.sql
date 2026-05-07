{{ config(materialized='view') }}

-- Staging model for CLAIMS
-- Renames, casts, and cleans raw source columns

select
    CLAIM_ID as claim_id,
    POLICY_ID as policy_id,
    CLAIM_STATUS as claim_status,
    CAUSE_OF_LOSS as cause_of_loss,
    cast(DATE_OF_LOSS as date) as date_of_loss
from {{ source('raw_data', 'CLAIMS') }}
