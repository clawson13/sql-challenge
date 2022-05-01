-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", e.sex AS "Sex", s.salary AS "Salary"
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "1986 Hire Date"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.

SELECT d.dept_no AS "Department No", ds.dept_name AS "Department Name", d.emp_no AS "Mgr Employee No", e.last_name AS "Last Name", e.first_name AS "First Name"
FROM dept_manager d
INNER JOIN departments ds
ON d.dept_no = ds.dept_no
INNER JOIN employees e
ON d.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.

SELECT d.emp_no AS "Employee No", e.last_name AS "Last Name", e.first_name AS "First Name", ds.dept_name AS "Department Name"
FROM dept_emp d
INNER JOIN employees e
ON d.emp_no = e.emp_no
INNER JOIN departments ds
ON d.dept_no = ds.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT d.emp_no AS "Employee No", e.last_name AS "Last Name", e.first_name AS "First Name", ds.dept_name AS "Department Name"
FROM dept_emp d
INNER JOIN employees e
ON d.emp_no = e.emp_no
INNER JOIN departments ds
ON d.dept_no = ds.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and
-- department name.

SELECT d.emp_no AS "Employee No", e.last_name AS "Last Name", e.first_name AS "First Name", ds.dept_name AS "Department Name"
FROM dept_emp d
INNER JOIN employees e
ON d.emp_no = e.emp_no
INNER JOIN departments ds
ON d.dept_no = ds.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name AS "Last Name", COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;