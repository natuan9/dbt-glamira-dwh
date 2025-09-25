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
        ,cp.amount AS order_quantity
        ,SAFE_CAST(cp.price AS NUMERIC) AS unit_price
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
        f.order_quantity,
        f.unit_price,
        f.device_id,
        f.store_id,
        COALESCE(l.location_key, -1) AS location_key,
        f.currency
    FROM flattened f
    LEFT JOIN {{ ref('dim_location') }} l
        ON f.ip_address = l.ip_address
),

with_product AS (
    SELECT
        wl.user_id,
        wl.order_id,
        wl.date_id,
        COALESCE(p.product_id, -1) AS product_id,
        wl.order_quantity,
        wl.unit_price,
        wl.device_id,
        wl.store_id,
        wl.location_key,
        wl.currency
    FROM with_location wl
    LEFT JOIN {{ ref('dim_product') }} p
        ON wl.product_id = p.product_id
)


SELECT
    user_id
    ,order_id
    ,date_id
    ,location_key
    ,product_id
    ,order_quantity
    ,unit_price
    ,order_quantity * unit_price AS sale_amount
    ,device_id
    ,store_id
    ,currency
FROM with_product