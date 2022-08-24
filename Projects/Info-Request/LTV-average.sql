# Life Time Value - How much has a customer spent on average by month, year
select count(*) as total_customers
     , round(avg(LTV_AVG),2) as LTV_Average_By_Month,
       Month,
       Year
FROM (
SELECT
        customer_id
     , max(life_time_value_avg)/  max(total_orders) as LT_AOV
     , max(life_time_value_avg) LTV_AVG
     , month
     , year
FROM (SELECT orders.id                                      as order_id
           , customers.id                                   as customer_id
           , count(*)                                       as Total_Orders
           , month(orders.created_at)                       as Month
           , year(orders.created_at)                        as Year
           , orders.mc_gross
           , sum(past_orders.mc_gross)                      as life_time_value_avg
           , orders.created_at
#            , round(sum(past_orders.mc_gross) / count(*), 2) as Average_Order_Value_Lifetime_By_Customer
           , past_orders.id

      FROM orders

               LEFT JOIN customers
                             on customers.id = orders.customer_id
               LEFT JOIN orders past_orders
                             on past_orders.customer_id = orders.customer_id and
                                past_orders.created_at <= orders.created_at and
                                past_orders.parent_order_id = 0
      WHERE
#            year(orders.created_at) <= 2023 and
          orders.parent_order_id = 0
        and orders.customer_id is not null
#         and customers.id in (159,426)

      group by
          orders.id,
          month(orders.created_at),
          year(orders.created_at)

     ) as data

group by
    customer_id,
    Month,
    Year) as customer_data

group by
    Month,
    Year