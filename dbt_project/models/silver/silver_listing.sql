{{ config( materialized = 'incremental', unique_key = 'LISTING_ID') }}

SELECT
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BATHROOMS,
    BEDROOMS,
    {{ tag('CAST(PRICE_PER_NIGHT AS INT)') }} AS PRICE_TAG,
    CREATED_AT
FROM
      {{ ref('bronze_listing')}}    