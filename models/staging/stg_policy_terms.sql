{{ config(materialized='view') }}

-- Staging model for POLICY_TERMS
-- Renames, casts, and cleans raw source columns

select
    POLICY_TERM_ID as policy_term_id,
    POLICY_ID as policy_id,
    cast(EFFECTIVE_DATE as date) as effective_date,
    cast(WRITTEN_PREMIUM as decimal(18,2)) as written_premium,
    cast(EXPIRATION_DATE as date) as expiration_date
from {{ source('raw_data', 'POLICY_TERMS') }}
