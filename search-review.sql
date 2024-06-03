-- TRUY VẤN
-- 1. Liệt kê tất cả các khóa học được cung cấp trong học kỳ Mùa thu năm 2023
SELECT Course.id, Course.name 
from Course join CourseOffering on Course.id = CourseOffering.course_id
where CourseOffering.semester = 'Fall' and CourseOffering.year = 2023

-- 2. Tìm tất cả sinh viên đã đăng ký một khóa học cụ thể, ví dụ: Giới thiệu về Khoa học Máy tính
SELECT Student.id, CONCAT(Student.first_name, ' ', Student.last_name) as StudentName, Course.name
from Student 
join Enrollment on Student.id = Enrollment.student_id
join CourseOffering on Enrollment.course_offering_id = CourseOffering.id
join Course on CourseOffering.course_id = Course.id
where Course.name = 'Calculus I';

-- 3. Đếm số lượng sinh viên từng khoa
SELECT D.id, D.name, count(S.id)
from Student as S
join Enrollment as E on S.id = E.student_id
join CourseOffering as CO on E.course_offering_id = CO.id
join Course as C on CO.course_id = C.id
right join Department as D on C.department_id = D.id
GROUP BY D.id, D.name;

-- 4. Lấy danh sách học viên chưa đăng ký khóa học nào
select * 
from Student
where Student.id not in  
(select student_id from Enrollment)

-- 5. Hiển thị các khóa học không có tuyển sinh
SELECT D.id, D.name, count(S.id) 
from Student as S
join Enrollment as E on S.id = E.student_id
join CourseOffering as CO on E.course_offering_id = CO.id
join Course as C on CO.course_id = C.id
right join Department as D on C.department_id = D.id
GROUP BY D.id, D.name 
HAVING count(S.id) = 0

-- 6. Instructors teaching more than 1 course this year
select i.id, i.first_name, i.last_name, i.department_id from Instructors as i
join CourseOffering as co on i.id = co.instructor_id
group by co.instructor_id, i.id, i.first_name, i.last_name, i.department_id, co.[year]
having count(co.id) > 1 and co.[year] = year(getdate())

-- 7. Find all instructors who are currently not assigned to any course offerings
select * from Instructor as I
where i.id not in (
    select distinct instructor_id from CourseOffering
)

-- 8. Find the name of the department with the highest number of courses offered
select d.name from Department
where d.id = (
    select d.id, max(count_course_id) from (
        select d.id, count(c.id) as count_course_id from Department as d
        join Course as c on d.id = c.department_id
        group by d.id
    ) t1
)

-- 9. List students who are taking the same course as 'John Doe'
select first_name, last_name from Student
join Enrollment on Student.id = Enrollment.student_id
join CourseOffering on Enrollment.course_offering_id = CourseOffering.id
join Course on CourseOffering.course_id = Course.id
where Course.id in (
    select Course.id from Student
    join Enrollment on Student.id = Enrollment.student_id
    join CourseOffering on Enrollment.course_offering_id = CourseOffering.id
    join Course on CourseOffering.course_id = Course.id
    where Student.first_name = "John" and Student.last_name = "Doe"
) and first_name not like "John" and last_name not like "Doe"
