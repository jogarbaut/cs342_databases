/* Assignment2.sql 
   Jomel Bautista
   CS 31A, Winter 2025
*/

/* put the database name into this command */

USE megastore;

/* 
Query 1 
Purpose: Display the product ID, product name, and description for all products
Rows returned: 49
*/
SELECT prod_id, prod_name, prod_desc FROM megastore.products;


/* 
Query 2 
Purpose: Display all rows and columns for the complete orders table
Rows returned: 97
*/
SELECT * FROM megastore.orders;


/* 
Query 3 
Purpose: Display the first and last names of customers with a credit limit of 750 or more. 
Rows returned: 31
*/
SELECT first_name, last_name FROM megastore.customers WHERE credit_limit >= 750;


/* 
Query 4 
Purpose: Display all rows and columns for each order placed by customer ID 403000 on 10/02/2013. 
Rows returned: 1
*/
SELECT * FROM megastore.orders WHERE cust_id = 403000 AND STR_TO_DATE(ord_date, '%Y-%m-%d %H:%i:%s') = '2013-10-02';


/* 
Query 5 
Purpose: Display the order ID, product ID, quoted price, quantity ordered, and the exact cost. 
Use PRICE, QUANTITY, and ExtCost as the column aliases. 
The aliases are to be shown exactly as described (case sensitive). 
Rows returned: 184
*/
SELECT 	ord_id, 
		prod_id, 
		quoted_price AS "PRICE", 
		quantity_ordered AS "QUANTITY",
		quoted_price * quantity_ordered AS "ExtCost"
FROM 	megastore.order_details;


/* 
Query 6 
Purpose: Display the order ID, date, and time of all orders that were placed before 10/28/2013. 
Use an appropriate alias for your column headings.
Rows returned: 97
*/
SELECT 	ord_id AS "orer id", 
		ord_date AS "ord_date" 
FROM 	megastore.orders 
WHERE 	ord_date < STR_TO_DATE(ord_date, '%Y-%m-%d %H:%i:%s') < '2013-10-28';

/* 
Query 7 
Purpose: Display all details of all products. Order the output by product ID within category. 
(That is, order the output by category and then by product ID.)
Rows returned: 49
*/
SELECT 		*
FROM 		megastore.products
ORDER BY 	catg_id, prod_id;


/* 
Query 8 
Purpose: Display the rows from the customers table where the values in the customer ID column is 403100. 
Display the customer’s last name, first name, and customer ID.
Rows returned: 1
*/
SELECT 	last_name, 
		first_name, 
		cust_id 
FROM 	megastore.customers
WHERE	cust_id = 403100;


/* 
Query 9 
Purpose: Display the customer ID from the orders table for each 
customer who has placed an order with Mega Store. Display each customer ID only once.
Rows returned: 21
*/
SELECT DISTINCT cust_id FROM megastore.orders;

/*  
Query 10 
Purpose: Display the order ID, order date, sales representative ID, and shipping mode 
for a null shipping mode from the ORDERS table. Sort the list by department name.
Rows returned: 10
*/
SELECT	ord_id,
		ord_date,
        sales_rep_id,
        shipping_mode
FROM	megastore.orders
WHERE 	shipping_mode IS NULL;


/* 
Query 11 
Purpose: Display the order ID, order date, sales representative ID, 
and shipping mode for a not null shipping mode from the ORDERS table. 
Display the first 5 rows.
Rows returned: 5
*/
SELECT	ord_id,
		ord_date,
        sales_rep_id,
        shipping_mode
FROM	megastore.orders
WHERE 	shipping_mode IS NOT NULL
LIMIT	5;


/* 
Query 12 
Purpose: Display only location rows with a country ID of US. 
Rows returned: 3
*/
SELECT * FROM megastore.locations WHERE loc_country_id = 'US';
