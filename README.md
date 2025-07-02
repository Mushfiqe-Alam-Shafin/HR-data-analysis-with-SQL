# 📊 HR Data Analysis with SQL

This project explores employee, department, job title, and performance data using SQL to derive meaningful insights for HR decision-making. The queries demonstrate skills in data transformation, joins, aggregations, subqueries, window functions, and CTEs.

---

## 🗂️ Datasets Overview

The project uses four CSV datasets:

| Dataset Name           | Description                           | Rows  | Columns |
|------------------------|----------------------------------------|-------|---------|
| `employees.csv`        | Basic details of each employee         | 1000  | 6       |
| `departments.csv`      | Department IDs and names               | 10    | 2       |
| `job_titles.csv`       | Employee job title history             | 1500  | 4       |
| `performance_reviews.csv` | Yearly review scores of employees  | 2000  | 4       |

---

## 🛠️ Tools Used

- SQL (SQLite-compatible syntax)
- DB Browser for SQLite
- Microsoft Excel (for CSV preparation)
- Git & GitHub

---

## 📌 SQL Problems Solved

Below are the 10 SQL problems included in this project. Each is solved using real-world HR logic and includes at least one advanced SQL concept.

1. **List all employees with their department name and all job titles held.**  
   ➤ Concepts: `JOIN`, `GROUP_CONCAT`, `GROUP BY`

2. **Rank employees by salary within their department.**  
   ➤ Concepts: `JOIN`, `RANK() OVER (PARTITION BY ...)`

3. **Show employees whose current review score is better than their previous one.**  
   ➤ Concepts: `JOIN`, `LAG()`, `CASE`

4. **Show each employee’s latest job title using a CTE.**  
   ➤ Concepts: `CTE`, `ROW_NUMBER()`, `JOIN`

5. **List employees earning more than the average salary of their department.**  
   ➤ Concepts: `JOIN`, subquery

6. **Display average review score of each employee with their rank across the company.**  
   ➤ Concepts: `JOIN`, `GROUP BY`, `RANK()`

7. **Identify employees who had the same score in two consecutive reviews.**  
   ➤ Concepts: `LAG()`, `JOIN`, `CASE`

8. **Classify review trends (increasing/decreasing/stable) from last 3 reviews.**  
   ➤ Concepts: `CTE`, `LAG()`, `CASE`

9. **Create a department-level summary with top 3 earners' names.**  
   ➤ Concepts: `RANK()`, `GROUP_CONCAT()`, subquery or CTE

10. **List each employee’s job titles with the date they started them.**  
    ➤ Concepts: `JOIN`, `ORDER BY`  
    ➤ (Simplified version — no `LEAD()` used)

---

## 💡 Learning Outcomes

- Gained hands-on practice in **joins**, **window functions**, **CTEs**, and **aggregations**.
- Simulated real-world HR insights like **promotion tracking**, **salary benchmarking**, and **performance analysis**.
- Prepared for SQL-based data analysis interviews.

---

## 🧠 Author

**Mushfiqe Alam Shafin**  
BBA in MIS | Aspiring Data Analyst  
[GitHub Profile](https://github.com/Mushfiqe-Alam-Shafin)

---

