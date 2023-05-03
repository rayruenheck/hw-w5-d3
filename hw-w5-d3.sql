--1. List all customers who live in Texas (use
--JOINs)

SELECT first_name, last_name, district
FROM address as a
JOIN customer as cu
ON a.address_id = cu.address_id
WHERE district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full
--Name

SELECT concat(first_name, ' ', last_name) AS full_name, amount
FROM payment AS p
JOIN customer AS cu
ON p.customer_id = cu.customer_id
WHERE amount > 6.99

--3. Show all customers names who have made payments over $175(use
--subqueries)

select customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) > 175

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	select customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175

)

--4. List all customers that live in Nepal (use the city
--table)

SELECT first_name, last_name, country
FROM country AS co
JOIN city AS c
ON co.country_id = c.country_id
JOIN address AS a
ON c.city_id = a.city_id
JOIN customer AS cu
ON a.address_id = cu.address_id
WHERE country = 'Nepal'

--5. Which staff member had the most
--transactions?

SELECT first_name, last_name, count(amount)
FROM payment AS p
JOIN staff AS s
ON p.staff_id = s.staff_id
GROUP BY first_name, last_name

-- answer jon stephens

--6. How many movies of each rating are
--there?

SELECT rating, count(rating)
FROM film
GROUP BY rating

--7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT amount
FROM payment
WHERE amount > 6.99

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
)

--8. How many free rentals did our store give away

SELECT count(amount)
FROM payment
WHERE amount = 0
