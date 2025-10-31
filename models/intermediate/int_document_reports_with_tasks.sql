{{ config(materialized='table') }}

select
    dr.*,
    t.total_tasks,
    t.n_classification,
    t.n_extraction,
    t.n_fraud_assessment,
    t.avg_task_turnaround_time_secs,
    t.total_task_turnaround_time_secs,
    t.agencies,
    t.n_agencies,
    t.is_multi_agency,
    t.seniorities,
    t.n_seniorities,
    t.n_tasks_senior,
    t.n_tasks_junior
    from {{ ref('int_document_report') }} dr
        left join {{ ref('int_tasks_by_report') }} t
            using (report_id)
