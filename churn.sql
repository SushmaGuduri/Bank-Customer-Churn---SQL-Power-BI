create database churn;

use churn;

select * from churn_modelling;

-- overall churn
select Exited, count(*) from churn_modelling
group by Exited;

-- Credit Score Analysis
select min(CreditScore) as mimimum_creditscore, 
 max(CreditScore) as maximum_creditscore
 from churn_modelling;

SELECT
    CASE
        WHEN CreditScore >= 600 THEN 'High Credit Score'
        ELSE 'Low Credit Score'
    END AS credit_score_category,
    Exited,
    COUNT(*) AS customer_count
FROM churn_modelling
GROUP BY credit_score_category, Exited
ORDER BY credit_score_category, Exited;

-- Geography analysis
select Geography ,
sum(CASE WHEN Exited = 1 then 1 else 0 end) as churned_customers,
sum(CASE WHEN Exited = 0 then 1 else 0 end) as retained_customers,
COUNT(*) AS total_customers,
 ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS churn_rate
from churn_modelling  
group by Geography
order by churn_rate DESC;

-- Tenure analysis
SELECT
    Tenure,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_percent
FROM churn_modelling
GROUP BY Tenure
ORDER BY Tenure;

-- customer activity
SELECT
    IsActiveMember,
    COUNT(*) AS customer_count
FROM churn_modelling
GROUP BY IsActiveMember;

SELECT
    IsActiveMember,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling
GROUP BY IsActiveMember
ORDER BY IsActiveMember;

-- Credit Card Ownership
SELECT
    HasCrCard,
    COUNT(*) AS card_cound
FROM churn_modelling
GROUP BY HasCrCard;

SELECT
    HasCrCard,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling
GROUP BY HasCrCard
ORDER BY HasCrCard;

-- Number of products
SELECT
    NumOfProducts,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
     SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- gender analysis
SELECT
    Gender,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling
GROUP BY Gender;

-- Age analysis
select min(Age) as mimimum_age, 
 max(Age) as age
 from churn_modelling;
 
 SELECT
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '66+'
    END AS AgeGroup,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS churned_count,
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- Balance Analysis
SELECT
    MIN(Balance) AS min_balance,
    MAX(Balance) AS max_balance,
    ROUND(AVG(Balance), 2) AS avg_balance
FROM churn_modelling;

SELECT
    CASE 
        WHEN Balance = 0 THEN 'Zero Balance'
        ELSE 'Non-Zero Balance'
    END AS balance_type,
    COUNT(*) AS total_customers
FROM churn_modelling
GROUP BY balance_type;

SELECT
    CASE 
        WHEN Balance = 0 THEN 'Zero Balance'
        ELSE 'Non-Zero Balance'
    END AS balance_type,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_modelling
GROUP BY balance_type;

SELECT
    COUNT(*) AS customers_above_1_lakh
FROM churn_modelling
WHERE Balance > 100000;

SELECT
    CASE
        WHEN Balance > 100000 THEN 'Above 1 Lakh'
        ELSE 'Up to 1 Lakh'
    END AS balance_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM churn_modelling
WHERE Balance > 0
GROUP BY balance_group;

-- Estimated salary Aanlysis
SELECT
    CASE
        WHEN EstimatedSalary < 50000 THEN 'Low Salary'
        WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_group,
    COUNT(*) AS total_customers
FROM churn_modelling
GROUP BY salary_group
ORDER BY salary_group;
select min(EstimatedSalary) from churn_modelling;

SELECT 
    CASE
        WHEN EstimatedSalary < 50000 THEN 'Low Salary'
        WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_group,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
    SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percent
FROM churn_modelling
GROUP BY salary_group
ORDER BY salary_group;

-- Activity × Number of products (all customers):
WITH Activity_Products_Churn AS (
    SELECT
        IsActiveMember,
        NumOfProducts,
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
        SUM(CASE WHEN Exited = 0 THEN 1 ELSE 0 END) AS stayed_count,
        ROUND(
            100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS churn_rate_percent
    FROM churn_modelling
    GROUP BY IsActiveMember, NumOfProducts
)
SELECT *
FROM Activity_Products_Churn
ORDER BY IsActiveMember, NumOfProducts;

--
WITH Age51_65_Products_Activity AS (
    SELECT
        NumOfProducts,
        IsActiveMember,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
        ROUND(
            SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS churn_rate_percent
    FROM churn_modelling
    WHERE Age BETWEEN 51 AND 65
    GROUP BY NumOfProducts, IsActiveMember
)
SELECT *
FROM Age51_65_Products_Activity
ORDER BY NumOfProducts, IsActiveMember;

-- Activity × Number of products for high-balance customers (>1 lakh):
WITH HighBalance_Activity_Products AS (
    SELECT
        IsActiveMember,
        NumOfProducts,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_count,
        ROUND(
            SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS churn_rate_percent
    FROM churn_modelling
    WHERE Balance > 100000
    GROUP BY IsActiveMember, NumOfProducts
)

SELECT *
FROM HighBalance_Activity_Products
ORDER BY IsActiveMember, NumOfProducts;