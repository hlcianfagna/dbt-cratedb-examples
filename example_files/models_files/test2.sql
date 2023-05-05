{{ config(schema='doc',
    materialized='incremental',
    unique_key='id',
    incremental_strategy='delete+insert'
  )
}}

select * 
from {{ ref("jobslog")|replace('"doc_doc".', 'crate.') }}

{% if is_incremental() %}
  where started >= (select max(started) from {{ this }})
{% endif %}
