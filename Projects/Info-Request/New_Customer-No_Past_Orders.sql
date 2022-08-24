# New customers only - no past customers, remove any parent order_id for duplicates and orders created_at less than current order.

SELECT count(distinct customer_id), month, year

FROM (SELECT orders.id                as order_id
           , orders.customer_id       as customer_id
           , count(*)                 as Total_Orders
           , month(orders.created_at) as Month
           , year(orders.created_at)  as Year
           , orders.created_at
           , past_orders.id

      FROM orders

               LEFT JOIN orders past_orders
                             on past_orders.customer_id = orders.customer_id and
                                past_orders.created_at < orders.created_at and
                                past_orders.parent_order_id = 0
      WHERE
#            year(orders.created_at) <= 2023 and
          orders.parent_order_id = 0
#            and orders.customer_id is not null and customers.id in (426, 159)
        AND past_orders.id is null
      group by
          orders.id,
          month(orders.created_at),
          year(orders.created_at)
     ) as data

group by
    Month,
    Year
