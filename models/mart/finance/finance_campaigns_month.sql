SELECT
FORMAT_DATE('%Y-%m', date_date) AS date_month
,ROUND(SUM (ads_margin),2) AS ads_margin
,ROUND(SUM (average_basket),2) as average_basket
,ROUND(SUM (operational_margin),2) as operational_margin
,ROUND(SUM (ads_cost),2) as ads_cost
,ROUND(SUM (ads_impressions),2) as ads_impressions
,ROUND(SUM (ads_clicks),2) ads_clicks
,SUM (quantity_products_sold) as quantity_products_sold
,ROUND(SUM (revenue),2) as revenue
,ROUND(SUM (purchase_cost),2) as purchase_cost
,ROUND(SUM (margin),2) as margin
,ROUND(SUM (shipping_fees),2) as shipping_fees
,ROUND(SUM (logcosts),2) as logcosts
,ROUND(SUM (ship_costs),2) as ship_costs
FROM {{ ref('finance_campaigns_day') }}
GROUP BY date_month
ORDER BY date_month DESC