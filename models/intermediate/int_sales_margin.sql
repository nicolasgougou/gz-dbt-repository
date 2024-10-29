select
*
,ROUND(quantity * purchase_price) AS purchase_cost
,ROUND(revenue - (quantity * purchase_price)) AS margin
FROM {{ ref('stg_raw__product') }}
INNER JOIN {{ ref('stg_raw__sales') }}
USING (products_id)