-- 1
-- a
select i.ID, i.name, count(t.course_id) as num_courses_taught from instructor i left join teaches t on i.ID = t.ID group by i.ID, i.name;

-- b
select ID, name, (select count(course_id) from teaches where instructor.ID = teaches.ID) as num_courses_taught from instructor;

-- c
select s.course_id, s.sec_id, s.semester, s.year, coalesce(i.name, '—') as instructor_name from section s left join teaches t on s.course_id = t.course_id and s.sec_id = t.sec_id and s.semester = t.semester and s.year = t.year left join instructor i on t.ID = i.ID where s.semester = 'Spring' and s.year = 2010;

-- d
select d.dept_name, count(i.ID) as num_instructors from department d left join instructor i on d.dept_name = i.dept_name group by d.dept_name;

-- 2
-- a
select ID, sum(gp.point * c.credits) Aas total_grade_points from takes t join grade_points gp on t.grade = gp.grade join course c on t.course_id = c.course_id where ID = '12345' group by ID;

-- b
select ID, sum(gp.point * c.credits) / sum(c.credits) as GPA from takes t join grade_points gp on t.grade = gp.grade join course c on t.course_id = c.course_id group by ID;

-- c
select ID, avg(gp.point * c.credits) as average_grade_points from takes t join grade_points gp on t.grade = gp.grade join course c on t.course_id = c.course_id group by ID;

-- d
update instructor set salary = salary * 1.1 where dept_name = 'Comp. Sci.';

-- e
delete from course where course_id not in (select distinct course_id from section);

-- f
insert into instructor select ID, name, dept_name, 10000 from student where tot_cred > 100;

-- 3
create view student_grades as select t.ID, avg(case when t.grade is not null then gp.point * c.credits else null end) as GPA from takes t join grade_points gp on t.grade = gp.grade join course c on t.course_id = c.course_id group by t.ID;
