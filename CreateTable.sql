

/*
DROP TABLE Enrollment
DROP TABLE CourseOffering
DROP TABLE Instructor
DROP TABLE Course
DROP TABLE Department
DROP TABLE Student
*/
-- DDL to create a student manangement database
CREATE TABLE Student (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    head_of_department VARCHAR(255)
);

CREATE TABLE Course (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department_id INT,
	FOREIGN KEY (department_id) REFERENCES Department(id)
);

CREATE TABLE Instructor (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    email VARCHAR(255) UNIQUE,
	FOREIGN KEY (department_id) REFERENCES Department(id)
);

CREATE TABLE CourseOffering (
    id INT PRIMARY KEY,
    course_id INT,
    instructor_id INT,
    year INT,
    semester VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES Course(id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(id)
);

CREATE TABLE Enrollment (
    id INT PRIMARY KEY,
    student_id INT,
    course_offering_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (course_offering_id) REFERENCES CourseOffering(id)
);

