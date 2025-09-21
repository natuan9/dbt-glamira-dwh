with products as (

    select 
        product_id,
        name,
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
    from `my-glamira-project.glamira_dataset.raw_products`

)

select * from products
