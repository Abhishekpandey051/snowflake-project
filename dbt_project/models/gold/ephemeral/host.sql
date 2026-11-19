{{ config(materialized='ephemeral') }}

WITH host AS (
    SELECT
       HOST_ID,
       HOST_NAME,
       HOST_SINCE,
       RESPONSE_RATE_QUALITY,
       IS_SUPERHOST,
       CREATED_AT

FROM {{ ref('obd') }}       

)

SELECT * FROM host