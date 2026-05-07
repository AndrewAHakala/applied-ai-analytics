{{ config(materialized='table') }}

-- Intermediate transformation: int_claims_filtered

with
    filtered as (
        select
            claim_id,
            policy_id,
            claim_status,
            cause_of_loss,
            date_of_loss
        from {{ ref('stg_claims') }}
        where date_of_loss >= dateadd('year', -2, current_date)
    )

select * from filtered
