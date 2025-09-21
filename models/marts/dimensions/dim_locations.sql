SELECT DISTINCT
    ip,
    country_code,
    country_name,
    region_name,
    city_name
FROM {{ ref('stg_ip_locations') }}