CREATE TABLE UK_Bank (customer_id Int, name Varchar, surname Varchar, 
					  gender Varchar, age Int, region Varchar, 
					  job_classification Varchar, date_joined Date, 
					  balance Numeric);

SELECT *
FROM UK_Bank;

SELECT COUNT(customer_id) AS "total number of customers"
FROM UK_Bank;

SELECT gender, COUNT(gender) AS "number of customers"
FROM UK_Bank
GROUP BY gender;

SELECT ROUND(AVG(age)) AS "average customer age"
FROM UK_Bank;

SELECT gender, ROUND(AVG(age)) AS "average customer age"
FROM UK_Bank
GROUP BY gender;

SELECT name, surname, date_joined AS "latest joiner"
FROM UK_Bank
WHERE date_joined = (SELECT MAX(date_joined) 
					 FROM UK_Bank);

SELECT MAX(date_joined) AS latest_date, 
MIN(date_joined) AS earliest_date
FROM UK_Bank;

SELECT name, surname, date_joined AS "earliest joiner"
FROM UK_Bank
WHERE date_joined = (SELECT MIN(date_joined) 
					 FROM UK_Bank);

SELECT region, gender, COUNT(region) AS "region count"
FROM UK_Bank
GROUP BY region, gender
ORDER BY region;

SELECT region, gender, ROUND(AVG(age)) AS "average age"
FROM UK_Bank
GROUP BY region, gender
ORDER BY region;

SELECT job_classification, COUNT(job_classification) AS "customer count"
FROM UK_Bank
GROUP BY job_classification
ORDER BY "customer count" DESC;

SELECT job_classification, ROUND(AVG(balance)) AS "average balance"
FROM UK_Bank
GROUP BY job_classification
ORDER BY "average balance" DESC;

SELECT name, surname, balance
FROM UK_Bank
WHERE balance=(SELECT ROUND(MAX(balance), 2) 
			   FROM UK_Bank);

SELECT region, ROUND(AVG(balance)) AS "average balance"
FROM UK_Bank
GROUP BY region
ORDER BY "average balance" DESC;

SELECT region, ROUND(SUM(balance)) AS "total balance"
FROM UK_Bank
GROUP BY region
ORDER BY "total balance" DESC;

SELECT region, job_classification
FROM UK_Bank
GROUP BY region, job_classification
ORDER BY region;


