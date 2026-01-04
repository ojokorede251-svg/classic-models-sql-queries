# Classic Models - Customer Credit Risk Analysis (MySQL)

## Project Overview
Analyzed the Classic Models sales database to identify customers who have exceeded their credit limits — a key credit risk and accounts receivable insight for business stakeholders.

Using MySQL, calculated:
- Total sales value per customer
- Total payments received per customer
- Outstanding amount (sales - credit limit)
- Flag for customers purchasing beyond their approved credit limit

Dataset: Classic Models (sample retail database with customers, orders, order details, and payments tables, 2003–2005).

## Tools Used
- MySQL / MySQL Workbench

## Business Question Answered
**Which customers have sales exceeding their credit limit, and by how much?**

This helps prioritize collections, assess risk, and inform credit policy decisions.

## Key Query Features
- Multiple Common Table Expressions (CTEs) for modular logic
- Multi-table JOINs across customers → orders → orderdetails → payments
- Aggregation with GROUP BY
- Calculated fields: sales_value, money_owed
- Conditional flag using CASE statement

## Sample Output
![Query Results](query_results.png)
*(Shows customerNumber, creditLimit, total sales, payments, money owed, and over-credit flag)*

## Full Query
See `classic_models_queries.sql` for the complete, commented script.

## How to Run
1. Install the Classic Models sample database (widely available online as .sql schema).
2. Execute the query in MySQL Workbench or any MySQL client.
3. Results will show all customers with a flag for those over their credit limit.

## Related Project
This analysis complements my interactive Power BI sales dashboard:  
https://github.com/ojokorede251-svg/classic-models-sales-dashboard
