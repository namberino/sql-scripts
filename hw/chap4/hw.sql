-- Search for comp sci subject with 3 credits
select title from course where credits = 3 and dept_name = 'Comp. Sci.';

-- Find ID of students taught by Einstein
select distinct takes.ID from takes where course_id = (select course_id from teaches where teaches.ID = (select ID from instructor where name = 'Einstein'));

-- Find highest instructor salary
select max(salary) from instructor;

-- Find the instructors with the highest salary
select name from instructor where salary = (select max(salary) from instructor);

-- Find the number of students signed up to each department in fall 2017
select course_id, count(distinct ID) from takes where semester = 'Fall' and year = 2017 group by course_id;

-- Find the courses with the max number of sign ups in fall 2017 
select course_id, count(distinct ID) from takes where semester = 'Fall' and year = 2009 group by course_id having count(distinct ID) = (select max(ct) from (select course_id, count(distinct ID) as ct from takes where semester = 'Fall' and year = 2009 group by course_id) t);

-- Add new row into course
insert into course values ("CS-001", "Weekly Seminar", "Comp. Sci.", 0);

-- Add new row into section
insert into section values ("CS-001", 1, "Fall", 2009, "Packard", 101, 'A');

-- Add all comp sci student to seminar 
select distinct ID from takes natural join course where dept_name = "Comp. Sci.";
insert into takes values 
("00128", "CS-001", 1, "Fall", 2009, null),
("12345", "CS-001", 1, "Fall", 2009, null),
("45678", "CS-001", 1, "Fall", 2009, null),
("54321", "CS-001", 1, "Fall", 2009, null),
("76543", "CS-001", 1, "Fall", 2009, null),
("98765", "CS-001", 1, "Fall", 2009, null);

-- Delete particular student from sign up to CS-001
delete from takes where ID = (select ID from (select distinct ID from section natural join student natural join takes where course_id = "CS-001" and name = "Chavez") as t) and course_id = "CS-001";

-- Delete CS-001 (error because foreign keys that has this data has not been removed)
delete from	course where course_id = "CS-001";

-- Delete from takes any thing that has the course id of the database subject
delete from takes where course_id = (select course_id from course where title like "%Database%");

-- 3.3
Select Fname, Address from EMPLOYEE where Dno = 1;
Select Fname, Ssn from EMPLOYEE where EMPLOYEE.Dno in (select DEPARTMENT.Dnumber from DEPARTMENT where Dname = ‘Research’);
Select Pname, Pnumber from PROJECT where PROJECT.Dnum in (select DEPARTMENT.Dnumber from DEPARTMENT where Dname = ‘Administration’);
Select Pname from EMPLOYEE where EMPLOYEE.Ssn in (select WORK_ON.Essn from WORK_ON where Hours > 10 and Pno = 1;
Select * from EMPLOYEE where EMPLOYEE.Fname = DEPENDENT.Dependent_name;
Select * from EMPLOYEE where Fname = ‘Franklin’ and Lname = ‘Wong’;
Select PROJECT.Pname, SUM(WORK_ON.Hours) from PROJECT, WORK_ON;
Select Fname from EMPLOYEE;
Select Pname from EMPLOYEE where Ssn not in WORK_ON.Essn;
Select Dname, AVG(EMPLOYEE.Salary) from DEPARTMENT, EMPLOYEE;
Select AVG(EMPLOYEE.Salary from EMPLOYEE where Sex = ‘F’;
