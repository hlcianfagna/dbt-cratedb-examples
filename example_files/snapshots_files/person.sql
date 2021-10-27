{% snapshot sales_snapshot %}

{{
    config(
      target_database='',
      target_schema='dbt_snapshot',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ ref('sales') }}

{% endsnapshot %}