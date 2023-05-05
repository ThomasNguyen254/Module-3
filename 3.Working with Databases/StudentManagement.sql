create database studentManagement;
use studentManagement;

create table Class(
classID int primary key,
className varchar(50),
startDate date,
status int
);

create table Student(
studentID int primary key,
studentName varchar(50),
address varchar(250),
phone varchar(50),
studentStatus int,
classID int,
foreign key (classID) references Class(classID)
);

create table Subject(
subID int primary key,
subName varchar(50),
credit int,
statusSub int
);

create table Mark(
markID int primary key,
subID int,
studentID int,
mark int,
examTimes int
);

insert into Class(classID,className,startDate,status)
values(1, "A1", '2008-12-20', 1),
      (2, "A2", '2008-12-22', 1);
      
insert into Student(studentID,studentName,address,phone,studentStatus,classID)
values(1, "Hung", "Ha Noi", 0912113113, 1, 1),
      (2, "Hoa", "Hai Phong", 0912113123, 1, 1),
      (3, "Manh", "Da Nang", 0912113143, 0, 2);

insert into Subject(subID,subName,credit,statusSub)
values(1, "CF", 5, 1),
	   (2, "C", 6, 1),
       (3, "HDJ", 5, 1),
       (4, "RDBMS", 10, 1);

insert into Mark(markID,subID,studentID,mark,examTimes)
values(1, 1, 1, 8, 1),
      (2, 1, 2, 10, 2),
      (3, 2, 1, 12, 1);

select * from Class;

select * from Student;

select * from Subject;

select * from Mark;

select * 
from Student
where studentName like 'h%';

select *
from Class
where month(startDate) = 12;

select *
from Subject
where credit between 3 and 5;

SET SQL_SAFE_UPDATES = 0;
update Student 
set classID = 2
where studentName = ' Hung ';

select Student.studentName, Subject.subName, mark.Mark
from Student
inner join Mark on Student.studentID = Mark.studentID
inner join Subject on Mark.subID = Mark.studentID
order by Mark.mark desc,Student.studentName asc; 
