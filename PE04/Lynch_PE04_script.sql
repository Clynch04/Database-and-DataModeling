-- Lynch, Connor
-- ISTE230, Fall 2024
-- PE04

-- Q1
SELECT title AS Title_of_Film, length AS Length_of_Film, LEFT(description,40)
	FROM film
	WHERE description LIKE '%fun%'
	AND length <= 100
	AND length >= 50
	ORDER BY length DESC;
	
-- Q2
SELECT title AS Title_of_Film, length AS Length_of_Film, RIGHT(description,60)
	FROM film
	WHERE description LIKE '%Database%'
	OR description LIKE '%California%';
	
-- Q3
SELECT title AS Title_of_Film, length AS Length_of_Film, rating
	FROM film
	WHERE rating = 'G'
	AND length <= 140
	AND length >= 120;
	
-- Q4
SELECT title AS Title_of_Film, length AS Length_of_Film, rating
	FROM film
	WHERE title LIKE '%river%'
	AND (rating = 'PG-13' OR rating = 'R');
	
-- Q5
SELECT title AS Title_of_Film, length AS Length_of_Film, release_year, rating
	FROM film
	WHERE release_year = '2006'
	AND (rating = 'PG-13' OR rating = 'R')
	AND length < 55;
	
-- Q6
SELECT title AS Title_of_Film, replacement_cost AS Replacement_Cost, rating AS Film_Rating
	FROM film
	WHERE title NOT LIKE '_a%'
	AND replacement_cost = 18.99
	ORDER BY title DESC;
	
-- Q7
SELECT title AS Title_of_Film, LEFT(description, 55)
	FROM film
	WHERE description LIKE '%Frisbee%'
	AND description LIKE '%Fanciful%';
	
-- Q8
SELECT title AS Title_of_Film, rating, release_year, length
	FROM film
	WHERE (rating = 'PG-13' AND release_year = '2006' AND length < 60)
	OR (rating = 'R' AND length < 55)
	ORDER BY rating DESC;
	
-- Q9
SELECT title AS Title_of_Film, length AS Length_Of_Film
	FROM film
	WHERE (title LIKE 'a%' OR title LIKE 'h%' OR title LIKE 'j%')
	AND length < 70
	ORDER BY title ASC;
	
-- Q10
SELECT now() AS today_unformatted, DATE_FORMAT(curdate(), '%d-%b-%Y') AS today_formatted;

-- Q11
SELECT film_id, release_year, length, rating, rental_rate, rental_duration, LEFT(title, 33)
	FROM film
	WHERE release_year > '2005'
	AND length < 100
	AND rating = 'PG'
	AND rental_rate >= 2
	AND rental_duration >= 6
	AND title NOT LIKE 'w%'
	AND title NOT LIKE 't%'
	ORDER BY title DESC;