{{ config(materialized='table') }}

select
    dr.*,
    t.total_tasks,
    t.n_classification,
    t.n_extraction,
    t.n_fraud_assessment,
    t.avg_task_tat_secs,
    t.total_task_tat_secs,
    t.agent_seniority,
    t.avg_agency_ops
    from {{ ref('int_document_report') }} dr
        left join {{ ref('int_tasks_by_report') }} t
            using (report_id)
