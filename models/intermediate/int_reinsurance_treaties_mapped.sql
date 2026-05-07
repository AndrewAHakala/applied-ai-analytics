{{ config(materialized='table') }}

-- Intermediate transformation: int_reinsurance_treaties_mapped

select
    account_id,
    account_name,
    industry_code,
    account_status,
    business_segment
from {{ ref('int_accounts_validated') }}
