{{ config(materialized='view') }}

-- Staging model for ACCOUNTS
-- Renames, casts, and cleans raw source columns

select
    ACCOUNT_ID as account_id,
    ACCOUNT_NAME as account_name,
    INDUSTRY_CODE as industry_code,
    ACCOUNT_STATUS as account_status,
    BUSINESS_SEGMENT as business_segment
from {{ source('raw_data', 'ACCOUNTS') }}
