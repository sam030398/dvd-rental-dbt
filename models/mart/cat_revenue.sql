SELECT category_name , category_id, 
SUM(amount) as revenue , 
COUNT (DISTINCT(rdeno.rental_id)) as orders_count,
DATE_DIFF (current_date,max(rental_date), day) as recency,
COUNT (rdeno.return_status)
FROM  {{ ref('rentals_denormalized') }} rdeno , unnest (payments) as py
GROUP BY 1,2
ORDER BY 3 DESC