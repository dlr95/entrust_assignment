-- rpt_document_reports_with_tasks.sql

select * from {{ ref ('int_document_reports_with_tasks') }}
