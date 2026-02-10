# Customer Churn Analysis (SQL + Power BI)

## Overview
This project analyzes customer churn for ~10,000 banking customers using **SQL** for analysis and **Power BI** for visualization.  
The objective was to move beyond demographics and identify **behavior-driven churn patterns** that have real business impact.

---

## Key Insights

Churn is **not random**. It clusters strongly around **customer inactivity**.

Inactive customers show a churn rate of **~36%**, compared to **~18%** for active customers.  
This 2× difference remains consistent across age, balance, tenure, and geography, making **activity status the strongest churn driver**.

Customers aged **51–65 initially show high churn (~53%)**, but deeper analysis reveals age is not the root cause.  
Within this group, **inactive customers churn at ~87%**, while **active customers churn at ~31%**, proving disengagement drives churn—not age.

High-balance customers (₹1 lakh+) churn slightly more (**~25%**) than lower-balance customers (**~21%**).  
However, this churn is concentrated among **inactive customers holding only one product**. Active high-balance customers with 1–2 products remain relatively stable.

Product holding impacts retention.  
Customers with **1 product churn the most**, especially when inactive, while customers with **2 products consistently show the lowest churn**, indicating better retention through product diversification.

Some commonly assumed drivers showed weak impact.  
Gender and estimated salary display nearly uniform churn (~20%) across segments and were deprioritized in risk modeling.

---

## Core Insight
**Customers don’t churn because of who they are.  
They churn because they stop engaging.**

---

## Business Impact
- Prioritize reactivation of inactive customers  
- Encourage early multi-product adoption  
- Monitor engagement signals instead of relying on demographics

---

## Tools Used
- **SQL** – Data cleaning, segmentation, multi-factor churn analysis  
- **Power BI** – Interactive dashboards and churn visualization




