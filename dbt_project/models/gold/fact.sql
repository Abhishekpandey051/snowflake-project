{% set config = [
    {
        'table': 'AIRBNB.GOLD.OBD',
        'column': 'gold_obd.BOOKING_ID, gold_obd.LISTING_ID, gold_obd.HOST_ID, gold_obd.TOTAL_AMOUNT, gold_obd.CLEANING_FEE, gold_obd.SERVICE_FEE, gold_obd.ACCOMMODATES, gold_obd.BEDROOMS, gold_obd.RESPONSE_RATE',
        'alias': 'gold_obd'
    },
    {
        'table': 'AIRBNB.GOLD.DIM_LISTING',
        'column': '',
        'alias': 'gold_listing',
        'join_condition': 'gold_obd.listing_id = gold_listing.listing_id'
    },
    {
        'table': 'AIRBNB.GOLD.DIM_HOST',
        'column': '',
        'alias': 'gold_host',
        'join_condition': 'gold_obd.host_id = gold_host.host_id'
    }
] %}

SELECT
    {{ config[0]['column'] }}
FROM
{% for i in config %}
    {% if loop.first %}
    {{ i['table'] }} AS {{ i['alias'] }}
    {% else %}
    LEFT JOIN {{ i['table'] }} AS {{ i['alias'] }}
        ON {{ i['join_condition'] }}
    {% endif %}
{% endfor %}