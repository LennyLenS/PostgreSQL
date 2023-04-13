--task 1

SELECT  first_name || ' ' || last_name AS "ФИО", 
		salary AS "Оклад", 
		(salary * 1.302)::float AS "Оклад мину с учётом начислений на оплату труда"
		FROM employees;

--task 2

SELECT  first_name AS "Имя",
		last_name AS "Фамилия",
		salary AS "Оклад",
		commission_pct AS "Ставка комиссии"	
		FROM employees
		WHERE salary >= 10000 AND commission_pct IS NOT NULL
		ORDER BY commission_pct DESC;

--task 3

SELECT  first_name AS "Имя",
		last_name AS "Фамилия",
		CASE WHEN commission_pct IS NULL THEN 0
			 ELSE commission_pct
		END AS "Ставка комиссии"
		FROM employees;

--task 4
SELECT  MAX(salary) AS "Максимальная зарплата",
		MIN(salary) AS "Минимальная зарплата",
		ROUND(AVG(salary), 2) AS "Средняя зарплата"
		FROM employees;