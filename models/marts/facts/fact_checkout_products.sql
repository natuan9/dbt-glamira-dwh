WITH base AS (
    SELECT 
        user_id
        ,order_id
        ,date_id
        ,collection
        ,device_id
        ,store_id
        ,cart_products
    FROM {{ ref('stg_user_behaviors') }}
    WHERE collection = 'checkout_success'
),

flattened AS (
    SELECT
        b.user_id
        ,b.order_id
        ,b.date_id
        ,cp.product_id
        ,cp.amount
        ,SAFE_CAST(cp.price AS NUMERIC) AS price
        ,device_id
        ,store_id
        ,cp.currency
    FROM base b
    CROSS JOIN UNNEST(b.cart_products) AS cp
)

SELECT
    user_id
    ,order_id
    ,date_id
    ,product_id
    ,amount
    ,price
    ,device_id
    ,store_id
    ,currency
FROM flattened