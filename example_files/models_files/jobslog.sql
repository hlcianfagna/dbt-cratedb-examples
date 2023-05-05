{{ config(materialized='ephemeral') }}

select id,started,stmt,username from sys.jobs_log
