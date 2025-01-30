/* Assignment4.sql 
   Jomel Bautista
   CS 31A, Winter 2025
*/

/* put the database name into this command */

USE movieco;

/* 
Query 1 
Purpose: Write the SQL command to change the movie year for movie number 1245 to 2014.
*/
UPDATE 	movieco.movie
SET 	movie_year = 2014
WHERE 	movie_num = 1245;


/* 
Query 2 
Purpose: Alter the DETAILRENTAL table to include a derived attribute named detail_dayslate to store integers of up to three digits.
Run the DESCRIBE command again to verify the command was successful.
*/
ALTER TABLE movieco.detailrental ADD detail_dayslate INT(3);
DESCRIBE movieco.detailrental;


/* 
Query 3 
Purpose: Update the DETAILRENTAL table to set the values in detail_returndate to include a time component.
*/
ALTER TABLE movieco.detailrental MODIFY detail_returndate DATETIME;


/* 
Query 4 
Purpose: Alter the VIDEO table to include an attribute named vid_status to store character data of up to four characters long.
The attribute should have a constraint to enforce the domain (“in,” “out,” and “lost”) and have a default value of “in”.
*/
ALTER TABLE movieco.video
ADD 		vid_status ENUM('in', 'out', 'lost') NOT NULL DEFAULT 'in';


/* 
Query 5 
Purpose: Update the vid_status attribute of the VIDEO table to set the vid_status to “out” for all 
videos in the detail_returndate attribute of the DETAILRENTAL table. 
Assumed this meant if the video has a return date value and is not null
*/
UPDATE movieco.video 
SET vid_status = 'out' 
WHERE vid_num IN (
    SELECT vid_num
    FROM movieco.detailrental 
    WHERE detail_returndate IS NOT NULL
);

/* 
Query 6 
Purpose: Alter the PRICE table to include an attribute named price_rentdays to store integers of up to two digits.
The attribute should not accept NULL values, and it should have a default value of 3.
Run the DESCRIBE command on the price table to view its structure.
*/
ALTER TABLE movieco.price
ADD 		price_rentdays INT(2) NOT NULL DEFAULT 3;
DESCRIBE 	movieco.price;


/* 
Query 7 
Purpose: Update the PRICE table to place the values shown in the following table in the price_rentdays attribute.
Update the PRICE table
price_code	price_rentdays
1			5
3			5
4			7
*/
UPDATE 	movieco.price
SET 	price_rentdays = 5
WHERE 	price_code = 1;

UPDATE 	movieco.price
SET 	price_rentdays = 5
WHERE 	price_code = 3;

UPDATE 	movieco.price
SET 	price_rentdays = 7
WHERE 	price_code = 4;


/* 
Query 8 
Purpose: Rewrite the CREATE TABLE statement for the MEMBERSHIP table to define a unique constraint for the email column at the table level.  
Display column names and data types for the MEMBERSHIP table.
*/
ALTER TABLE movieco.membership
ADD mem_email VARCHAR(100),
ADD CONSTRAINT unique_mem_email UNIQUE (mem_email);

DESCRIBE movieco.membership;


/* 
Query 9 
Purpose: Delete the detail_dayslate column from the DETAILRENTAL table.
*/
ALTER TABLE movieco.detailrental
DROP COLUMN detail_dayslate;


/*  
Query 10 
Purpose: Using the column information for the EMPLOYEEPAY table below, create the EMPLOYEEPAY table. 
Write the syntax you will use to create the table.
Define the primary key (employee_id).
The social security number must be unique.
The salary and hire date columns cannot contain NULL values.
    employee_id INT
    ssn CHAR
    salary NUMERIC
    hire_date DATE
*/
CREATE TABLE movieco.employeepay (
    employee_id INT PRIMARY KEY,
    ssn CHAR(11) UNIQUE,
    salary NUMERIC NOT NULL,
    hire_date DATE NOT NULL
);


/* 
Query 11 
Purpose: Display all employees who DO NOT earn exactly $3,400, $3,000, or $6,000 and who have a first name that begins with the letter ‘S’.
Display each employee's first name, last name, and salary columns.
Rows returned: 4
*/
INSERT INTO movieco.employeepay 
SET employee_id = 184167702, 
    ssn = '744-04-9444', 
    salary = 5500, 
    hire_date = '2011-03-15';

SELECT * FROM movieco.employeepay;


/* 
Query 12 
Purpose: Display the names of the tables in your current database.
*/
SHOW TABLES FROM movieco;


/* 
Query 13
Purpose: Remove the EMPLOYEEPAY table from the database.
Display the names of the tables in your current database.
*/
DROP TABLE movieco.employeepay;
SHOW TABLES FROM movieco;