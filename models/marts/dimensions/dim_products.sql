select 
    product_id,
    product_name,
    category_name,
    product_collection,
    type_id,
    gender,
    material_design,
    product_price,
    min_price,
    max_price,
    product_url
from {{ ref('stg_products') }}