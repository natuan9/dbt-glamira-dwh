WITH ip_locations AS (

    SELECT 
        ip
        ,country_code
        ,country_name
        ,region_name
        ,city_name
    FROM `my-glamira-project.glamira_dataset.raw_ip_locations`
 
)

SELECT * FROM ip_locations
