create database if not exists dbtest;

use dbtest;

create table test1(
	id int,
	col1 varchar(50),
	col2 varchar(50)
);

create table test2(
	name varchar(10),
	nums int,
	stuff varchar(50)
);

insert into test1 values(1234, test1, test2);
insert into test1 values(2345, test3, test4);
insert into test1 values(3456, test5, test6);
insert into test1 values(4567, test7, test8);

insert into test2 values(name1, 1, test2);
insert into test2 values(name2, 3, test4);
insert into test2 values(name3, 5, test6);
insert into test2 values(name4, 7, test8);
