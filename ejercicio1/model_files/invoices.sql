select
    p."ProductName" as product,
    p."Price" as price,
    s."InvoiceNumber"
from {{ ref('products') }} p
left join {{ ref('sales') }} s
on p.ProductID=s.ProductID