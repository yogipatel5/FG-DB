# SELECT sum(mc_gross), sum(cost_of_goods_sold) FROM orders
SELECT sum(cost_of_goods_sold), sum(mc_gross) from (
                                                   SELECT
	                                                   txn_id
                                                     , created_at
                                                     , cost_of_goods_sold
                                                     , purchased_at
                                                     , mc_gross
                                                   FROM orders
                                                   WHERE orders.store_id = 7
	                                                 AND orders.created_at >= '2022-09-01'
	                                                 AND orders.created_at < '2022-10-01'
group by txn_id
                                                   ) as a

;
select * from stores) as a
         
         ;
SELECT  txn_id FROM orders
    where txn_id in
('113-4461332-7145063
')
;
SELECT * FROM ipn_orders where txn_id = '113-3021832-1503443'