mysql> SOURCE C:\ISTE230\HW\HW06\Lynch_HW6_script.sql
--------------
-- Lynch, Connor
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
-- ISTE230, Fall 2024
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
-- HW06
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
-- #1
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT NOW()
--------------

+---------------------+
| NOW()               |
+---------------------+
| 2024-10-28 11:48:27 |
+---------------------+
1 row in set (0.00 sec)

--------------
-- #2
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT title, catdescription 
FROM Book JOIN Category ON Book.category = Category.catID
ORDER BY catdescription DESC, title
--------------

+--------------------------------------------------+-----------------+
| title                                            | catdescription  |
+--------------------------------------------------+-----------------+
| The Shortest Book in the World                   | Sports          |
| Yes! Networking is for Bills Fans                | Sports          |
| Calculus for Phys Ed Majors                      | Science         |
| I Lasted my Love's Last Lingering Longing        | Romance         |
| My Lost Love's Long Last Lingering               | Romance         |
| My Love's at Long Last Lost his Lingering        | Romance         |
| My Love's Last Lingering Lost                    | Romance         |
| My Love's Last Longing                           | Romance         |
| Women are From Venus ORACLE is from Beyond Pluto | Romance         |
| A language without Pointers? Priceless.          | Programming     |
| How to add Class to your Programming             | Programming     |
| JAVA: It's more than Just a Programming Language | Programming     |
| How to Keep your Cable Bill Down                 | Networking      |
| How to Keep your Cellular Bill Down              | Networking      |
| Tired of wired? Infrared instead!                | Networking      |
| The Science of Literature Searching              | Library Science |
| From Brockport to IT                             | Geography       |
| From Deep in the Heart of Texas to IT            | Geography       |
| From the Shores of Lake Erie to IT               | Geography       |
| ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR  | Database        |
| Master C++ Through The Classic Comics            | Comics          |
| Master HTML Through The Classic Comics           | Comics          |
| Master Wireless Through The Classic Comics       | Comics          |
+--------------------------------------------------+-----------------+
23 rows in set (0.00 sec)

--------------
-- #3
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT name, title, rating FROM Book
JOIN BookReview USING (ISBN) JOIN Reviewer USING (ReviewerID)
WHERE EmployedBy IS NULL
--------------

+-------+---------------------------------------+--------+
| name  | title                                 | rating |
+-------+---------------------------------------+--------+
| Leone | How to Keep your Cellular Bill Down   |      7 |
| Leone | How to Keep your Cable Bill Down      |      7 |
| Leone | From Deep in the Heart of Texas to IT |      6 |
+-------+---------------------------------------+--------+
3 rows in set (0.00 sec)

--------------
-- #4
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT title, lastname, firstname FROM Book
JOIN BookAuthor USING (ISBN) JOIN Author USING (AuthorID)
ORDER BY title, lastname
--------------

