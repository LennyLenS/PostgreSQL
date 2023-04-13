--task 1

SELECT * FROM bd_employees WHERE email ~ '[\D].+[\D].+[\D].+@';


--task 2

SELECT last_name, street, postal_code 
	FROM bd_employees emp INNER JOIN bd_departments dep ON emp.department_id = dep.id
	WHERE last_name ~ '^[A-Z][a-z]+$';

--task 3

SELECT last_name, (regexp_matches(email, '^(.{2})', 'g'))[1] || '_' || (regexp_matches(email, '(@.+)', 'g'))[1] AS "email"
	FROM bd_employees;


--task 4

SELECT *
	FROM bd_employees WHERE first_name ~* '^([^eyuioa]*[eyuioa]?){0,3}[^eyuioa]*$';