{{ config(materialized='table') }}

-- Intermediate transformation: int_policies_aggregated

with
    filtered as (
        select
            treaty_id,
            policy_id,
            treaty_type,
            ceded_premium,
            ceded_loss
        from {{ ref('int_reinsurance_treaties_cleaned') }}
        where treaty_id is not null
    )

select
    treaty_id,
    count(*) as record_count,
    sum(ceded_premium) as total_ceded_premium,
    avg(ceded_premium) as avg_ceded_premium,
    sum(ceded_loss) as total_ceded_loss,
    avg(ceded_loss) as avg_ceded_loss
from filtered
group by treaty_id
