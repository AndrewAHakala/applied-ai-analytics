{{ config(materialized='view') }}

-- Marts model: fct_accounts

select
    policy_terms_calculated.account_id
from {{ ref('int_policy_terms_calculated') }} as policy_terms_calculated
