create database University;

use University;

create table instructor(
    ID varchar(6),
    name varchar(20),
    dept_name varchar(15),
    salary int,
    primary key (ID)
);

create table course(
    course_id varchar(10),
    title varchar(50),
    dept_name varchar(15),
    credits tinyint,
    primary key (course_id)
);

create table prereq(
    course_id varchar(10),
    prereq_id varchar(10),
    primary key (course_id, prereq_id),
	foreign key (course_id) references course(course_id)
);

create table department(
    dept_name varchar(15),
    building varchar(10),
    budget int,
    primary key (dept_name, building)
);

create table teaches(
    ID varchar(6),
    course_id varchar(10),
    sec_id tinyint,
    semester varchar(10),
    year smallint,
    primary key (ID, course_id, sec_id, semester, year),
	foreign key (ID) references instructor(ID)
);

create table section(
    course_id varchar(10),
    sec_id tinyint,
    semester varchar(10),
    year smallint,
    building varchar(10),
    room_number smallint,
    time_slot_id char(1),
    primary key (course_id, sec_id, semester, year),
	foreign key (course_id) references course(course_id)
);

create table student(
    ID varchar(6),
    name varchar(20),
    dept_name varchar(15),
    tot_cred tinyint,
    primary key (ID)
);

create table takes(
    ID varchar(6),
    course_id varchar(10),
    sec_id tinyint,
    semester varchar(10),
    year smallint,
    grade varchar(2),
    primary key (ID, course_id, sec_id, semester, year),
	foreign key (ID) references student(ID)
);

insert into instructor values
("10101", "Srinivasan", "Comp. Sci.", 65000),
("12121", "Wu", "Finance", 90000),
("15151", "Mozart", "Music", 40000),
("22222", "Einstein", "Physics", 95000),
("32343", "El Said", "History", 60000),
("33456", "Gold", "Physics", 87000),
("45565", "Katz", "Comp. Sci.", 75000),
("58583", "Califieri", "Histroy", 62000),
("76543", "Singh", "Finance", 80000),
("76766", "Crick", "Biology", 72000),
("83821", "Brandt", "Comp. Sci.", 92000),
("98345", "Kim", "Elec. Eng.", 80000);

insert into course values
("BIO-101", "Intro. to Biology", "Biology", 4),
("BIO-301", "Genetics", "Biology", 4),
("BIO-399", "Computational Biology", "Biology", 3),
("CS-101", "Intro. to Computer Science", "Comp. Sci.", 4),
("CS-190", "Game Design", "Comp. Sci.", 4),
("CS-315", "Robotics", "Comp. Sci.", 3),
("CS-319", "Image Processing", "Comp. Sci.", 3),
("CS-347", "Database System Concepts", "Comp. Sci.", 3),
("EE-181", "Intro. to Digital Systems", "Elec. Eng.", 3),
("FIN-201", "Investment Banking", "Finance", 3),
("HIS-351", "World History", "History", 3),
("MU-199", "Music Video Production", "Music", 3),
("PHY-101", "Physical Principals", "Physics", 4);

insert into prereq values
("BIO-301", "BIO-101"),
("BIO-399", "BIO-101"),
("CS-190", "CS-101"),
("CS-315", "CS-101"),
("CS-319", "CS-101"),
("CS-347", "CS-101"),
("EE-181", "PHY-101");

insert into department values
("Biology", "Watson", 90000),
("Comp. Sci.", "Taylor", 100000),
("Elec. Eng.", "Taylor", 85000),
("Finance", "Painter", 120000),
("History", "Painter", 50000),
("Music", "Packard", 80000),
("Physics", "Watson", 70000);

