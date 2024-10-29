select
orders_id
,date_date
,ROUND(SUM((margin + shipping_fee) - (logcost + ship_cost)),2) AS operational_margin
,sum(logcost) AS logcost
,sum(ship_cost) AS ship_cost
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ ref('stg_raw__ship') }}
USING (orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC