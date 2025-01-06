-- Lynch, Connor
-- ISTE230, Fall 2024
-- PE10

-- #1
SELECT product_code, product_name, list_price, discount_percent FROM products
	ORDER BY list_price DESC;
	
-- #2
SELECT CONCAT(last_name, ', ', first_name) AS full_name FROM customers
	WHERE last_name >= 'M'
	ORDER BY last_name;
	
-- #3
SELECT product_name, list_price, date_added FROM products
	WHERE list_price > 500
	AND list_price < 2000
	ORDER BY date_added DESC;
	
-- #4
SELECT product_name, list_price, discount_percent, ROUND((discount_percent * list_price * .01), 2) AS discount_amount,
	ROUND((list_price - (SELECT discount_amount)), 2) AS discount_price
	FROM products
	ORDER BY discount_price DESC
	LIMIT 5;
	
-- #5
SELECT item_id, item_price, discount_amount, quantity, (item_price * quantity) AS price_total,
	(discount_amount * quantity) AS discount_total,
	((item_price - discount_amount) * quantity) AS item_total
	FROM order_items HAVING item_total > 500
	ORDER BY item_total DESC;
	
-- #6
SELECT order_id, order_date, ship_date FROM orders
	WHERE ship_date IS NULL;
	
-- #7
SELECT now() AS today_unformatted, DATE_FORMAT(now(), '%d-%b-%Y') AS today_formatted;

-- #8
SELECT 100 AS price, .07 AS tax_rate, (100 * .07) AS tax_amount,
	((SELECT tax_amount) + (SELECT price)) AS total;
	
-- #9
SELECT category_name, product_name, list_price FROM categories
	JOIN products USING (category_id)
	ORDER BY category_name, product_name;
	
-- #10
SELECT first_name, last_name, line1, city, state, zip_code FROM customers
	JOIN addresses USING (customer_id)
	WHERE email_address = 'allan.sherwood@yahoo.com';
	
-- #11
SELECT first_name, last_name, line1, city, state, zip_code FROM customers
	JOIN addresses USING (customer_id)
	WHERE shipping_address_id = address_id;
	
-- #12
SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity
	FROM customers c JOIN orders o USING (customer_id)
	JOIN order_items oi USING (order_id)
	JOIN products p USING (product_id)
	ORDER BY last_name, order_date, product_name;
	
-- #13
SELECT p1.product_name, p1.list_price FROM products p1 JOIN products p2 USING (list_price)
	WHERE p1.product_name <> p2.product_name
	ORDER BY product_name;
	
-- #14
SELECT category_name, product_id FROM categories LEFT OUTER JOIN products USING (category_id)
	WHERE product_id IS NULL;