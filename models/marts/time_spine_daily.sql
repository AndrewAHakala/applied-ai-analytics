{{ config(materialized='table') }}

with days as (

    {{
        dbt.date_spine(
            'day',
            "to_date('2018-01-01', 'yyyy-mm-dd')",
            "dateadd(day, 366, current_date())"
        )
    }}

),

final as (
    select cast(date_day as date) as date_day
    from days
)

select *
from final
where date_day >= dateadd(year, -10, current_date())
  and date_day < dateadd(day, 366, current_date())
