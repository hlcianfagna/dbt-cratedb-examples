
select
    p."id" as id,
    p."name" as name,
    date_format('%Y-%m-%d',p."birth") as birth,
    cc."country_name" as country,
    current_timestamp(0) as updated_at
from {{ ref('person') }} p
left join {{ ref('country_codes') }} cc
on cc.country_code=p.country_code