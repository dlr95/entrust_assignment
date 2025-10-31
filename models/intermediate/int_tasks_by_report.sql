-- int_tasks_by_report.sql
{{ config(materialized='table') }}

with tasks as (
    select * from {{ ref('stg_human_agent') }}
)
select
    report_id,
    count(distinct task_id) as total_tasks,
    countif(task_type = 'Classification') as n_classification,
    countif(task_type = 'Extraction') as n_extraction,
    countif(task_type = 'Fraud Assessment') as n_fraud_assessment,
    avg(task_tat_secs) as avg_task_tat_secs,
    sum(task_tat_secs) as total_task_tat_secs,
    avg(agency_manual_processing_operation) as avg_agency_ops,
    any_value(agent_seniority) as agent_seniority
    from tasks
    group by report_id
