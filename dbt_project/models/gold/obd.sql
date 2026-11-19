{% set config = [
    {
        'table': 'AIRBNB.SILVER.SILVER_BOOKING',
        'columns': 'silver_booking.*',
        'alias': 'silver_booking'
    },
    {
        'table': 'AIRBNB.SILVER.SILVER_LISTING',
        'columns': 'silver_listing.LISTING_ID,silver_listing.PROPERTY_TYPE, silver_listing.ROOM_TYPE, silver_listing.CITY, silver_listing.COUNTRY, silver_listing.ACCOMMODATES, silver_listing.BATHROOMS, silver_listing.BEDROOMS, silver_listing.PRICE_TAG, silver_listing.CREATED_AT',
        'alias': 'silver_listing',
        'join_condition': 'silver_booking.LISTING_ID = silver_listing.LISTING_ID'
    },
    {
        'table': 'AIRBNB.SILVER.SILVER_HOST',
        'columns': 'silver_host.HOST_ID, silver_host.HOST_NAME, silver_host.HOST_SINCE, silver_host.RESPONSE_RATE_QUALITY, silver_host.RESPONSE_RATE, silver_host.IS_SUPERHOST, silver_host.CREATED_AT',
        'alias': 'silver_host',
        'join_condition': 'silver_listing.HOST_ID = silver_host.HOST_ID'
    }
] %}



SELECT
    {% for tab in config %}
        {{ tab.columns }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for tab in config %}
        {% if loop.first %}
            {{ tab.table }} AS {{ tab.alias }}
        {% else %}
            LEFT JOIN {{ tab.table }} 
            ON {{ tab.join_condition }}
        {% endif %}
    {% endfor %}