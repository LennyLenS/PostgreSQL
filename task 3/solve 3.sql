--task 1

SELECT  first_name AS "FIRST_NAME",
		last_name AS "LAST_NAME",
		min_salary::int AS "MIN_SALARY"
		FROM employees emp INNER JOIN jobs j ON j.job_id = emp.job_id and j.min_salary >= 3000
		ORDER BY min_salary;
		
--task 2

SELECT  first_name AS "FIRST_NAME",
		start_date AS "START_DA",
		end_date AS "END_DATE",
		Department_name AS "Department_name"
		FROM employees emp  INNER JOIN Departments Dep ON emp.Department_id = Dep.Department_id
							INNER JOIN Job_history jh ON emp.Employee_id = jh.Employee_id
		ORDER BY start_date;

--task 3
SELECT  first_name AS "Имя",
		last_name AS "Фамилия",
		salary AS "Оклад",
		min_salary::int AS "Мин.оклад"
		FROM employees emp  INNER JOIN jobs j ON emp.job_id = j.job_id AND emp.salary <= j.min_salary * 1.2;

--task 4
SELECT  emp1.last_name AS "Фамилия_Р",
		to_char(jh1.start_date, 'DD.MM.YYYY') AS "Дата_Р",
		emp2.last_name AS "Фамилия_М",
		to_char(jh2.start_date, 'DD.MM.YYYY') AS "Дата_М"
		FROM employees emp1, employees emp2, job_history jh1, job_history jh2
		WHERE   emp1.manager_id = emp2.employee_id AND
				jh1.start_date < jh2.start_date AND
				jh1.employee_id = emp1.employee_id AND
				jh2.employee_id = emp2.employee_id;

--task 5
SELECT  emp.first_name AS "Имя",
		emp.last_name AS "Фамилия",
		emp.job_id AS "Должность",
		emp.salary::int AS "Оклад"
		FROM employees emp
		WHERE  (salary, job_id) in (SELECT MIN(min_salary), job_id FROM jobs GROUP BY job_id);
		