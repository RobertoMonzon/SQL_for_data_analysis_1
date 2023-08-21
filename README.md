1.- SELECT & FROM
"I'm going to send an email letting our customers now there has been a management change.Could you pull a list of the **first name**,**last name** and **email** of each of our customers?"
Result:
 
Answer:
USE mavenmovies;
SELECT first_name,last_name,email FROM customer;

2.-SELECT DISTINCT
“My understanding is that we have titles that we rent for duration of 3,5 or 7 days. Could you pull the record of our films and see if there are any other rental durations?”
Result:
 
Answer:
SELECT DISTINCT(rental_duration) FROM film;

3.-WHERE
“I’d like to look at payment records for our long-term customers to learn about their purchase patterns. Could you pull all payments from our first 100 customers(based on customer ID)”
Result:
 
Answer:
SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE customer_id < 100;

4.-WHERE & AND
“The payment data you gave me on our first 100 customers was great – thank you!. Now I’d love to see just payments over $ for those same customers,since January 1st, 2006.”
Result:
 
Answer:
SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE customer_id < 100 AND amount > 5 AND payment_date > 20060101;
5.-WHERE & OR
“The data you shared previously on customers 42,53,60 and 75 was good to see. Now could you please write a query to pull all payments from those specific customers along with payments over $5, from any customer?”
Result:
 
Answer:
SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE  customer_id = 42 AND customer_id =53 AND customer_id =60 AND customer_id =75 OR amount > 5;
6.-IN
“The data you shared previously on customers 42,53,60 and 75 was good to see. Now could you please write a query to pull all payments from those specific customers along with payments over $5, from any customer?”
Result:
 

Answer:
SELECT customer_id,rental_id, amount, payment_date FROM payment
WHERE  customer_id in(42,53,60,75) OR amount > 5;

7.- LIKE
“We need to understand the special features in our films. Could you pull a list of films wich include a **behind the scenes** special features ”
Result:
 
Answer:
SELECT title, special_features FROM film
WHERE special_features LIKE '%Behind the Scenes%';

8.-COUNT
“Please count the total of films”
Result:
 
Answer:
SELECT  COUNT(title) FROM film;



7.-GROUP BY
“I need to get a quick overview of how long our movies tend to be rented out for. Could you please pull a**count of tittle** sliced by** rental duration**”
Result:
 
Answer:
SELECT rental_duration, COUNT(title)  FROM film
GROUP BY rental_duration;

8.-AS
“I need to get a quick overview of how long our movies tend to be rented out for. Could you please pull a**count of tittle** sliced by** rental duration**”
Result:
 
Answer:
SELECT rental_duration, COUNT(title)  AS films_with_this_rental_duration  FROM film
GROUP BY rental_duration;


9.- Aggregate functions
“I’m wondering if we charge more for a rental when the replacement cost is higher. Can you help me pull a *count of films*, along with the *average*, *min* and *max rental rate* grouped by replacement cost?”
Result:
 
Answer:
SELECT replacement_cost, COUNT(film_id) AS number_of_films, MIN(rental_rate) AS cheapest_rent, MAX(rental_rate) AS most_expensive_rent, AVG(rental_rate) AS average_rental FROM film
GROUP BY replacement_cost;
10.-HAVING
“I’d like to talk to customers that have not rented much form us to understand if there is something we could be doing better. Could you pull of customers_ids with less than 15 rentals all time”
Result:
 
Answer:
SELECT customer_id,Count(rental_id) AS total_rentals FROM rental
GROUP BY customer_id HAVING total_rentals <15;
11.-ORDER BY
“I’d like to see if out longest films also tend to be our most expensive rentals. Could you pull me a list of all film tittles along with their lengths and rental rates, and sort them from longest to shortest”
Result:
 
Answer:
SELECT title,length, rental_rate FROM film
 ORDER BY length DESC;
12.CASE
“I’d like to know which store each customer goes to, and whether or not they are active. Could you pull a list of first and last name of all customers, and label them as either ‘Store 1 active’, ‘Store 1 inactive’, ‘store 2 active ’ or ‘store 2 inactive’”?
Result:
 
Answer:
SELECT first_name,last_name,
CASE
	WHEN store_id =1 AND active = 1 THEN 'store 1 active'
   	 WHEN store_id =1 AND active = 0 THEN 'store 1 active'
	WHEN store_id =2 AND active = 1 THEN 'store 2 active'
  	  WHEN store_id =2 AND active = 0 THEN 'store 2 active'
ELSE 'Review the logic'
END AS store_and_status
FROM customer;

13.COUNT & CASE
“I’m curious how many inactive customers we have at each store. Could you please create a table to count the number of customers broken down by store_id(in rows) and active status(in columns)”?
Result:
 
Answer:
SELECT store_id,
COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active,
COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS innactive
FROM customer
GROUP BY store_id;
