/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 10

*******************************************************************************
*******************************************************************************


In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - CASE
*/

/*******************************************************************************
CASE

https://www.w3schools.com/sql/sql_case.asp
*******************************************************************************/

/* 1. Select everything from the sales table and create a new column called 
   "sales_category" with case conditions to categorise qty:
   
		qty >= 50 high sales
		20 <= qty < 50 medium sales
		qty < 20 low sales
*/

SELECT 
    *,
    CASE
        WHEN qty >= 50 THEN 'high sales'
        WHEN qty BETWEEN 20 AND 50 THEN 'medium sales'
        ELSE 'low sales'
    END AS sales_category
FROM
    sales;



/* 2. Adding to your answer from the previous question. Find out the total 
   amount of books sold (qty) in each sales category i.e. How many books had 
   high sales, how many had medium sales, and how many had low sales */

SELECT 
    CASE
        WHEN qty >= 50 THEN 'high sales'
        WHEN qty BETWEEN 20 AND 50 THEN 'medium sales'
        ELSE 'low sales'
    END AS sales_category,
    SUM(qty)
FROM
    sales
GROUP BY sales_category;

/* 3. Adding to your answer from the previous questions: output only those 
   sales categories that have a SUM(qty) greater than 100, and order them in 
   descending order */

SELECT 
    CASE
        WHEN qty >= 50 THEN 'high sales'
        WHEN qty BETWEEN 20 AND 50 THEN 'medium sales'
        ELSE 'low sales'
    END AS sales_category,
    SUM(qty) AS sum_qty
FROM
    sales
GROUP BY sales_category
HAVING sum_qty > 100
ORDER BY sum_qty DESC;

/* 4. Find out the average book price, per publisher, for the following book 
    types and price categories:
		book types: business, traditional cook and psychology
		price categories: <= 5 super low, <= 10 low, <= 15 medium, >/******************************************************************************
*******************************************************************************

SQL CHALLENGES 11

*******************************************************************************
*******************************************************************************/

USE publications;

-- 1. Using LEFT JOIN: in which cities has "Is Anger the Enemy?" been sold?



/* 2. Select all the book titles that have a link to the employee Howard Snyder 
    (he works for the publisher that has published those books). */



/* 3. Using the JOIN of your choice: Select the book title with highest number of 
   sales (qty) */



/* 4. Select all book titles and the full name of their author(s).
      
      - If a book has multiple authors, all authors must be displayed (in 
      multiple rows).
      
      - Books with no authors and authors with no books should not be displayed.
*/



/* 5. Select the full name of authors of Psychology books

   Bonus hint: if you want to prevent duplicates but allow authors with shared
   last names to be displayed, you can concatenate the first and last names
   with CONCAT(), and use the DISTINCT clause on the concatenated names. */



/* 6. Explore the table roysched and try to grasp the meaning of each column. 
   The notes below will help:
   
   - "Royalty" means the percentage of the sale price paid to the author(s).
   
   - Sometimes, the royalty may be smaller for the first few sales (which have
     to cover the publishing costs to the publisher) but higher for the sales 
     above a certain threshold.
     
   - In the "roysched" table each title_id can appear multiple times, with
     different royalty values for each range of sales.
     
   - Select all rows for particular title_id, for example "BU1111", and explore
	 the data. */



/* 7. Select all the book titles and the maximum royalty they can reach.
    Display only titles that are present  15 high
        
    - When displaying the average prices, use ROUND() to hide decimals. */
    
    SELECT 
       pub_id,
    CASE 
       WHEN price <= 5 THEN 'super low'
       WHEN price <= 10 THEN 'low'
       WHEN price <= 15 THEN 'medium'
       ELSE 'high'
    END AS price_category,
    ROUND(AVG(price)) AS avg_price
    FROM 
        titles
    WHERE 
        type IN ('business', 'trad_cook', 'psychology')
    GROUP BY pub_id, price;
    