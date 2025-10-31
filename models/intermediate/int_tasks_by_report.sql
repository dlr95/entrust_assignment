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

    avg(task_turnaround_time_secs) as avg_task_turnaround_time_secs,
    sum(task_turnaround_time_secs) as total_task_turnaround_time_secs,

    
    -- Agencies (distinct list + counts)
    array_agg(distinct agency ignore nulls)      as agencies,
    count(distinct agency)                       as n_agencies,

    -- Seniority (distribution + counts)
    array_agg(distinct agent_seniority ignore nulls)                        as seniorities,
    count(distinct agent_seniority)                                         as n_seniorities,
    sum(case when agent_seniority = 'Senior' then 1 else 0 end)             as n_tasks_senior,
    sum(case when agent_seniority = 'Junior' then 1 else 0 end)             as n_tasks_junior



    from tasks
    group by report_id
