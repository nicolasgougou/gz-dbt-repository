select
int_orders_operational.date_date 
,COUNT (raw_ship.orders_id) AS nb_transactions
,ROUND(SUM (revenue)) AS total_revenue
,ROUND(SUM(revenue) / COUNT(orders_id)) AS average_basket
,ROUND(SUM (margin)) AS margin
,ROUND(SUM (operational_margin)) AS total_operational_margin
,ROUND(SUM (purchase_cost)) AS total_purchase_cost 
,ROUND(SUM (shipping_fee)) AS total_shipping_fee
,ROUND(SUM (raw_ship.logcost)) AS total_logcost
,SUM (quantity) AS total_quantity_products_sold
FROM {{ ref('int_orders_operational') }} AS int_orders_operational
LEFT JOIN {{ ref('int_sales_margin') }}
USING (orders_id)
LEFT JOIN {{ ref('stg_raw__ship') }} AS raw_ship
USING (orders_id)
GROUP BY date_date
ORDER BY date_date DESC