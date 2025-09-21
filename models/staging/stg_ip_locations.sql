with ip_locations as (

    select 
        ip,
        country_code,
        country_name,
        region_name,
        city_name
    from `my-glamira-project.glamira_dataset.raw_ip_locations`
 
)

select * from ip_locations
