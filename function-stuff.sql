use company;

select employee_id, first_name, last_name, salary
from employees
where salary > all (
	select avg(salary)
    from employees join departments
    on employees.department_id = departments.department_id
    group by departments.department_id
);

/*
DELIMITER //

create procedure GetAvgSalDepartment(in dept_id int)
begin
    declare avg_salary decimal(8, 2);
    
    select avg(salary) into avg_salary
    from employees
    where department_id = dept_id;
    
    if avg_salary is null then
        SELECT CONCAT('No employees found in department ', dept_id) as Message;
    else
        select concat('Average salary in department ', dept_id, ' is ', avg_salary) as Message;
    end if;
end//

DELIMITER ;
*/

call GetAvgSalDepartment(1);

/*
DELIMITER //

create procedure TransferEmployee(in dept_id int, in em_id int)
begin
	declare min_salary decimal(8, 2);

    -- get min salary of the dst department
    select min(salary) into min_salary
    from employees
    where employees.department_id = dept_id;

    -- if the employee's salary is lower than the minimum salary of the destination department, adjust the salary
    if min_salary is not null then
		update employees
		set salary = min_salary
		where employee_id = em_id and salary < min_salary;
    end if;

    -- update the department of the employee
    update employees
    set department_id = dept_id
    where employee_id = em_id;
    
    select concat('Employee ', em_id, ' has been transferred to department ', dept_id) as Message;
end//

DELIMITER ;
*/

-- call TransferEmployee(11, 107);

-- select * from employees where employee_id = 107;

/*
DELIMITER //

create procedure UpdateDepartmentDetails(in old_dept_id int, in new_dept_id int, in new_dept_name varchar(30))
begin
	declare exit handler for sqlexception
    begin
		rollback;
        resignal;
    end;
    
    start transaction;
    
    -- update department details
    update departments
    set department_id = new_dept_id, department_name = new_dept_name
    where department_id = old_dept_id;
    
    -- reassign employees
    if row_count() > 0 then
        update employees
        set department_id = new_dept_id
        where department_id = old_dept_id;
    end if;
end//

DELIMITER ;
*/

-- call UpdateDepartmentDetails(11, 12, "Financial");
/*select * from departments;
select * from employees where department_id = 12;*/

/*
DELIMITER //
create trigger log_deleted_employee
before delete on employees
for each row
begin 
	insert into deleted_employees(employee_id, first_name, last_name, department_id, deletion_time)
    values (old.employee_id, old.first_name, old.last_name, old.department_id, now());
end//
DELIMITER ;

create table deleted_employees (
    log_id int auto_increment primary key,
    employee_id int,
    first_name varchar(20),
    last_name varchar(25),
    department_id int,
    deletion_time timestamp
);
*/

/*
DELIMITER //

create trigger handle_manager_deletion
before delete on employees
for each row
begin
    declare num_employees int;

    -- check if the employee being deleted is a manager
	select count(*) into num_employees
	from employees
	where manager_id = old.employee_id;

	if num_employees > 0 then
        signal sqlstate '45000' -- undandled exception error
        set message_text = 'Cannot delete manager. Reassign employees first.';
    end if;
end//

DELIMITER ;
*/

/*
DELIMITER //
create trigger handle_department_deletion
before delete on departments
for each row
begin
	declare new_dept_id int;
    
    -- find valid department
    select department_id into new_dept_id
    from departments
    where department_id <> old.department_id
    limit 1;
    
    -- if valid department is found
    if new_dept_id is not null then
		update employees
        set department_id = new_dept_id
        where department_id = old.department_id;
	else -- if no valid department is found
		signal sqlstate '45000'
        set message_text = 'Cannot delete department. No valid new department found for employees reassignment.';
    end if;
end//
DELIMITER ;
*/