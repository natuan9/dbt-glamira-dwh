WITH products AS (

    SELECT 
        product_id
        ,name AS product_name
        ,category_name
        ,collection AS product_collection
        ,type_id
        ,gender
        ,material_design
        ,SAFE_CAST(price AS NUMERIC) AS product_price
        ,SAFE_CAST(min_price AS NUMERIC) AS min_price
        ,SAFE_CAST(max_price AS NUMERIC) AS max_price
        ,url AS product_url
    FROM {{ source('glamira_data', 'raw_products') }}

)

SELECT * FROM products
