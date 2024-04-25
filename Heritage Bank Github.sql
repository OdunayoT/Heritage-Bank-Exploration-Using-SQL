-- Heritage Bank Data Exploration

-- Create the table we will work with and import the data into it.

CREATE TABLE UK_Bank (customer_id Int, name Varchar, surname Varchar, 
					  gender Varchar, age Int, region Varchar, 
					  job_classification Varchar, date_joined Date, 
					  balance Numeric);

-- Select the data we're going to work with

SELECT *
FROM UK_Bank;

-- Total number of customers
-- Shows the total number of customers the bank has

SELECT COUNT(customer_id) AS "total number of customers"
FROM UK_Bank;

-- Number of customers by gender
-- Shows the number of customers the customer has by gender

SELECT gender, COUNT(gender) AS "number of customers"
FROM UK_Bank
GROUP BY gender;

-- Average age of customers
-- Shows the average age of the Bank's customers

SELECT ROUND(AVG(age)) AS "average customer age"
FROM UK_Bank;

-- Average age by gender

SELECT gender, ROUND(AVG(age)) AS "average customer age"
FROM UK_Bank
GROUP BY gender;

-- Recent joiners of the bank
-- Shows the recent date customers joined the bank.
SELECT name, surname, date_joined AS "latest joiner"
FROM UK_Bank
WHERE date_joined = (SELECT MAX(date_joined) 
					 FROM UK_Bank);

-- Oldest joiner
-- Shows the oldest date a customer joined the bank.
SELECT name, surname, date_joined AS "earliest joiner"
FROM UK_Bank
WHERE date_joined = (SELECT MIN(date_joined) 
					 FROM UK_Bank);

-- An alternative way to find the recent and oldest date a customer joined the bank.

SELECT MAX(date_joined) AS latest_date, 
       MIN(date_joined) AS earliest_date
FROM UK_Bank;

-- Number of customers by gender in the region the Bank operates in

SELECT region, gender, COUNT(region) AS "region count"
FROM UK_Bank
GROUP BY region, gender
ORDER BY region;

-- Average age of customers by gender in the region the Bank operates in
SELECT region, gender, ROUND(AVG(age)) AS "average age"
FROM UK_Bank
GROUP BY region, gender
ORDER BY region;

-- Classification of job category

SELECT job_classification, COUNT(job_classification) AS "customer count"
FROM UK_Bank
GROUP BY job_classification
ORDER BY "customer count" DESC;

-- Average balance by job category

SELECT job_classification, ROUND(AVG(balance)) AS "average balance"
FROM UK_Bank
GROUP BY job_classification
ORDER BY "average balance" DESC;

-- Customer with the highest account balance

SELECT name, surname, balance
FROM UK_Bank
WHERE balance=(SELECT ROUND(MAX(balance), 2) 
			   FROM UK_Bank);

-- Average account balance by region

SELECT region, ROUND(AVG(balance)) AS "average balance"
FROM UK_Bank
GROUP BY region
ORDER BY "average balance" DESC;

-- Total account balance by region

SELECT region, ROUND(SUM(balance)) AS "total balance"
FROM UK_Bank
GROUP BY region
ORDER BY "total balance" DESC;

-- Job classification by region

SELECT region, job_classification
FROM UK_Bank
GROUP BY region, job_classification
ORDER BY region;


