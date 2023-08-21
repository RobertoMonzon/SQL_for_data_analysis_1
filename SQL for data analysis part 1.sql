USE mavenmovies;
SELECT first_name,last_name,email FROM customer;

SELECT DISTINCT(rental_duration) FROM film;

SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE customer_id < 100;

SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE customer_id < 100 AND amount > 5 AND payment_date > 20060101;

SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE  customer_id = 42 AND customer_id =53 AND customer_id =60 AND customer_id =75 OR amount > 5;

SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE  customer_id in(42,53,60,75) OR amount > 5;

SELECT title, special_features FROM film
WHERE special_features LIKE '%Behind the Scenes%';

SELECT  COUNT(title) FROM film;

SELECT rental_duration, COUNT(title)  FROM film
GROUP BY rental_duration;

SELECT rental_duration, COUNT(title)  AS films_with_this_rental_duration  FROM film
GROUP BY rental_duration;

SELECT replacement_cost, COUNT(film_id) AS number_of_films, MIN(rental_rate) AS cheapest_rent, MAX(rental_rate) AS most_expensive_rent, AVG(rental_rate) AS average_rental FROM film
GROUP BY replacement_cost;

SELECT customer_id,Count(rental_id) AS total_rentals FROM rental
GROUP BY customer_id HAVING total_rentals <15;

SELECT title,length, rental_rate FROM film
 ORDER BY length DESC;

SELECT first_name,last_name,
CASE
	WHEN store_id =1 AND active = 1 THEN 'store 1 active'
    WHEN store_id =1 AND active = 0 THEN 'store 1 active'
	WHEN store_id =2 AND active = 1 THEN 'store 2 active'
    WHEN store_id =2 AND active = 0 THEN 'store 2 active'
    ELSE 'Review the logic'
END AS store_and_status
FROM customer;

SELECT store_id,
	COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active,
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS innactive
FROM customer
GROUP BY store_id;


