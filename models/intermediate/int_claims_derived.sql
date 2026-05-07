{{ config(materialized='table') }}

-- Intermediate transformation: int_claims_derived

with
    base as (
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
        from {{ ref('int_accounts_joined') }}
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
from base
where _rn = 1
