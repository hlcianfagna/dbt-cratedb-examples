{{ config(materialized='view',schema='doc') }}
select id,started,stmt,username from sys.jobs_log
