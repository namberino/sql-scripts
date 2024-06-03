

/*
DELETE FROM Enrollment
DELETE FROM CourseOffering
DELETE FROM Course
DELETE FROM Instructor
DELETE FROM Student
DELETE FROM Department
*/

INSERT INTO Student VALUES (1, 'John', 'Doe', '2001-02-15', 'john.doe@email.com');
INSERT INTO Student VALUES (2, 'Jane', 'Doe', '2002-03-22', 'jane.doe@email.com');
INSERT INTO Student VALUES (3, 'Mike', 'Smith', '2000-04-10', 'mike.smith@email.com');
INSERT INTO Student VALUES (4, 'Sara', 'Johnson', '2001-05-14', 'sara.johnson@email.com');
INSERT INTO Student VALUES (5, 'Alex', 'Williams', '2002-06-18', 'alex.williams@email.com');
INSERT INTO Student VALUES (6, 'Emma', 'Brown', '2001-07-21', 'emma.brown@email.com');
INSERT INTO Student VALUES (7, 'James', 'Davis', '2000-08-30', 'james.davis@email.com');
INSERT INTO Student VALUES (8, 'Olivia', 'Miller', '2002-09-25', 'olivia.miller@email.com');
INSERT INTO Student VALUES (9, 'William', 'Wilson', '2001-10-09', 'william.wilson@email.com');
INSERT INTO Student VALUES (10, 'Ava', 'Moore', '2000-11-15', 'ava.moore@email.com');


---

INSERT INTO Department VALUES (1, 'Computer Science', 'Dr. Alan Turing');
INSERT INTO Department VALUES (2, 'Mathematics', 'Dr. Isaac Newton');
INSERT INTO Department VALUES (3, 'Physics', 'Dr. Albert Einstein');
INSERT INTO Department VALUES (4, 'Chemistry', 'Dr. Marie Curie');
INSERT INTO Department VALUES (5, 'Biology', 'Dr. Charles Darwin');
INSERT INTO Department VALUES (6, 'English', 'Dr. William Shakespeare');
INSERT INTO Department VALUES (7, 'History', 'Dr. Herodotus');
INSERT INTO Department VALUES (8, 'Art', 'Dr. Leonardo da Vinci');
INSERT INTO Department VALUES (9, 'Music', 'Dr. Wolfgang Amadeus Mozart');
INSERT INTO Department VALUES (10, 'Philosophy', 'Dr. Socrates');


---

INSERT INTO Course VALUES (1, 'Introduction to Computer Science', 1);
INSERT INTO Course VALUES (2, 'Calculus I', 1);
INSERT INTO Course VALUES (3, 'General Physics', 3);
INSERT INTO Course VALUES (4, 'Organic Chemistry', 4);
INSERT INTO Course VALUES (5, 'General Biology', 5);
INSERT INTO Course VALUES (6, 'English Literature 101', 6);
INSERT INTO Course VALUES (7, 'World History', 7);
INSERT INTO Course VALUES (8, 'Introduction to Painting', 8);
INSERT INTO Course VALUES (9, 'Music Theory', 9);
INSERT INTO Course VALUES (10, 'Introduction to Philosophy', 10);


---

INSERT INTO Instructor VALUES (1, 'Alan', 'Turing', 1, 'alan.turing@university.com');
INSERT INTO Instructor VALUES (2, 'Isaac', 'Newton', 2, 'isaac.newton@university.com');
INSERT INTO Instructor VALUES (3, 'Albert', 'Einstein', 3, 'albert.einstein@university.com');
INSERT INTO Instructor VALUES (4, 'Marie', 'Curie', 4, 'marie.curie@university.com');
INSERT INTO Instructor VALUES (5, 'Charles', 'Darwin', 5, 'charles.darwin@university.com');
INSERT INTO Instructor VALUES (6, 'William', 'Shakespeare', 6, 'william.shakespeare@university.com');
INSERT INTO Instructor VALUES (7, 'Herodotus', 'Historicus', 7, 'herodotus.historicus@university.com');
INSERT INTO Instructor VALUES (8, 'Leonardo', 'da Vinci', 8, 'leonardo.davinci@university.com');
INSERT INTO Instructor VALUES (9, 'Wolfgang', 'Mozart', 9, 'wolfgang.mozart@university.com');
INSERT INTO Instructor VALUES (10, 'Socrates', 'Philosophicus', 10, 'socrates.philosophicus@university.com');


