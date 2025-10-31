{{ config(materialized='view') }}

select
    cast(report_id as string)                           as report_id,
    cast(task_id as string)                             as task_id,
    trim(task_type)                                     as task_type,     -- Classification / Extraction / Fraud Assessment
    safe_cast(task_turn_around_time_secs as int64)      as task_turnaround_time_secs,
    trim(`Agent Seniority`)                             as agent_seniority,
    cast(agency_manual_processing_operation as int64)   as agency_manual_processing_operation
    from {{ source('raw', 'human_agent') }}
