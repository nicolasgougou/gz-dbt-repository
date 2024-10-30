SELECT 
date_date
,ROUND(SUM (ads_cost),2) as ads_cost
,SUM (impression) AS ads_impressions
,SUM (click) AS ads_clicks
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC