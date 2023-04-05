USE person;
SELECT * FROM personal_data ORDER BY birth_date DESC;
SELECT * FROM address;
INSERT INTO personal_data(national_code, first_name, last_name, post_code ,gender, birth_date) 
                    VALUES(198206063654,'Amir','Anissian',12065,'M','1983-06-06');
# window function  
                  
SELECT *,  row_number() OVER (PARTITION BY post_code) AS num_pple_per_add
FROM personal_data
JOIN address 
USING(post_code);

use employees;
CREATE INDEX emp_index ON employees(first_name);
 SELECT first_name 
FROM employees
WHERE first_name = 'Aamer';
INSERT INTO employees (
    emp_no      ,
    birth_date  ,
    first_name  ,
    last_name   ,
    gender  	,    
    hire_date
    )
    VALUES(11001,'1984-12-12','Amir','Aniss','M','2000-01-01');

EXPLAIN SELECT *
FROM employees;
CREATE INDEX emp_no_index ON employees(emp_no);
CREATE INDEX emp_no1_index ON salaries(emp_no);
CREATE INDEX sal_index ON salaries(salary);
CREATE INDEX from_index ON salaries(from_date);
CREATE INDEX dep_no_index ON dept_emp(emp_no);
CREATE INDEX dep_no1_index ON dept_emp(dept_no);

#query plan
SELECT 
    sal.salary,dept_emp.dept_no, e.emp_no
FROM
    dept_emp
        INNER JOIN
    employees AS e USING (emp_no)
        INNER JOIN
        salaries AS sal
    
WHERE
    sal.salary = 60000 AND dept_no = 'd004';

SELECT *,  sum(salary) OVER (PARTITION BY dept_no) AS num_pple_per_add
FROM salaries
JOIN dept_emp
USING(emp_no);

