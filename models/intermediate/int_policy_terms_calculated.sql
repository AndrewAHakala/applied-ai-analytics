{{ config(materialized='table') }}

-- Intermediate transformation: int_policy_terms_calculated

select
    account_id,
    account_name,
    industry_code,
    account_status,
    business_segment
from {{ ref('int_reinsurance_treaties_mapped') }}
