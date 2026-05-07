{{ config(materialized='table') }}

-- Intermediate transformation: int_underwriting_submissions_enriched

select
    submission_id,
    account_id,
    submission_type,
    underwriting_decision,
    distribution_channel
from {{ ref('stg_underwriting_submissions') }}
