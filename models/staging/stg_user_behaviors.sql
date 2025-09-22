with user_behaviors as (

    select 
        _id,
        time_stamp,
        FORMAT_DATE('%Y%m%d', DATE(TIMESTAMP_SECONDS(time_stamp))) AS date_id,
        local_time,
        collection,
        product_id,
        ip,
        user_id_db,
        order_id,
        price,
        currency,
        is_paypal,
        current_url,
        referrer_url,
        key_search,
        recommendation_clicked_position,
        recommendation_product_id,
        recommendation_product_position,
        cart_products,
        option,
        show_recommendation,
        recommendation,
        device_id,
        email_address,
        store_id
    from `my-glamira-project.glamira_dataset.raw_user_behaviors`
 
)

select * from user_behaviors
