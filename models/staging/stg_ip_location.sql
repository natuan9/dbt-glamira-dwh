WITH ip_locations AS (

    SELECT 
        FARM_FINGERPRINT(CONCAT(ip, country_name, region_name, city_name)) AS location_key
        ,ip AS ip_address
        ,country_code
        ,country_name
        ,region_name
        ,city_name
    FROM {{ source('glamira_data', 'raw_ip_locations') }}
 
)

SELECT * FROM ip_locations
