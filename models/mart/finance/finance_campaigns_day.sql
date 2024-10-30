SELECT
date_date
,ROUND(SUM (total_operational_margin-ads_cost),2) AS ads_margin
,ROUND(SUM (average_basket),2) as average_basket
,ROUND(SUM (total_operational_margin),2) as operational_margin
,ROUND(SUM (ads_cost),2) as ads_cost
,ROUND(SUM (ads_impressions),2) as ads_impressions
,ROUND(SUM (ads_clicks),2) ads_clicks
,SUM (total_quantity_products_sold) as quantity_products_sold
,ROUND(SUM (total_revenue),2) as revenue
,ROUND(SUM (total_purchase_cost ),2) as purchase_cost
,ROUND(SUM (margin),2) as margin
,ROUND(SUM (total_shipping_fee),2) as shipping_fees
,ROUND(SUM (total_logcost),2) as logcosts
,ROUND(SUM (ship_cost),2) as ship_costs
FROM {{ ref('finance_days') }} AS finance
LEFT JOIN {{ ref('int_campaigns_day') }} AS campaings
USING (date_date)
GROUP BY date_date
ORDER BY date_date DESC