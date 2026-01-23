CREATE TABLE customers (
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    senior_citizen INT,
    partner VARCHAR(5),
    dependents VARCHAR(5),
    tenure INT,
    phone_service VARCHAR(5),
    internet_service VARCHAR(20),
    contract VARCHAR(20),
    payment_method VARCHAR(30),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    churn VARCHAR(5)
);

SELECT COUNT(*) FROM customers;

-- Overall Churn Rate
SELECT 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS churn_rate_percent
FROM customers;


-- Churn by Contract Type
SELECT 
  contract,
  COUNT(*) AS total_customers,
  SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS churn_rate
FROM customers
GROUP BY contract
ORDER BY churn_rate DESC;


-- Churn by Tenure Buckets
SELECT 
  CASE
    WHEN tenure < 12 THEN '0-1 year'
    WHEN tenure BETWEEN 12 AND 24 THEN '1-2 years'
    ELSE '2+ years'
  END AS tenure_group,
  COUNT(*) AS customers,
  SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned,
  ROUND(
    SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
    2
  ) AS churn_rate
FROM customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;



-- Revenue Leakage Due to Churn
SELECT 
  ROUND(SUM(Monthly_Charges), 2) AS monthly_revenue_lost
FROM customers
WHERE churn = 'Yes';

-- High-Risk Customer Profile
SELECT 
  contract,
  payment_method,
  ROUND(AVG(monthly_charges),2) AS avg_monthly_charges,
  ROUND(AVG(tenure),1) AS avg_tenure
FROM customers
WHERE churn='Yes'
GROUP BY contract, payment_method
ORDER BY avg_monthly_charges DESC;







