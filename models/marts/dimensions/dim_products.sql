select 
    product_id,
    product_name,
    category_name,
    collection,
    type_id,
    gender,
    material_design,
    price,
    min_price,
    max_price,
    qty,
    url
from {{ ref('stg_products') }}