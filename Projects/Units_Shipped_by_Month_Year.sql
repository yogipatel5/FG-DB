# Number of Units Sold
select
    "Ecomm" as Channel,
    sum(total_quantity_shipped) as total_Units_Shipped,
    year, month
from ( SELECT
           sum(order_items.quantity) as total_quantity_shipped
         , orders.ordered_at as ordered_at
         , month(ordered_at) as Month
         , year(ordered_at) as Year
       FROM orders
       LEFT JOIN order_items ON order_items.order_id = orders.id
       join      shipments on shipments.order_id = orders.id
       where
           orders.merchant_id = 2
       group by
           orders.id
) a
group by year, month