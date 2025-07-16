CREATE DATABASE IF NOT EXISTS bank_data;
USE bank_data;
CREATE TABLE bank_customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR (30),
	default_status VARCHAR(10),
    balance INT,
    housing VARCHAR(10),
    loan VARCHAR(10),
    contact VARCHAR(10),
    day INT,
    month VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20),
    deposit VARCHAR (10)
);    
SHOW TABLES IN bank_data;

-- Phase 1: SQL Data Exploration & Cleaning

-- Step 1: View Sample Data
SELECT * FROM bank_customers LIMIT 10;
-- Step 2: Understand Schema
DESCRIBE bank_customers;
SELECT COUNT(*) AS total_rows FROM bank_customers;
-- Step 3: Check for Nulls or Missing Values
SELECT
	SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_null,
    SUM(CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS job_null,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS balance_null,
    SUM(CASE WHEN deposit IS NULL THEN 1 ELSE 0 END) AS deposit_null
FROM bank_customers;    
-- Step 4: Basic Summary Statistics
SELECT 
	MIN(age) AS min_age,
    MAX(age) as max_age,
    AVG(balance) as avg_balance,
    COUNT(*) AS total_customers
FROM bank_customers;    
-- Step 5: Remove Duplicates (if any)
SET SQL_SAFE_UPDATES = 0;
DELETE FROM bank_customers
WHERE id NOT IN (
  SELECT * FROM (
    SELECT MIN(id)
    FROM bank_customers
    GROUP BY age, job, marital, education, default_status, balance, housing, loan,
             contact, day, month, duration, campaign, pdays, previous, poutcome, deposit
  ) AS temp_ids
);
-- Step 6: Optional – Basic Feature Engineering in SQL
-- Age Buckets
ALTER TABLE bank_customers ADD age_group VARCHAR (20);
UPDATE bank_customers
SET age_group = CASE
	WHEN age < 30 THEN "Under 30"
	WHEN age BETWEEN 30 AND 45 THEN "30-45"
    WHEN age BETWEEN 46 AND 60 THEN "46-60"
	ELSE "ABOVE 60"
END;    
-- Balance Buckets
ALTER TABLE bank_customers ADD balance_group VARCHAR (20);
UPDATE bank_customers
SET balance_group = CASE
	WHEN balance < 0 THEN "Negative"
    WHEN balance BETWEEN 0 AND 500 THEN 'Low'
    WHEN balance BETWEEN 501 AND 2000 THEN 'Medium'
    ELSE 'High'
END;  
-- Step 7: Final Export Query for Python
SELECT
    age, job, marital, education, default_status, balance,
    housing, loan, contact, day, month, duration,
    campaign, pdays, previous, poutcome
FROM bank_customers;
  
    
	

             
    
	

    
    
    

    
    
  