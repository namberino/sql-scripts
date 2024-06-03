use Company;

select * from employees;
select * from departments;

select first_name, last_name, hire_date from employees;

select concat(first_name, ", ", job_id) as EmployeeAndTitle from employees;

select hire_date, first_name, department_id from employees;

select concat(employee_id, ",", first_name, ",", last_name, ",", email, ",", phone_number, ",", hire_date, ",", job_id, ",", salary, ",", manager_id, ",", department_id) as OUTPUT from employees;

select first_name, salary from employees where salary > 2000;

select first_name as Name, hire_date as StartDate from employees;

select first_name, hire_date from employees order by hire_date;

select first_name, salary from employees order by salary desc;

select ename, dept_no from (select first_name as ename, department_id as dept_no, salary from employees order by salary desc) as a;

select last_name, job_title from employees join jobs on employees.job_id = jobs.job_id where manager_id is null;

select last_name, job_title, salary from employees join jobs on employees.job_id = jobs.job_id where (jobs.job_title = "Finance Manager" or jobs.job_title = "President") and (employees.salary != 2500 or employees.salary != 3500 or employees.salary != 5000);

select max(salary) as MaxSal, min(salary) as MinSal, avg(salary) as AverageSal from employees;

select departments.department_id, sum(salary) as total_sal from departments join employees on employees.department_id = departments.department_id group by department_id;

select departments.department_id, count(employee_id) as total_employee from departments join employees on employees.department_id = departments.department_id group by department_id;

select departments.department_id, sum(salary) as total_sal from departments join employees on employees.department_id = departments.department_id group by department_id;

select first_name from employees where salary = 0 or salary is null;

select first_name, department_id, coalesce(salary, "No Commission") as commission from employees;

select first_name, coalesce(salary * 2, "No Commission") as commission from employees;

select e1.first_name, e1.department_id from employees e1 join employees e2 on e1.first_name = e2.first_name and e1.department_id = e2.department_id;

select count(employee_id) as 'Employee Count' from employees join departments on employees.department_id = departments.department_id join locations on departments.location
_id = locations.location_id where city = "Southlake";
