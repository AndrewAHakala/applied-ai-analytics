{{ config(materialized='view') }}

with claims as (
    select *
    from {{ ref('stg_claims') }}
),

claim_financials as (
    select
        claim_id,
        incurred_loss,
        paid_loss,
        case_reserve
    from {{ ref('stg_claim_financials') }}
),

final as (
    select
        claims.claim_id,
        claims.policy_id,
        claims.claim_status,
        claims.cause_of_loss,
        claims.date_of_loss,
        coalesce(claim_financials.incurred_loss, 0) as incurred_loss,
        coalesce(claim_financials.paid_loss, 0) as paid_loss,
        coalesce(claim_financials.case_reserve, 0) as case_reserve
    from claims
    left join claim_financials
        on claims.claim_id = claim_financials.claim_id
)

select *
from final
