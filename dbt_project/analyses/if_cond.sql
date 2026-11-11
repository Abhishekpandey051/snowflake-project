{% set flag = 1 %}

SELECT * FROM {{ref('bronze_booking')}}
WHERE NIGHTS_BOOKED > {{flag}}
 