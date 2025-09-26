WITH base AS (
    SELECT 
        product_id
        ,product_name
        ,category_name
        ,product_collection
        ,type_id
        ,gender
        ,material_design
        ,product_price
        ,min_price
        ,max_price
        ,product_url
    FROM {{ ref('stg_product') }}
)

, unknown AS (
    SELECT
        -1 AS product_id,
        'Unknown Product' AS product_name,
        'Unknown Category' AS category_name,
        'Unknown Collection' AS product_collection,
        "Unknown Type" AS type_id,
        'Unknown' AS gender,
        'Unknown' AS material_design,
        NULL AS product_price,
        NULL AS min_price,
        NULL AS max_price,
        'Unknown' AS product_url
)

SELECT * FROM base
UNION ALL
SELECT * FROM unknown
