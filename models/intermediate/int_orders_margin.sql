select
orders_id
,date_date
,ROUND(SUM(revenue)) AS revenue
,SUM(quantity) AS quantity
,ROUND(SUM(purchase_cost)) AS purchase_cost
,ROUND(SUM(margin)) AS margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date
ORDER BY orders_id DESC