create database StudentManagement3;
use StudentManagement3;

create table Class(
    id int not null auto_increment primary key ,
    class_name varchar(50),
    start_date date,
    status int
);

create table Student(
    id int not null auto_increment primary key ,
    student_name varchar(50) not null ,
    address varchar(50),
    phone varchar(50),
    status int,
    class_id int,
    foreign key(class_id) references Class(id)
);

create table Subject(
    id int not null auto_increment primary key ,
    sub_name varchar(50),
    credit int  not null default 1 check ( credit >= 1 ),
    status int default 1
);

create table Mark(
    id int not null auto_increment primary key ,
    sub_id int not null ,
    student_id int not null ,
    mark float default 0 check ( mark between 0 and 100),
    examTimes int
);

insert into Class(id, class_name, start_date, status)
values (1,'A1','2008-12-20',1),
       (2,'A2','2008-12-22',1),
       (3,'3','2008-12-25',0);

insert into Student(id, student_name, address, phone, status, class_id)
values (1,'Hung','Ha Noi','0912113113',1,1),
       (2,'Hoa','Hai Phong',null,1,1),
       (3,'Manh','HCM','0123123123',0,2);

insert into Subject(id, sub_name, credit, status)
values (1,'CF',5,1),
       (2,'C',6,1),
       (3,'HDJ',5,1),
       (4,'RDBMS',10,1);

insert into Mark(id, sub_id, student_id, mark, examTimes)
values (1,1,1,8,1),
       (2,1,2,10,2),
       (3,2,1,12,1);

select *
from Subject
where credit = (
    select max(credit)
    from Subject
    );

select *
from Mark
inner join Subject on Mark.sub_id = Subject.id
where mark = (
    select max(mark)
    from Mark
    );

select s.id,s.student_name,avg(mark) as AvgMark
from Student s
inner join Mark m on s.id = m.id
group by s.id,student_name
order by AvgMark desc;

