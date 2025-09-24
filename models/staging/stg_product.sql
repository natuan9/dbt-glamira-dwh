WITH products AS (

    SELECT 
        product_id
        ,name AS product_name
        ,category_name
        ,collection AS product_collection
        ,type_id
        ,gender
        ,material_design
        ,price AS product_price
        ,min_price
        ,max_price
        ,url AS product_url
    FROM {{ source('glamira_data', 'raw_products') }}

)

SELECT * FROM products
