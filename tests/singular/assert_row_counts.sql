-- Assert staging models are not empty

select
    'stg_accounts' as model_name,
    count(*) as row_count
from {{ ref('stg_accounts') }}
having count(*) = 0
union all
select
    'stg_policies' as model_name,
    count(*) as row_count
from {{ ref('stg_policies') }}
having count(*) = 0
union all
select
    'stg_policy_terms' as model_name,
    count(*) as row_count
from {{ ref('stg_policy_terms') }}
having count(*) = 0
union all
select
    'stg_claims' as model_name,
    count(*) as row_count
from {{ ref('stg_claims') }}
having count(*) = 0
union all
select
    'stg_claim_financials' as model_name,
    count(*) as row_count
from {{ ref('stg_claim_financials') }}
having count(*) = 0
