-- Lynch, Connor
-- ISTE 230, Fall 2024
-- HW08

-- #1
SELECT now();

-- #2
SELECT CONCAT(City, ', ', StateCode) AS Location, COUNT(*) AS Count
FROM Publisher
GROUP BY City, StateCode
ORDER BY Count;

-- #3
SELECT Title, COUNT(Rating) AS Total_Ratings, MIN(Rating) AS Low, MAX(Rating) as High, ROUND(AVG(Rating), 2) AS Average
FROM Book LEFT JOIN BookReview USING (ISBN)
GROUP BY ISBN
ORDER BY Total_Ratings DESC, Average DESC;

-- #4
SELECT Name AS 'Publisher Name', COUNT(ISBN) AS Book_Count
FROM Publisher JOIN Book USING (PublisherID)
GROUP BY Name
HAVING Book_Count > 2
ORDER BY Book_Count DESC, Name;

-- #5
SELECT Title, LENGTH(Title) AS Length, SUBSTR(Title, (INSTR(LOWER(Title), 'bill') + 4)) AS After_Bill
FROM Book
WHERE LOWER(Title) LIKE '%bill%';

-- #6
SELECT DISTINCT Title AS 'Book Title' FROM OwnersBook
LEFT JOIN Book USING (ISBN)
ORDER BY title DESC;

-- #7
SELECT OwnerID AS "Owner's ID", CONCAT(LastName, ", ", FirstName) AS "Owner's Name", MAX(Price), MIN(Price)
FROM Owner JOIN OwnersBook USING (OwnerID)
GROUP BY OwnerID
ORDER BY OwnerID DESC;

-- #8
SELECT BookCondition.Description AS 'Book Condition', Title AS 'Book Title', Price, LEFT(EvaluatorsName, 15)
FROM Book JOIN OwnersBook USING (ISBN)
JOIN ConditionEvaluator USING (Evaluator)
JOIN BookCondition USING (Ranks)
ORDER BY BookCondition.Description, Title;