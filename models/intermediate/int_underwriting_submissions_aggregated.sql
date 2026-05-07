{{ config(materialized='table') }}

-- Intermediate transformation: int_underwriting_submissions_aggregated

with
    filtered as (
        select
            submission_id,
            account_id,
            submission_type,
            underwriting_decision,
            distribution_channel
        from {{ ref('int_underwriting_submissions_enriched') }}
        where submission_id is not null
    )

select
    submission_id,
    count(*) as record_count
from filtered
group by submission_id
