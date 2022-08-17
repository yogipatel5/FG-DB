# Number of Unique Countries Shipped to
SELECT
    count(*) as Total_shipped,
    countries.name,
    countries.continent_name,
    year(orders.ordered_at) as Year,
    month(orders.ordered_at) as Month
FROM orders

JOIN shipments on shipments.order_id = orders.id
JOIN countries ON countries.code = shipments.to_address_country_code

where orders.merchant_id = 2

group by  month(orders.ordered_at),year(orders.ordered_at), countries.id