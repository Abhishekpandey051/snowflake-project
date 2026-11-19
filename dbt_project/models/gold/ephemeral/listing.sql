{{ config(materialized='ephemeral') }}

WITH listing AS (
 SELECT    
    LISTING_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    PRICE_TAG,
    CREATED_AT

FROM {{ ref('obd') }}    
)

SELECT * FROM listing