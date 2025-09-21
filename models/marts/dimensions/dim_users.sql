select 
    user_id_db,
    device_id,
    email_address,
    store_id
from {{ ref('stg_user_behaviors') }}