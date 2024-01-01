create table student(
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(10) not null,
    gender VARCHAR(5)
);

-- Drop table student means delete;

alter table student add gpa DECIMAL(3,2);  -- add column
alter table student drop column gender;    -- remove column
-- DESCRIBE student;         -- describes it

insert into student values(1, 'melissa', 8.8);
insert into student values(2, 'stacey', 5.5);
insert into student(name,gpa) values('jack',7.1);
insert into student(id,name) values(4, 'vivian');

alter table student add major TEXT;
select * from student;
