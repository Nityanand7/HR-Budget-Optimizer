--Project Status
WITH project_status as
(SELECT project_id, project_name, project_budget, 'upcoming' AS status
FROM [upcoming projects]
UNION ALL
SELECT project_id, project_name, project_budget, 'completed' AS status
FROM completed_projects)


--Main Table
SELECT e.employee_id, e.first_name, e.last_name, e.job_title, e.salary, d.Department_Name, d.Department_Budget, d.Department_Goals, pa.project_id, p.project_name, p.project_budget, p.status 
FROM employees e
JOIN departments d
ON e.department_id = d.Department_ID
JOIN project_assignments pa
ON pa.employee_id = e.employee_id
JOIN project_status p
ON p.project_id = pa.project_id