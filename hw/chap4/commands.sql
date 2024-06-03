-- Select all name from instructor where the instructor's salary is more than that of all the comp sci instructor
select distinct T.name from instructor as T where T.salary > all (select salary from instructor where dept_name = 'Comp. Sci.');

-- Find courses in fall 2009 or in spring 2010
(select * from section where semester = 'Fall' and year = 2009) union (select * from section where semester = 'Spring' and year = 2010);

-- Find courses in fall 2009 and in spring 2010
(select * from section where semester = 'Fall' and year = 2009) intersect (select * from section where semester = 'Spring' and year = 2010);

-- Find courses in fall 2009 but not in spring 2010
(select * from section where semester = 'Fall' and year = 2009) except (select * from section where semester = 'Spring' and year = 2010);

-- Calculate average salary of each department
select dept_name, avg(salary) from instructor group by dept_name;

-- Calculate average salary of each department whose average salary is > 42000
select dept_name, avg(salary) from instructor group by dept_name having avg(salary) > 42000;
