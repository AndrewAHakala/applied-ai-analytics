-- Assert numeric columns in marts models are non-negative

select
    'dim_policies.record_count' as test_name,
    record_count as tested_value
from {{ ref('dim_policies') }}
where record_count < 0
union all
select
    'dim_policies.total_ceded_premium' as test_name,
    total_ceded_premium as tested_value
from {{ ref('dim_policies') }}
where total_ceded_premium < 0
union all
select
    'dim_policy_terms.expense_amount' as test_name,
    expense_amount as tested_value
from {{ ref('dim_policy_terms') }}
where expense_amount < 0
union all
select
    'dim_policy_terms.policy_terms_validated_written_premium' as test_name,
    policy_terms_validated_written_premium as tested_value
from {{ ref('dim_policy_terms') }}
where policy_terms_validated_written_premium < 0
