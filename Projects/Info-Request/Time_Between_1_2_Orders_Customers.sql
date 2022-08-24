# Time between first and second order - Average Time Between Purcahse 1st and 2nd
#
SELECT
    count(*),
    avg(day_in_between),
    month,
    year

FROM (
SELECT customers.first_order_id                                  as customer_first_order_id
           , customers.id                                              as customer_id
           , first_order_id                                            as first_order_id
           , second_order.id                                           as second_order_id
           , datediff(second_order.created_at, first_order.created_at) as day_in_between
           , month(second_order.created_at)                            as Month
           , year(second_order.created_at)                             as Year

#      , month(first_order.created_at)  as Month
#      , year(first_order.created_at)   as Year

      FROM customers

               LEFT JOIN orders as first_order
                        on customers.first_order_id = first_order.customer_id and first_order.parent_order_id = 0
               LEFT JOIN orders second_order
                        on second_order.customer_id = customers.id and
                           second_order.created_at - interval 1 day > first_order.created_at and
                           second_order.parent_order_id = 0
      WHERE
#            year(orders.created_at) <= 2023 and
          customers.first_order_id is not null
        and second_order.customer_id is not null
#   and customers.id in (426, 159)

      group by
          customers.id
     ) as data

group by
    Month,
    Year
