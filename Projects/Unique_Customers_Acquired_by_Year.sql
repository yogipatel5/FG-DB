#Number of Orders Shipped
SELECT
#     customers.first_order_id
    count(DISTINCT orders.id) as Total_Customers,
    month(orders.created_at) as month ,
    year(orders.created_at) as year
FROM orders
WHERE orders.fulfillment_status_id = 5
group by month(orders.created_at), year(orders.created_at)
