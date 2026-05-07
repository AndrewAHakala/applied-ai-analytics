{{ config(materialized='table') }}

-- Marts model: rpt_accounts_daily

select
    account_id
from {{ ref('fct_accounts') }}
