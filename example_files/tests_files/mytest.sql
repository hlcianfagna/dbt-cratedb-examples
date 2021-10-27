select *
from (
    select
        price
    from dbt_dev.products
    where price <=0
    group by price
    having count(*) >= 1
) validation_errors