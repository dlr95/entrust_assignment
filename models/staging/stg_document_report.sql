-- models/staging/stg_document_report.sql
{{ config(materialized='view') }}

with src as (
  select * from {{ source('raw','document_report') }}
)
select
  cast(`Report ID` as string)                       as report_id,
  cast(`Client ID` as string)                       as client_id,
  lower(trim(`Fraud Result`))                       as fraud_result,           -- 'clear', 'suspected', etc.
  trim(`Document Type`)                             as document_type,
  trim(`Issuing country`)                           as issuing_country,
  cast(`Report Completed Date` as date)             as report_completed_date,
  safe_cast(report_turn_around_time_secs as int64)  as report_tat_secs
  from src