---1️⃣ List all employees with their department name and a GROUP_CONCAT of all titles they've ever held

SELECT e.employee_id,
e.name,
d.department_name ,
group_concat(distinct jt.title order by jt.title asc) as titles 
from employees as e 
join job_titles as jt on jt.employee_id = e.employee_id
join departments as d on d.department_id=e.department_id
group by e.employee_id,e.name,d.department_name;

---2️⃣ Rank employees within each department by their salary (highest to lowest)

SELECT e.employee_id,
e.name,
d.department_id,
e.salary,
rank() over(partition by d.department_id order by e.salary desc) as rnk_salary 
from employees as e 
join departments as d on d.department_id=e.department_id
group by e.employee_id,e.name,d.department_id;


---3️⃣ List employees who received a higher score than their previous review (using LAG).

SELECT pr.employee_id,
e.name,
pr.review_date,
pr.score,lag(pr.score) over(partition by pr.employee_id order by pr.review_date) as prev_score,
case when pr.score > lag(pr.score) over(PARTITION by pr.employee_id order by pr.review_date) then 'YES' else 'NO' end as improved_flag
from performance_reviews as pr
join employees  as e on pr.employee_id=e.employee_id;

---4️⃣ Show the most recent job title for each employee using a ROW_NUMBER() CTE

with it as (SELECT *,row_number() over(PARTITION by employee_id order by start_date desc) as rn from job_titles)
SELECT e.employee_id,
e.name, 
it.title as latest_title ,
it.start_date as recent_start_date 
from employees as e 
join it on it.employee_id=e.employee_id
where rn = 1;

---5️⃣ For each department, calculate the average salary, and list employees earning above it



SELECT 
  e.employee_id,
  e.name,
  e.salary,
  d.department_name,
  (SELECT AVG(salary) 
   FROM employees 
   WHERE department_id = e.department_id) AS department_avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
  SELECT AVG(salary) 
  FROM employees 
  WHERE department_id = e.department_id
);

--- Show employees with their average review score and a RANK() across the company.
SELECT e.employee_id,
e.name,
round(avg(pr.score),2) as avg_score,
rank() over(order by avg(score) desc ) as rnk
from employees as e 
join performance_reviews as pr on pr.employee_id=e.employee_id
group by e.employee_id,e.name;

---7️⃣ Find employees who’ve had at least two performance reviews in a row with the same score


SELECT e.employee_id,
e.name,
pr.review_date,
pr.score,lag(pr.score) over(PARTITION by e.employee_id order by pr.review_date) 
as prev_score, 
case when pr.score = lag(pr.score) over(PARTITION by e.employee_id order by pr.review_date) then "YES"
else "NO" end as same_as_before from employees as e 
join performance_reviews as pr on pr.employee_id= e.employee_id;

---8️⃣ Use a CTE to get each employee's review trend (increasing, decreasing, stable) based on last 3 reviews.

with trend as (SELECT e.employee_id,
e.name,
pr.review_date,
pr.score,
lag(pr.score,1) over(PARTITION by e.employee_id order by pr.review_date) as prev_1,
lag(pr.score,2) over(PARTITION by e.employee_id order by pr.review_date) as prev_2 from employees as e 
join performance_reviews as pr on pr.employee_id= e.employee_id) 

SELECT *,case when prev_2 is not null and  prev_2 > prev_1 and prev_1 >score then "Increasing" 
when prev_2 is not null and prev_2 < prev_1 and prev_1 < score then "Decreasing" 
when prev_2 is not null and  prev_2 = prev_1 and prev_1 = score then "Stable"
else "N/A" end as review_trend 
from trend;

---9️⃣ Create a department-level summary with GROUP_CONCAT of top 3 earners (by salary)
with temp_1 as (SELECT * from
(SELECT e.name,
e.salary,
d.department_id,
d.department_name,rank() over(PARTITION by d.department_id order by e.salary desc) as rnk 
from employees as e 
join departments as d on d.department_id=e.department_id) as t 
where rnk<=3)
SELECT department_id,
department_name,
group_concat(DISTINCT name) as top_3_earners from temp_1
group by department_id,department_name
;

---{10} List all job titles held by each employee along with the date they started the title.

SELECT e.employee_id,
e.name,
jt.title,
jt.start_date 
from employees as e 
join job_titles as jt on jt.employee_id=e.employee_id
group by e.employee_id,jt.start_date;





