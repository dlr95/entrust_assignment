-- int_document_report.sql
{{ config(materialized='table') }}

with reports as (
    select * from {{ ref('stg_document_report') }}
),
clients as (
    select * from {{ ref('stg_clients') }}
)

select
    r.report_id,
    r.client_id,
    c.industry,
    c.client_country,
    r.document_type,
    r.issuing_country,
    r.fraud_result,
    r.report_completed_date,
    r.report_tat_secs,
    -- Derived KPIs
    case when lower(r.fraud_result) = 'clear' then 1 else 0 end as is_clear,
    case when lower(r.fraud_result) = 'suspected' then 1 else 0 end as is_suspected
    from reports r
        left join clients c 
            using (client_id)