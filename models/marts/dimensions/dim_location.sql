SELECT DISTINCT
    location_key
    ,ip_address
    ,country_code
    ,country_name
    ,region_name
    ,city_name
FROM {{ ref('stg_ip_location') }}