-- Lynch, Connor
-- ISTE230, Fall 2024

-- Q1
SELECT now();

-- Q2
SELECT headOfState
	FROM country
	WHERE code = 'USA';
	
-- Q3
UPDATE country
	SET headOfState = 'Joseph R. Biden Jr.'
	WHERE code = 'USA';

SELECT headOfState
	FROM country
	WHERE code = 'USA';
	
-- Q4
SELECT name
	FROM country
	WHERE indepYear IS NULL;
	
-- Q5
SELECT name, continent
	FROM country
	WHERE population > 1000000000
	AND lifeExpectancy >= 70
	AND lifeExpectancy <= 80;
	
-- Q6
SELECT name
	FROM country
	WHERE continent = 'North America'
	OR continent = 'South America';
	
-- Q7
SELECT name, lifeExpectancy
	FROM country
	WHERE lifeExpectancy < 46
	ORDER BY lifeExpectancy DESC;