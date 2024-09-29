
# HR Budget and Performance Analysis

## Project Overview

In this project, we analyze various HR-related data such as employee information, salary data, department budgets, and project details to identify which departments or projects are at risk of going over budget or underperforming. The goal is to organize the data, structure it properly for analysis, and create a comprehensive dashboard that provides insights into budget allocation, employee performance, and project management.

![image](https://github.com/user-attachments/assets/bcbd910b-7f48-4f34-af50-d2465d5a962c)

---

## Use Case

The primary question we aim to solve is: **Which projects and departments are at risk of being over budget or underperforming?** By organizing and analyzing data, we provide insights that will help manage workforce performance, monitor financial risks, and identify areas that require corrective action.


## Requirements

To complete this project, you’ll need the following:

- **SQL Server**: If you don’t have **Microsoft SQL Server** and **SQL Server Management Studio (SSMS)** installed, please download the latest versions. At the time of this project, I used:
  - **SQL Server 2022**
  - **SSMS 20.2**
  - You can download them from the official Microsoft website: [SQL Server 2022](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) and [SSMS 20.2](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms).

---

## Steps to Reproduce the Project

1. **Download the Files:**
   - Download the dataset files (`flat_files.zip`), SQL queries (`budget_analysis.sql`), and the Power BI file (`dashboard.pbix`) from this repository.

2. **Create a Database in MS SQL Server:**
   - Open SSMS and create a new database in SQL Server.
   - Import the flat files into SQL Server by using the **Import Flat File Wizard** to create the tables.

3. **Data Structuring:**
   - Structure the data by joining different tables to organize the required data. This includes using **Common Table Expressions (CTEs)** to simplify complex queries.

   Here’s the main SQL query used for extracting and structuring the data:

   ```sql
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
   ```

4. **Connect MS SQL Server to Power BI:**
   - In Power BI, connect to the **MS SQL Server** and use **Power Query** to load the structured data into Power BI.
   - Apply any necessary transformations, custom columns, and calculations to the data.

5. **Create the Dashboard:**
   - Start building the Power BI dashboard to visualize the insights, such as department performance, budget health, salary distribution, and project progress.
   - The `.pbix` file included in this repository showcases the final dashboard.

---

## Files in the Repository

- **`flat_files.zip`**: Raw data files used to populate the database.
- **`budget_analysis.sql`**: SQL file containing all queries used for data cleaning, transformation, and extraction.
- **`dashboard.pbix`**: Power BI file showcasing the dashboard created from the structured data.
- **`dashboard_screenshot.png`**: Screenshot of the final Power BI dashboard.

---

## Project Highlights

- **Data Cleaning**: Cleaned and transformed flat files to ensure accurate data for analysis.
- **CTE Usage**: Simplified the query structure using Common Table Expressions for better readability and maintainability.
- **Dynamic Dashboard**: Built a dashboard in Power BI to visualize employee performance, project budgets, and risk areas in departments.

Feel free to clone the repository and try it yourself!
