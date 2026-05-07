{{ config(materialized='view') }}

-- Intermediate transformation: int_policy_terms_validated

with
    validated as (
        select
            policy_term_id,
            policy_id,
            effective_date,
            written_premium,
            expiration_date
        from {{ ref('stg_policy_terms') }}
        where policy_term_id is not null and written_premium >= 0
    )

select * from validated
