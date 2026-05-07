{{ config(materialized='view') }}

-- Intermediate transformation: int_policies_filtered

with
    filtered as (
        select
            policy_id,
            account_id,
            policy_number,
            line_of_business,
            policy_status
        from {{ ref('stg_policies') }}
        where policy_id is not null
    )

select * from filtered