---

INSERT INTO CourseOffering VALUES (1, 1, 8, 2023, 'Fall');
INSERT INTO CourseOffering VALUES (2, 2, 2, 2023, 'Fall');
INSERT INTO CourseOffering VALUES (3, 3, 3, 2023, 'Spring');
INSERT INTO CourseOffering VALUES (4, 4, 4, 2023, 'Spring');
INSERT INTO CourseOffering VALUES (5, 5, 5, 2023, 'Fall');
INSERT INTO CourseOffering VALUES (6, 6, 6, 2022, 'Fall');
INSERT INTO CourseOffering VALUES (7, 7, 7, 2024, 'Spring');
INSERT INTO CourseOffering VALUES (8, 8, 9, 2024, 'Spring');
INSERT INTO CourseOffering VALUES (9, 9, 9, 2024, 'Fall');
INSERT INTO CourseOffering VALUES (10, 10, 10, 2019, 'Fall');
INSERT INTO CourseOffering VALUES (11, 1, 10, 2023, 'Spring');
INSERT INTO CourseOffering VALUES (12, 2, 9, 2023, 'Spring');
INSERT INTO CourseOffering VALUES (13, 3, 8, 2023, 'Fall');
INSERT INTO CourseOffering VALUES (14, 4, 7, 2023, 'Fall');
INSERT INTO CourseOffering VALUES (15, 5, 6, 2024, 'Spring');
INSERT INTO CourseOffering VALUES (16, 6, 5, 2024, 'Spring');
INSERT INTO CourseOffering VALUES (17, 7, 4, 2020, 'Fall');
INSERT INTO CourseOffering VALUES (18, 8, 3, 2021, 'Fall');
INSERT INTO CourseOffering VALUES (19, 9, 9, 2024, 'Spring');
INSERT INTO CourseOffering VALUES (20, 10, 8, 2020, 'Spring');


---

INSERT INTO Enrollment VALUES (1, 1, 1, '2020-09-01');
INSERT INTO Enrollment VALUES (2, 3, 3, '2021-08-11');
INSERT INTO Enrollment VALUES (3, 3, 5, '2020-07-15');
INSERT INTO Enrollment VALUES (4, 4, 7, '2023-02-05');
INSERT INTO Enrollment VALUES (5, 5, 7, '2023-04-15');
INSERT INTO Enrollment VALUES (6, 6, 2, '2022-05-25');
INSERT INTO Enrollment VALUES (7, 7, 4, '2023-12-17');
INSERT INTO Enrollment VALUES (8, 8, 6, '2021-10-10');
INSERT INTO Enrollment VALUES (9, 9, 8, '2023-12-12');
INSERT INTO Enrollment VALUES (10, 10, 10, '2023-04-01');
INSERT INTO Enrollment VALUES (11, 1, 2, '2023-06-21');
INSERT INTO Enrollment VALUES (12, 3, 4, '2023-07-24');
INSERT INTO Enrollment VALUES (13, 3, 6, '2020-09-29');
INSERT INTO Enrollment VALUES (14, 4, 8, '2019-08-20');
INSERT INTO Enrollment VALUES (15, 5, 10, '2023-02-20');
INSERT INTO Enrollment VALUES (16, 6, 1, '2022-12-01');
INSERT INTO Enrollment VALUES (17, 7, 3, '2022-10-11');
INSERT INTO Enrollment VALUES (18, 8, 5, '2023-12-01');
INSERT INTO Enrollment VALUES (19, 9, 7, '2019-11-10');
INSERT INTO Enrollment VALUES (20, 10, 7, '2019-08-02');
