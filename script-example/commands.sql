-- intersection
select course_id from section where semester = "Fall" and year = 2009 intersect select course_id from section where semester = "Spring" and year = 2010;
