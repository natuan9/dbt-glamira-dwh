WITH user_behaviors AS (

    SELECT 
        _id
        ,time_stamp
        ,FORMAT_DATE('%Y%m%d', DATE(TIMESTAMP_SECONDS(time_stamp))) AS date_id
        ,local_time
        ,collection
        ,product_id
        ,ip as ip_address
        ,user_id_db AS user_id
        ,order_id
        ,price
        ,currency AS sale_currency
        ,is_paypal
        ,current_url
        ,referrer_url
        ,key_search
        ,recommendation_clicked_position
        ,recommendation_product_id
        ,recommendation_product_position
        ,cart_products
        ,option
        ,show_recommendation
        ,recommendation
        ,device_id
        ,email_address
        ,user_agent
        ,resolution AS device_resolution
        ,store_id
    FROM {{ source('glamira_data', 'raw_user_behaviors') }}
 
)

SELECT * FROM user_behaviors