+--------------------------------------------------+------------+-----------+
| title                                            | lastname   | firstname |
+--------------------------------------------------+------------+-----------+
| A language without Pointers? Priceless.          | Axelrod    | Mike      |
| A language without Pointers? Priceless.          | Bierre     | Kevin     |
| Calculus for Phys Ed Majors                      | Garrison   | Dan       |
| Calculus for Phys Ed Majors                      | Hartpence  | Bruce     |
| Calculus for Phys Ed Majors                      | Troell     | Luther    |
| ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR  | Stratton   | Bill      |
| From Brockport to IT                             | Johnson    | Daryl     |
| From Deep in the Heart of Texas to IT            | Troell     | Luther    |
| From the Shores of Lake Erie to IT               | Stratton   | Bill      |
| How to add Class to your Programming             | Kang       | Jai       |
| How to add Class to your Programming             | Niemi      | Rayno     |
| How to Keep your Cable Bill Down                 | Hartpence  | Bruce     |
| How to Keep your Cellular Bill Down              | Hartpence  | Bruce     |
| I Lasted my Love's Last Lingering Longing        | Heartthrob | Danielle  |
| JAVA: It's more than Just a Programming Language | Sonstein   | Jeff      |
| Master C++ Through The Classic Comics            | Machogeek  | Hero      |
| Master C++ Through The Classic Comics            | Webguy     | Smerdley  |
| Master HTML Through The Classic Comics           | Machogeek  | Hero      |
| Master HTML Through The Classic Comics           | Webguy     | Smerdley  |
| Master Wireless Through The Classic Comics       | Hartpence  | Bruce     |
| My Lost Love's Long Last Lingering               | Heartthrob | Danielle  |
| My Love's at Long Last Lost his Lingering        | Heartthrob | Danielle  |
| My Love's Last Lingering Lost                    | Heartthrob | Danielle  |
| My Love's Last Longing                           | Heartthrob | Danielle  |
| The Science of Literature Searching              | Henderson  | Tona      |
| The Science of Literature Searching              | Lawley     | Elizabeth |
| The Shortest Book in the World                   | Phelps     | Andrew    |
| Tired of wired? Infrared instead!                | Hartpence  | Bruce     |
| Women are From Venus ORACLE is from Beyond Pluto | Weeden     | Elissa    |
| Yes! Networking is for Bills Fans                | Leone      | James     |
| Yes! Networking is for Bills Fans                | Lutz       | Peter     |
| Yes! Networking is for Bills Fans                | Phelps     | Andrew    |
+--------------------------------------------------+------------+-----------+
32 rows in set (0.00 sec)

--------------
-- #5
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT title, lastname, firstname, price FROM Book
JOIN BookAuthor USING (ISBN) JOIN Author USING (AuthorID)
JOIN OwnersBook USING (ISBN)
WHERE price <= 50
ORDER BY price DESC, title
--------------

+-------------------------------------------------+------------+-----------+-------+
| title                                           | lastname   | firstname | price |
+-------------------------------------------------+------------+-----------+-------+
| ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR | Stratton   | Bill      | 50.00 |
| My Love's Last Longing                          | Heartthrob | Danielle  | 50.00 |
| How to Keep your Cable Bill Down                | Hartpence  | Bruce     | 45.00 |
| Yes! Networking is for Bills Fans               | Lutz       | Peter     | 40.00 |
| Yes! Networking is for Bills Fans               | Leone      | James     | 40.00 |
| Yes! Networking is for Bills Fans               | Phelps     | Andrew    | 40.00 |
| The Shortest Book in the World                  | Phelps     | Andrew    | 35.00 |
| How to Keep your Cellular Bill Down             | Hartpence  | Bruce     | 25.00 |
| My Lost Love's Long Last Lingering              | Heartthrob | Danielle  | 25.00 |
| From the Shores of Lake Erie to IT              | Stratton   | Bill      |  0.00 |
+-------------------------------------------------+------------+-----------+-------+
10 rows in set (0.00 sec)

--------------
-- #6
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT title, name FROM Book
LEFT OUTER JOIN BookReview USING (ISBN)
LEFT OUTER JOIN Reviewer USING (ReviewerID)
--------------

