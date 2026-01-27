{{ config(
    materialized='table',
    schema='sources'
) }}

select
    packageId,
    facilityId,
    lastEvent,
    clientId,
    height,
    length,
    width,
    weight,
    orderId,
    scheduledServiceDate,
    slaServiceDate,
    expiresAt,
    perishable
from {{ ref('packages') }}
