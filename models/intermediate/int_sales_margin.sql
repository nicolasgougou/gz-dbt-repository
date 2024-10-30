select
*
,ROUND(quantity * purchase_price) AS purchase_cost
,ROUND(revenue - (quantity * purchase_price)) AS margin
,{{ margin_percent('revenue', 'quantity * CAST(purchase_price AS FLOAT64)') }} as margin_percent
FROM {{ ref('stg_raw__product') }}
INNER JOIN {{ ref('stg_raw__sales') }}
USING (products_id)