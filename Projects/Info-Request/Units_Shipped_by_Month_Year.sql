# Number of Units Sold
SELECT
	ecomm                         AS channel
  , SUM( total_quantity_shipped ) AS total_units_shipped
  , year
  , month
FROM (
     SELECT
	     SUM( order_items.quantity ) AS total_quantity_shipped
       , orders.ordered_at           AS ordered_at
       , MONTH( ordered_at )         AS month
       , YEAR( ordered_at )          AS year
     FROM orders
	     LEFT JOIN order_items
	               ON order_items.order_id = orders.id
	     JOIN      shipments
	               ON shipments.order_id = orders.id
     WHERE orders.merchant_id = 2
     GROUP BY orders.id
     ) a
GROUP BY year, month