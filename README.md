### dbt lineage

### Sources
The three CSVs were uploaded to BigQuery

### Staging
Cleaning and casting each of the three CSVs.

### Intermediate
Documents are joined to client info and an aggregation of tasks (sum of tasks per type, sum of tasks per agent seniority, etc.) is grouped per report ID. This results in int_document_reports_with_tasks
We also have an intermediate model at the task level. int_tasks_detailed

### Reporting
The rpt models that are selected in the Looker Studio dashboard.

### Dashboard
[Looker Studio dashboard](https://lookerstudio.google.com/reporting/7bd1a6d2-6007-458f-92ea-2c0912c47a57)
Contains some additional calculated fields, such as calculating turnaround times in minutes and seconds.
