SELECT DISTINCT
    location_key
    ,country_code
    ,country_name
    ,region_name
    ,city_name
FROM {{ ref('stg_ip_location') }}

UNION ALL

SELECT
    -1 AS location_key,
    "Unknown" AS country_code,
    "Unknown" AS country_name,
    "Unknown" AS region_name,
    "Unknown" AS city_name