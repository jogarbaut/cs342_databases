/* Assignment5.sql 
   Jomel Bautista
   CS 31A, Winter 2025
*/

/* put the database name into this command */

USE megastore;

/* 
Query 1 
Purpose: For each order, write a SQL statement that displays the order ID and order date along 
with the customer ID, first name, and last name of the customer for which the order was created.
*/
SELECT 	megastore.orders.ord_id, 
		megastore.orders.ord_date, 
		megastore.customers.cust_id, 
		megastore.customers.first_name, 
		megastore.customers.last_name
FROM 	megastore.orders
INNER JOIN megastore.customers ON megastore.orders.cust_id = megastore.customers.cust_id;


/* 
Query 2 
Purpose: For each order placed on 04/04/2014, write a SQL statement that lists the order ID, 
customer ID, first name, and last name of the customer for which the order was created.
*/
SELECT 	megastore.orders.ord_id, 
		megastore.orders.cust_id, 
		megastore.customers.first_name, 
		megastore.customers.last_name
FROM 	megastore.orders
INNER JOIN megastore.customers 
ON megastore.orders.cust_id = megastore.customers.cust_id
WHERE megastore.orders.ord_date = '2014-04-04';


/* 
Query 3 
Purpose: Display the customer ID, first name, and last name of each 
customer for which an order was NOT created on 04/04/2014.
*/
SELECT 	megastore.customers.cust_id, 
		megastore.customers.first_name, 
		megastore.customers.last_name
FROM 	megastore.customers
WHERE 	megastore.customers.cust_id NOT IN (
		SELECT megastore.orders.cust_id
		FROM megastore.orders
		WHERE megastore.orders.ord_date = '2014-04-04'
);


/* 
Query 4 
Purpose: For each order, write a SQL statement that lists the product ID, 
order date, order ID, product description, and category for each product that make up the order.
Order the rows by category and then by order ID. Display the customer ID, customer last name, 
order ID,  products ID in each order, and product names.
*/
SELECT 	megastore.orders.ord_id, 
		megastore.orders.ord_date, 
		megastore.customers.cust_id, 
		megastore.customers.last_name, 
		megastore.order_details.prod_id, 
		megastore.products.prod_name, 
		megastore.products.prod_desc, 
		megastore.products.catg_id
FROM 	megastore.orders
INNER JOIN megastore.customers 
		ON megastore.orders.cust_id = megastore.customers.cust_id
INNER JOIN megastore.order_details 
		ON megastore.orders.ord_id = megastore.order_details.ord_id
INNER JOIN megastore.products 
		ON megastore.order_details.prod_id = megastore.products.prod_id
ORDER BY megastore.products.catg_id, megastore.orders.ord_id;


/* 
Query 5 
Purpose: Display the order ID, order date, customer first name, and customer 
last name for each order that was created for Samuel Morse but does not contain 
the item description “Electric Pancake griddle”.
*/
SELECT 	megastore.orders.ord_id, 
		megastore.orders.ord_date, 
        megastore.customers.first_name, 
        megastore.customers.last_name
FROM 	megastore.orders
INNER JOIN megastore.customers 
    ON megastore.orders.cust_id = megastore.customers.cust_id
INNER JOIN megastore.order_details 
    ON megastore.orders.ord_id = megastore.order_details.ord_id
INNER JOIN megastore.products 
    ON megastore.order_details.prod_id = megastore.products.prod_id
WHERE megastore.customers.first_name = 'Samuel'
AND megastore.customers.last_name = 'Morse'
AND megastore.orders.ord_id NOT IN (
    SELECT megastore.orders.ord_id
    FROM megastore.orders
    INNER JOIN megastore.order_details 
        ON megastore.orders.ord_id = megastore.order_details.ord_id
    INNER JOIN megastore.products 
        ON megastore.order_details.prod_id = megastore.products.prod_id
    WHERE megastore.products.prod_desc = 'Electric Pancake Griddle'
);


