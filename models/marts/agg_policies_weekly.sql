{{ config(materialized='view') }}

-- Marts model: agg_policies_weekly

select
    account_id
from {{ ref('fct_accounts') }}
