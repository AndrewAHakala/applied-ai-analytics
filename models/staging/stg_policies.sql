{{ config(materialized='view') }}

-- Staging model for POLICIES
-- Renames, casts, and cleans raw source columns

select
    POLICY_ID as policy_id,
    ACCOUNT_ID as account_id,
    POLICY_NUMBER as policy_number,
    LINE_OF_BUSINESS as line_of_business,
    POLICY_STATUS as policy_status
from {{ source('raw_data', 'POLICIES') }}
