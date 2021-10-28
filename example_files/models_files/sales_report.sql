select
    s."id" as sale_id,
    p."id" as client_id,
    p."name" as client_name,
    cc."country_name" as client_country,
    s."date_s" as date,
    pr."price" as total,
    current_timestamp(0) as updated_at
from {{ ref('sales') }} s
left join {{ ref('person') }} p
on p.id=s.client_id
left join {{ ref('country_codes') }} cc
on cc.country_code=p.country_code
left join {{ ref('products') }} pr
on pr.product_id=s.product_id