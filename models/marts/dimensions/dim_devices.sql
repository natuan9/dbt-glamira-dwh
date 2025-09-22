WITH source AS (
    SELECT DISTINCT
        device_id,
        user_agent,
        resolution
    FROM {{ ref('stg_user_behaviors') }}
    WHERE device_id IS NOT NULL
)

SELECT
    device_id,
    user_agent,
    resolution
FROM source
