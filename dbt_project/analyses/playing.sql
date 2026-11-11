{# {% set incremental_col = 'CREATED_AT' %}

(SELECT COALESCE(MAX({{incremental_col}}), '1900-01-01') FROM {{ ref("bronze_booking") }} )  #}

SELECT * FROM {{ source('staging', 'bookings') }}
