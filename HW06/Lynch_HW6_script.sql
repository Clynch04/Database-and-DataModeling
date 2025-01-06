-- Lynch, Connor
-- ISTE230, Fall 2024
-- HW06

-- #1
SELECT NOW();

-- #2
SELECT title, catdescription 
FROM Book JOIN Category ON Book.category = Category.catID
ORDER BY catdescription DESC, title;

-- #3
SELECT name, title, rating FROM Book
JOIN BookReview USING (ISBN) JOIN Reviewer USING (ReviewerID)
WHERE EmployedBy IS NULL;

-- #4
SELECT title, lastname, firstname FROM Book
JOIN BookAuthor USING (ISBN) JOIN Author USING (AuthorID)
ORDER BY title, lastname;

-- #5
SELECT title, lastname, firstname, price FROM Book
JOIN BookAuthor USING (ISBN) JOIN Author USING (AuthorID)
JOIN OwnersBook USING (ISBN)
WHERE price <= 50
ORDER BY price DESC, title;

-- #6
SELECT title, name FROM Book
LEFT OUTER JOIN BookReview USING (ISBN)
LEFT OUTER JOIN Reviewer USING (ReviewerID);

-- #7
SELECT ISBN, title FROM Book
JOIN Category ON Book.category = Category.catID
WHERE catdescription LIKE 's%';

-- #8
SELECT OwnerID AS "Owner's ID", title AS "Book Title", CONCAT (LastName, ", ", FirstName) AS "Owner"
FROM Book JOIN OwnersBook USING (ISBN) JOIN Owner USING (OwnerID)
ORDER BY OwnerID DESC;