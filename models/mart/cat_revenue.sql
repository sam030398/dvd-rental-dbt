SELECT category_name , category_id, 
SUM(amount) as revenue , 
COUNT (DISTINCT(rdeno.rental_id)) as orders_count,
DATE_DIFF (current_date,max(rental_date), day) as recency,
COUNT(DISTINCT (case when return_status = 'Late Return' THEN rdeno.rental_id END)) as late_return_count,
min (amount) as min_payment,
max(amount) as max_payment,
avg(amount) as avg_payment
FROM  {{ ref('rentals_denormalized') }} rdeno , unnest (payments) as py
GROUP BY 1,2
ORDER BY 3 DESC