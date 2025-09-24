WITH base AS (
    SELECT 
        user_id
        ,order_id
        ,date_id
        ,collection
        ,device_id
        ,store_id
        ,cart_products
        ,ip_address
    FROM {{ ref('stg_user_behavior') }}
    WHERE collection = 'checkout_success'
),

flattened AS (
    SELECT
        b.user_id
        ,b.order_id
        ,b.date_id
        ,cp.product_id
        ,cp.amount AS sale_quantity
        ,SAFE_CAST(cp.price AS NUMERIC) AS sale_price
        ,device_id
        ,store_id
        ,ip_address
        ,cp.currency
    FROM base b
    CROSS JOIN UNNEST(b.cart_products) AS cp
),

with_location AS (
    SELECT
        f.user_id,
        f.order_id,
        f.date_id,
        f.product_id,
        f.sale_quantity,
        f.sale_price,
        f.device_id,
        f.store_id,
        l.location_key,
        f.currency
    FROM flattened f
    LEFT JOIN {{ ref('stg_ip_location') }} l
        ON f.ip_address = l.ip_address
)


SELECT
    user_id
    ,order_id
    ,date_id
    ,location_key
    ,product_id
    ,sale_quantity
    ,sale_price
    ,device_id
    ,store_id
    ,currency
FROM with_location