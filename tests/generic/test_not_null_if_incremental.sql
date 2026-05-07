{% test not_null_if_incremental(model, column_name) %}

{% if is_incremental() %}
select *
from {{ model }}
where {{ column_name }} is null
{% else %}
select 1 where false
{% endif %}

{% endtest %}
