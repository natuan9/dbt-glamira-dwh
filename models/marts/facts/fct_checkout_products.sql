WITH base AS (
    SELECT 
        user_id_db,
        order_id,
        date_id,
        collection,
        cart_products
    FROM {{ ref('stg_user_behaviors') }}
    WHERE collection = 'checkout_success'
),

flattened AS (
    SELECT
        b.user_id_db,
        b.order_id,
        b.date_id,
        cp.product_id,
        cp.amount,
        SAFE_CAST(cp.price AS NUMERIC) AS price,
        cp.currency
    FROM base b
    CROSS JOIN UNNEST(b.cart_products) AS cp
)

SELECT
    user_id_db,
    order_id,
    date_id,
    product_id,
    amount,
    price,
    currency
FROM flattened