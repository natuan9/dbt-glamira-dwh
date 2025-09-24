SELECT DISTINCT
    FARM_FINGERPRINT(CONCAT(ip_address, country_name, region_name, city_name)) AS location_key
    ,ip_address
    ,country_code
    ,country_name
    ,region_name
    ,city_name
FROM {{ ref('stg_ip_location') }}