{{ config(materialized='table') }}

-- Intermediate transformation: int_claim_financials_joined

select
    expenses_cleaned.expense_id,
    expenses_cleaned.policy_term_id,
    expenses_cleaned.expense_type,
    expenses_cleaned.expense_amount,
    expenses_cleaned.expense_date,
    policy_terms_validated.policy_id as policy_terms_validated_policy_id,
    policy_terms_validated.effective_date as policy_terms_validated_effective_date,
    policy_terms_validated.written_premium as policy_terms_validated_written_premium,
    policy_terms_validated.expiration_date as policy_terms_validated_expiration_date
from {{ ref('int_expenses_cleaned') }} as expenses_cleaned
left join {{ ref('int_policy_terms_validated') }} as policy_terms_validated
    on expenses_cleaned.policy_term_id = policy_terms_validated.policy_term_id
