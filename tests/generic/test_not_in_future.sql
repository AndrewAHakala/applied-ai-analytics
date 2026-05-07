{% test not_in_future(model, column_name) %}

select *
from {{ model }}
where cast({{ column_name }} as timestamp_ntz) > current_timestamp()

{% endtest %}
