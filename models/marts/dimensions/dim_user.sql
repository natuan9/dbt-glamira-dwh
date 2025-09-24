WITH source AS (
    SELECT DISTINCT
        user_id
        ,device_id
        ,email_address
    FROM {{ ref('stg_user_behavior') }}
    WHERE user_id IS NOT NULL
)

SELECT
    user_id
    ,device_id
    ,email_address
FROM source
