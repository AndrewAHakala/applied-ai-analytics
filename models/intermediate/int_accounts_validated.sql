{{ config(materialized='table') }}

-- Intermediate transformation: int_accounts_validated

with
    validated as (
        select
            account_id,
            account_name,
            industry_code,
            account_status,
            business_segment
        from {{ ref('stg_accounts') }}
        where account_id is not null
    )

select * from validated
