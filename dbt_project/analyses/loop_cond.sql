{% set col = ['BOOKING_ID', 'BOOKING_DATE', 'BOOKING_AMOUNT'] %}

SELECT
{% for i in col %}
    {{ i }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM {{ ref('bronze_booking') }}