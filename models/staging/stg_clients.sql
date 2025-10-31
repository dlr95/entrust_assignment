{{ config(materialized='view') }}

select
    cast(`Client Id` as string) as client_id,
    `Industry`                  as industry,
    `Country`                   as client_country
    from {{ source('raw', 'clients') }}