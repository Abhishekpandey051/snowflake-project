{# {% set incremental_col = 'CREATED_AT' %}

(SELECT COALESCE(MAX({{incremental_col}}), '1900-01-01') FROM {{ ref("bronze_listing") }} ) 

SELECT * FROM {{ source('staging', 'bookings') }} #}

{{multiply(100, 50.50, 2)}}
