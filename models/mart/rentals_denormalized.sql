SELECT
    rental_id,
    inventory_id,
    rental_date,
    fr.customer_id,
    return_date,
    fr.staff_id,
    fr.film_id,
    fr.store_id,
    customer_address_id,
    customer_store_id,
    customer_first_name,
    customer_last_name,
    customer_email,
    customer_create_date,
    customer_address,
    customer_address2,
    customer_district,
    customer_city,
    customer_country,
    customer_postal_code,
    customer_phone,
    manager_staff_id,
    store_address_id,
    store_address,
    store_address2,
    store_district,
    store_city,
    store_country,
    store_postal_code,
    staff_first_name,
    staff_last_name,
    staff_address_id,
    staff_email,
    staff_active,
    staff_username,
    staff_address,
    staff_district,
    staff_city,
    staff_country,
    staff_phone,
    language_id,
    category_id,
    film_title,
    release_year,
    rating,
    category_name,
    language_name,
    rental_duration,
    rental_rate,
    replacement_cost,
    payments,
    actors,
    CASE WHEN date_diff(return_date, rental_date, day) <= rental_duration THEN 'On Time Return'
    ELSE 'Late Return' 
    END AS return_status
FROM
  {{ ref('fct_rentals') }} fr
LEFT JOIN
  {{ ref('dim_customers') }} dc
ON
  fr.customer_id = dc.customer_id
LEFT JOIN
  {{ ref('dim_stores') }} ds
ON
  ds.store_id = fr.store_id
LEFT JOIN
  {{ ref('dim_films') }} df
ON
  df.film_id = fr.film_id