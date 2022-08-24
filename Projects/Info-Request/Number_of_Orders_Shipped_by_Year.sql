#Number of Orders Shipped
SELECT
    #     customers.first_order_id
    COUNT( DISTINCT orders.id ) AS total_customers
  , MONTH( orders.created_at )  AS month
  , YEAR( orders.created_at )   AS year
FROM orders
WHERE orders.fulfillment_status_id = 5
GROUP BY MONTH( orders.created_at ), YEAR( orders.created_at )
