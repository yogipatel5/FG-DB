#Number of Orders Shipped
SELECT
	COUNT( DISTINCT customer_id )
  , year
  , month
FROM (
     SELECT
         #     customers.first_order_id
         customer_id
       , COUNT( DISTINCT orders.customer_id ) AS total_customers
       , MONTH( orders.created_at )           AS month
       , YEAR( orders.created_at )            AS year
     FROM orders
     WHERE orders.fulfillment_status_id = 5
     GROUP BY MONTH( orders.created_at ), YEAR( orders.created_at ), orders.customer_id
     ) o
GROUP BY year, month