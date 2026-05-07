{{ config(materialized='view') }}

-- Staging model for UNDERWRITING_SUBMISSIONS
-- Renames, casts, and cleans raw source columns

select
    SUBMISSION_ID as submission_id,
    ACCOUNT_ID as account_id,
    SUBMISSION_TYPE as submission_type,
    UNDERWRITING_DECISION as underwriting_decision,
    DISTRIBUTION_CHANNEL as distribution_channel
from {{ source('raw_data', 'UNDERWRITING_SUBMISSIONS') }}
