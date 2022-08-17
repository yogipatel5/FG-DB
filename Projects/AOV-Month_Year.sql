# Average Order Value
SELECT
    avg(orders.mc_gross) as Orders_AOV,
    month(orders.created_at) as month ,
    year(orders.created_at) as year
FROM orders
WHERE orders.fulfillment_status_id = 5
group by month(orders.created_at), year(orders.created_at)
