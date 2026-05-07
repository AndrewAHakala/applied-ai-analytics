{{ config(materialized='table') }}

-- Marts model: dim_policy_terms

with
    ranked as (
        select
            expense_id,
            policy_term_id,
            expense_type,
            expense_amount,
            expense_date,
            policy_terms_validated_policy_id,
            policy_terms_validated_effective_date,
            policy_terms_validated_written_premium,
            policy_terms_validated_expiration_date,
            row_number() over (partition by expense_id order by expense_date desc) as _rn
        from {{ ref('int_claims_derived') }}
    )

select
    expense_id,
    policy_term_id,
    expense_type,
    expense_amount,
    expense_date,
    policy_terms_validated_policy_id,
    policy_terms_validated_effective_date,
    policy_terms_validated_written_premium,
    policy_terms_validated_expiration_date
from ranked
where _rn = 1