/* 
Query 6 
Purpose: Display the order ID, customer ID, customer last name, all products ID 
in each order, and product names. Display the first 10 rows in the result set.
Display the customer ID, customer last name, order ID,  products ID in each order, 
and product names.
*/
SELECT 	megastore.orders.cust_id, 
		megastore.customers.last_name, 
		megastore.orders.ord_id, 
		megastore.order_details.prod_id, 
		megastore.products.prod_name
FROM megastore.orders
INNER JOIN megastore.customers 
    ON megastore.orders.cust_id = megastore.customers.cust_id
INNER JOIN megastore.order_details 
    ON megastore.orders.ord_id = megastore.order_details.ord_id
INNER JOIN megastore.products 
    ON megastore.order_details.prod_id = megastore.products.prod_id
LIMIT 10;


/* 
Query 7 
Purpose: Display the order ID, customer ID, customer last name, all products ID in each order, and product names. 
Display only the products in the ‘MUS’ category.
*/
SELECT 	megastore.orders.cust_id, 
		megastore.customers.last_name, 
		megastore.orders.ord_id, 
		megastore.order_details.prod_id, 
		megastore.products.prod_name
FROM megastore.orders
INNER JOIN megastore.customers 
	ON megastore.orders.cust_id = megastore.customers.cust_id
INNER JOIN megastore.order_details 
    ON megastore.orders.ord_id = megastore.order_details.ord_id
INNER JOIN megastore.products 
    ON megastore.order_details.prod_id = megastore.products.prod_id
WHERE megastore.products.catg_id = 'MUS';


/* 
Query 8 
Purpose: Display the rating for customers. Display the customer ID, 
credit limit, and rating of the customer.
*/
SELECT 	megastore.customers.cust_id, 
		megastore.customers.credit_limit, 
		megastore.credit_ratings.rating
FROM megastore.customers
INNER JOIN megastore.credit_ratings 
ON megastore.customers.credit_limit 
BETWEEN megastore.credit_ratings.low_limit AND megastore.credit_ratings.high_limit;


/* 
Query 9 
Purpose: Display both ordered and un-ordered products. 
Display product ID, product description, and order ID in the category ‘MUS’
*/
SELECT 	megastore.products.prod_id, 
		megastore.products.prod_desc, 
        megastore.products.catg_id,
		megastore.order_details.ord_id
FROM megastore.products
LEFT JOIN megastore.order_details 
ON megastore.products.prod_id = megastore.order_details.prod_id
WHERE megastore.products.catg_id = 'MUS';


/*  
Query 10 
Purpose: Display customers with and without orders. Display customer ID, last name, and order ID.
We get customers with orders. If the customer has several orders, that customer gets multiple lines in the result set.
We also get rows for the two customers in this cust_id range who have no orders and the column for their 
order ID value is null—these customers each get one row. 
*/
SELECT 	megastore.customers.cust_id, 
		megastore.customers.last_name, 
		megastore.orders.ord_id
FROM megastore.customers
LEFT JOIN megastore.orders 
ON megastore.customers.cust_id = megastore.orders.cust_id;


/* 
Query 11 
Purpose: For all products, write a SQL statement that lists the product ID, 
Product name, and category description for each category.
Order the rows by category ID and then by product ID.
*/
SELECT 	megastore.products.prod_id, 
		megastore.products.prod_name, 
		megastore.categories.catg_desc
FROM megastore.products
INNER JOIN megastore.categories 
ON megastore.products.catg_id = megastore.categories.catg_id
ORDER BY megastore.categories.catg_id, megastore.products.prod_id;


/* 
Query 12 
Purpose: Display a list of all employees and, if applicable, their manager. 
*/
SELECT 	employees.first_name, 
		employees.last_name, 
		managers.first_name AS mgr_first_name, 
		managers.last_name AS mgr_last_name
FROM megastore.employees AS employees
LEFT JOIN megastore.employees AS managers 
ON employees.manager_id = managers.emp_id;