insert into teaches values
("10101", "CS-101", 1, "Fall", 2009),
("10101", "CS-315", 1, "Spring", 2010),
("10101", "CS-347", 1, "Fall", 2009),
("12121", "FIN-201", 1, "Spring", 2010),
("15151", "MU-199", 1, "Spring", 2010),
("22222", "PHY-101", 1, "Fall", 2009),
("32343", "HIS-351", 1, "Spring", 2010),
("45565", "CS-101", 1, "Spring", 2010),
("45565", "CS-319", 1, "Spring", 2010),
("76766", "BIO-101", 1, "Summer", 2009),
("76766", "BIO-301", 1, "Summer", 2010),
("83821", "CS-190", 1, "Spring", 2009),
("83821", "CS-190", 2, "Spring", 2010),
("83821", "CS-319", 2, "Spring", 2010),
("98345", "EE-181", 1, "Spring", 2009);

insert into section values
("BIO-101", 1, "Summer", 2009, "Painter", 514, 'B'),
("BIO-301", 1, "Summer", 2010, "Painter", 514, 'A'),
("CS-101", 1, "Fall", 2009, "Packard", 101, 'H'),
("CS-101", 1, "Spring", 2010, "Taylor", 101, 'F'),
("CS-190", 1, "Spring", 2009, "Taylor", 3128, 'E'),
("CS-190", 2, "Spring", 2009, "Taylor", 3128, 'A'),
("CS-315", 1, "Spring", 2010, "Watson", 120, 'D'),
("CS-319", 1, "Spring", 2010, "Watson", 100, 'B'),
("CS-319", 2, "Spring", 2010, "Taylor", 3128, 'C'),
("CS-347", 1, "Fall", 2009, "Taylor", 3128, 'A'),
("EE-181", 1, "Spring", 2009, "Taylor", 3128, 'C'),
("FIN-201", 1, "Spring", 2010, "Packard", 101, 'B'),
("HIS-351", 1, "Spring", 2010, "Painter", 514, 'C'),
("MU-199", 1, "Spring", 2010, "Packard", 101, 'D'),
("PHY-101", 1, "Fall", 2009, "Watson", 100, 'A');

insert into student values
("00128", "Zhang", "Comp. Sci.", 102),
("12345", "Shankar", "Comp. Sci.", 32),
("19991", "Brandt", "History", 80),
("23121", "Chavez", "Finance", 110),
("44553", "Peltier", "Physics", 56),
("45678", "Levy", "Physics", 46),
("54321", "Williams", "Comp. Sci.", 54),
("55739", "Sanchez", "Music", 38),
("70557", "Snow", "Physics", 0),
("76543", "Brown", "Comp. Sci.", 58),
("76653", "Aoi", "Elec. Eng.", 60),
("98765", "Bourikas", "Elec. Eng.", 98),
("98988", "Tanaka", "Biology", 120);

insert into takes values
("00128", "CS-101", 1, "Fall", 2009, "A"),
("00128", "CS-347", 1, "Fall", 2009, "A-"),
("12345", "CS-101", 1, "Fall", 2009, "C"),
("12345", "CS-190", 2, "Spring", 2009, "A"),
("12345", "CS-315", 1, "Spring", 2010, "A"),
("12345", "CS-347", 1, "Fall", 2009, "A"),
("19991", "HIS-351", 1, "Spring", 2010, "B"),
("23121", "FIN-201", 1, "Spring", 2010, "C+"),
("44553", "PHY-101", 1, "Fall", 2009, "B-"),
("45678", "CS-101", 1, "Fall", 2009, "B-"),
("45678", "CS-101", 1, "Spring", 2010, "B+"),
("45678", "CS-319", 1, "Spring", 2010, "B"),
("54321", "CS-101", 1, "Fall", 2009, "A-"),
("54321", "CS-190", 2, "Spring", 2009, "B+"),
("55739", "MU-199", 1, "Spring", 2010, "A-"),
("76543", "CS-101", 1, "Fall", 2009, "A"),
("76543", "CS-319", 2, "Spring", 2010, "A"),
("76653", "EE-181", 1, "Spring", 2009, "C"),
("98765", "CS-101", 1, "Fall", 2009, "C-"),
("98765", "CS-315", 1, "Spring", 2010, "B"),
("98765", "BIO-101", 1, "Summer", 2009, "A"),
("98765", "BIO-301", 1, "Summer", 2010, null);
