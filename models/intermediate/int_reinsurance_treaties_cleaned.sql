{{ config(materialized='table') }}

-- Intermediate transformation: int_reinsurance_treaties_cleaned

with
    cleaned as (
        select
            treaty_id,
            policy_id,
            treaty_type,
            coalesce(ceded_premium, 0) as ceded_premium,
            coalesce(ceded_loss, 0) as ceded_loss
        from {{ ref('stg_reinsurance_treaties') }}
        where treaty_id is not null
    )

select * from cleaned
