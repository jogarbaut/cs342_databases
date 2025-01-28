/* Assignment3.sql 
   Jomel Bautista
   CS 31A, Winter 2025
*/

/* put the database name into this command */

USE megastore;

/* 
Query 1 
Purpose: Display the product ID, warehouse ID and quantity using appropriate aliases for all products that have a quantity between 50 and 100.00. 
Rows returned: 8
*/
SELECT 	prod_id AS "product id",
		warehouse_id AS "warehouses id",
        quantity_on_hand as "quantity onhand"
FROM	megastore.inventory
WHERE	quantity_on_hand BETWEEN 50 and 100;


/* 
Query 2 
Purpose: Display the product ID, warehouse ID and quantity using appropriate aliases for all products 
that have 50, 100, 150,  200, or 250 units in stock. 
Rows returned: 11
*/
SELECT 	prod_id AS "product id",
		warehouse_id AS "warehouses id",
        quantity_on_hand as "quantity onhand"
FROM	megastore.inventory
WHERE	quantity_on_hand IN (50, 100, 150, 200, 250);


/* 
Query 3 
Purpose: Display product ID and product name of all products with a name that begins with C. 
Use an appropriate alias for your column headings. 
Rows returned: 7
*/
SELECT 	prod_id AS "item id",
		prod_name AS "item name"
FROM	megastore.products
WHERE	prod_name LIKE 'C%';


/* 
Query 4 
Purpose: Display product ID and product name of all products with a name that contains a lowercase ‘o’. 
Use an appropriate alias for your column headings. 
Rows returned: 13
*/
SELECT 	prod_id AS "item id",
		prod_name AS "item name"
FROM	megastore.products
WHERE	prod_name LIKE '%o%';


/* 
Query 5 
Purpose: Display the customer ID, address line 1, and postal code for customers who live in the WY area of San Mateo. 
Use customer ID, street address, and postal code as the column aliases. 
Rows returned: 3
*/
SELECT	customer_id AS "customer ID",
		address_line_1 AS "street address",
		zip_code AS "postal code"
FROM 	megastore.cust_address
WHERE	city = 'San Mateo' AND address_line_2 = 'WY';


/* 
Query 6 
Purpose: Display the customer ID, address line 1, and postal code for customers who do not live in Oakland. 
Use customer ID, street address, and postal code as the column aliases. 
Rows returned: 32
*/
SELECT	customer_id AS "customer ID",
		address_line_1 AS "street address",
		zip_code AS "postal code"
FROM 	megastore.cust_address
WHERE	city <> 'Oakland';

/* 
Query 7 
Purpose: Display the products ID, description, and category ID of each products in category PET or HD.
Rows returned: 15
*/
SELECT 	prod_id, prod_desc, catg_id
FROM 	megastore.products
WHERE	catg_id IN ('PET', 'HD');


/* 
Query 8 
Purpose: Display the customer ID, first name, and last name of each customer whose last name is Morise, Morris, or Morse.
Rows returned: 4
*/
SELECT 	cust_id, first_name, last_name
FROM 	megastore.customers
WHERE	last_name IN ('Morise', 'Morris', 'Morse');


/* 
Query 9 
Purpose: Display the customer ID, first name, and last name of each customer whose last name ends with the letter ‘s’.
Rows returned: 7
*/
SELECT 	cust_id, first_name, last_name
FROM 	megastore.customers
WHERE	last_name LIKE '%s';


/*  
Query 10 
Purpose: Display the product ID , description, and category ID of 
all products that are in the MUS or SPG category and contain the word “ball” in the description.
Rows returned: 2
*/
SELECT 	prod_id, prod_desc, catg_id
FROM 	megastore.products
WHERE	catg_id IN ('MUS', 'SPG') AND prod_desc LIKE '%ball%';


/* 
Query 11 
Purpose: Display all employees who DO NOT earn exactly $3,400, $3,000, or $6,000 and who have a first name that begins with the letter ‘S’.
Display each employee's first name, last name, and salary columns.
Rows returned: 4
*/
SELECT	first_name, last_name, salary
FROM	megastore.employees
WHERE 	salary NOT IN (3400, 3000, 6000) AND first_name LIKE 'S%';


/* 
Query 12 
Purpose: Use a search pattern to find any product’s name with the letter ‘a’ as the second letter and ‘t’ as the third letter. 
Display each product ID, product name, and description. Sort the list by product ID in descending order.
Rows returned: 4
*/
SELECT 		prod_id, prod_name, prod_desc
FROM 		megastore.products
WHERE		prod_name LIKE '_at%'
ORDER BY 	prod_id DESC;


/* 
Query 13
Purpose: Display the product ID, product description, and category ID of all products that are NOT in the HW or PET category.
Rows returned: 28
*/
SELECT 		prod_id, prod_desc, catg_id
FROM 		megastore.products
WHERE		catg_id NOT IN ('HW', 'PET');