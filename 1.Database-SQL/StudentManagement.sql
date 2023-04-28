create database bt1;
use bt1;
create table class (
id int primary key,
`name` varchar(50)
);
insert into student(id,name)
			values(1,"thomas"),
                   (2,"david");
        
create table teacher (
id int primary key,
`name` varchar(50),
`age` int,
`country` varchar(50)
);
insert into teacher(id,name,age,country)
            values(1,"hung",20,"Da Nang"),
				  (2,"thang",21,"Quang Nam"),
                  (3,"khang",22,"Ho Chi Minh"),
                  (4,"thinh",23,"Ha Noi");
select * from class;
select * from teacher;
update teacher set name = 'new name' where id = 4;


