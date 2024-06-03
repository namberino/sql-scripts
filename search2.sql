-- 1
select last_name, departments.department_id,
departments.department_name
from employees
join departments on employees.department_id = departments.department_id;


-- 2
select distinct(job_title), street_address from jobs
join employees on jobs.job_id = employees.job_id
join departments on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id
where departments.department_id = 1234;


-- 3
-- Select the last name, department name, location ID,
-- and commission status of employees from the "employees" table.
select last_name, department_name, location_id,
case 
	when (salary - min_salary) > 0 then 'commission'
	else 'no_commission'
end as commission
from employees
join jobs on employees.job_id = jobs.job_id
join departments on employees.department_id = departments.department_id;


-- 4
select last_name, department_name
from employees
join departments on employees.department_id = departments.department_id
where last_name like '%a%' or '%A%';


-- 5
select last_name, departments.department_id, department_name from employees
join departments on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id
where city like 'Southlake';


-- 6
select e.last_name as 'e last_name', e.phone_number as 'e phone_number', m.last_name as 'm last_name', m.phone_number as 'm phone_number'
from employees as e
join employees as m on e.manager_id = m.employee_id
join jobs on e.job_id = jobs.job_id;


-- 7
select e.last_name as 'Employees', e.phone_number as 'e_phone', m.last_name as 'Manager', m.phone_number as 'm_phone'
from employees as e 
join employees as m on e.manager_id = m.employee_id
join jobs on e.job_id = jobs.job_id;


-- 8
select e1.last_name, e2.last_name, departments.department_id
from employees as e1
join departments on e1.department_id = departments.department_id
join employees as e2 on e1.department_id = e2.department_id and e1.employee_id != e2.employee_id;


-- 9
select concat(e.first_name, ' ', e.last_name) as 'name', jobs.job_title as 'job', departments.department_name as 'department name', e.salary as 'salary',
case
	when (e.salary) >= 5000 then 'A'
	when (e.salary) >= 3000 then 'B'
	else 'C'
end as grade
from employees as e
join jobs on e.job_id = jobs.job_id
join departments on e.department_id = departments.department_id;


-- 10
select concat(e.first_name, ' ', e.last_name) as 'Employee name', e.hire_date as 'emp_hire_date', concat(m.first_name, ' ', m.last_name) as 'Manager name', m.hire_date as 'man_hire_date'
from employees as e
join employees as m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;
