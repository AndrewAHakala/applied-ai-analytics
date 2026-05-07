{{ config(materialized='view') }}

-- Intermediate transformation: int_policy_terms_pivoted

select
    policy_id,
    account_id,
    policy_number,
    line_of_business,
    policy_status
from {{ ref('int_policies_filtered') }}