+--------------------------------------------------+-------------+
| title                                            | name        |
+--------------------------------------------------+-------------+
| Women are From Venus ORACLE is from Beyond Pluto | Phelps      |
| Calculus for Phys Ed Majors                      | NULL        |
| My Love's Last Longing                           | Heartthrob  |
| From the Shores of Lake Erie to IT               | Yacci       |
| My Love's Last Lingering Lost                    | Troell      |
| My Love's Last Lingering Lost                    | Phelps      |
| The Science of Literature Searching              | NULL        |
| Yes! Networking is for Bills Fans                | Kurtz       |
| Yes! Networking is for Bills Fans                | Whittington |
| Yes! Networking is for Bills Fans                | Stratton    |
| How to Keep your Cellular Bill Down              | Leone       |
| How to Keep your Cellular Bill Down              | Whittington |
| Tired of wired? Infrared instead!                | NULL        |
| ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR  | Bills       |
| Master Wireless Through The Classic Comics       | NULL        |
| How to Keep your Cable Bill Down                 | Leone       |
| I Lasted my Love's Last Lingering Longing        | Weeden      |
| From Deep in the Heart of Texas to IT            | Leone       |
| My Lost Love's Long Last Lingering               | Stratton    |
| From Brockport to IT                             | Yacci       |
| From Brockport to IT                             | Perez-Hardy |
| Master HTML Through The Classic Comics           | NULL        |
| The Shortest Book in the World                   | Kurtz       |
| The Shortest Book in the World                   | Stratton    |
| My Love's at Long Last Lost his Lingering        | Weeden      |
| How to add Class to your Programming             | McVea       |
| Master C++ Through The Classic Comics            | NULL        |
| A language without Pointers? Priceless.          | NULL        |
| JAVA: It's more than Just a Programming Language | Whittington |
+--------------------------------------------------+-------------+
29 rows in set (0.00 sec)

--------------
-- #7
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT ISBN, title FROM Book
JOIN Category ON Book.category = Category.catID
WHERE catdescription LIKE 's%'
--------------

+---------------+-----------------------------------+
| ISBN          | title                             |
+---------------+-----------------------------------+
| 1-222-32443-7 | Calculus for Phys Ed Majors       |
| 2-089-77869-5 | Yes! Networking is for Bills Fans |
| 8-330-69586-6 | The Shortest Book in the World    |
+---------------+-----------------------------------+
3 rows in set (0.00 sec)

--------------
-- #8
--------------

Query OK, 0 rows affected (0.00 sec)

--------------
SELECT OwnerID AS "Owner's ID", title AS "Book Title", CONCAT (LastName, ", ", FirstName) AS "Owner"
FROM Book JOIN OwnersBook USING (ISBN) JOIN Owner USING (OwnerID)
ORDER BY OwnerID DESC
--------------

+------------+-------------------------------------------------+-----------------------+
| Owner's ID | Book Title                                      | Owner                 |
+------------+-------------------------------------------------+-----------------------+
|         10 | From the Shores of Lake Erie to IT              | Lumberworker, George  |
|          9 | How to Keep your Cable Bill Down                | Tripplewander, Martha |
|          9 | I Lasted my Love's Last Lingering Longing       | Tripplewander, Martha |
|          9 | My Lost Love's Long Last Lingering              | Tripplewander, Martha |
|          9 | The Shortest Book in the World                  | Tripplewander, Martha |
|          8 | How to Keep your Cellular Bill Down             | Rabblewok, George     |
|          7 | My Love's Last Lingering Lost                   | Burblemonger, Mary    |
|          6 | The Science of Literature Searching             | Ling, Wei             |
|          6 | From Deep in the Heart of Texas to IT           | Ling, Wei             |
|          6 | My Love's at Long Last Lost his Lingering       | Ling, Wei             |
|          5 | How to Keep your Cellular Bill Down             | Francis, Scott        |
|          5 | ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR | Francis, Scott        |
|          4 | Yes! Networking is for Bills Fans               | Corplestein, Ira      |
|          4 | How to Keep your Cellular Bill Down             | Corplestein, Ira      |
|          4 | ER, SOM, NF, DK/NF, SQL, JDBC, ODBC, and RELVAR | Corplestein, Ira      |
|          3 | My Love's Last Longing                          | Corplestein, Leslie   |
|          3 | From the Shores of Lake Erie to IT              | Corplestein, Leslie   |
|          3 | From Deep in the Heart of Texas to IT           | Corplestein, Leslie   |
|          2 | Yes! Networking is for Bills Fans               | Scott, Francis        |
+------------+-------------------------------------------------+-----------------------+
19 rows in set (0.00 sec)

mysql> NOTEE
