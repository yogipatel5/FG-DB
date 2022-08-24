SELECT
	COUNT( * )
  , AVG( orders.mc_gross ) AS aov
  , MIN( orders.purchased_at )
  , MAX( orders.purchased_at )

FROM orders
	
	JOIN addresses
	     ON addresses.id = orders.address_id AND addresses.address_country_code = 'US'

WHERE orders.store_id = 10
  AND orders.purchased_at >= '2022-07-25'
  AND orders.purchased_at < '2022-08-01'
  AND orders.agent_id = 0
GROUP BY orders.id