-- models/intermediate/int_tasks_detailed.sql
{{ config(materialized='table') }}

select
    t.report_id,
    t.task_id,
    t.task_type,
    t.task_turnaround_time_secs,
    t.agent_seniority,
    t.agency,
    c.industry,
    c.client_country
    from {{ ref('stg_human_agent') }} t
    left join {{ ref('stg_document_report') }} r using (report_id)
    left join {{ ref('stg_clients') }} c using (client_id)
