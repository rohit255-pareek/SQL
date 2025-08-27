-- DDL statement with 
-- constraints
-- rules apply to table -- accurate -- invalid restrict

-- not null constraint
use regex1;
create table test1(id int , salary int not null);
insert into test1 values(10,900);
insert into test1 values(11,null);  -- it will give me error

select * from test1;

-- ------------------------------
-- default
create table test2(id int default 0 , salary int not null);
insert into test2 values(10,900);
insert into test2(salary) values(1881);
select * from test2;

-- unique
create table test3(id int, salary int default 100 unique);
insert into test3 values(10,900);
insert into test3 values(11,900);  -- error here
insert into test3 (id) values(20012); -- error here
select * from test3;

-- primary key
create table test4(id int primary key, salary int);
insert into test4 values(10,900);
insert into test4 values(10,90012);  -- error here
insert into test4(id) values(null);   -- error here
select * from test4;

-- foreign key

DROP TABLE studentinfo;
DROP TABLE courses1;


create table courses1(course_id int primary key , cname varchar(20));
insert into courses1 values(10,'DSA') , (11,'Python');
select * from courses1;

create table studentinfo(sid int primary key,sname varchar(20),
 courseid int,
 foreign key (courseid) references courses1(course_id));
 
insert into studentinfo values(1,'tushar',10);
insert into studentinfo values(2,'aman',11);
insert into studentinfo values(2,'aman',13);


create table S (S_id int, S_code int, S_name varchar(50),primary key (S_id, S_code)) ;

CREATE TABLE T (T_id INT PRIMARY KEY,T_name VARCHAR(50),S_id INT,S_code INT,FOREIGN KEY (S_id, S_code) REFERENCES S(S_id, S_code));

INSERT INTO S VALUES (1, 101, 'Alpha'), (2, 202, 'Beta');
-- Child table me data (sirf wahi S_id, S_code chalega jo S me hai)
INSERT INTO T VALUES (100, 'Test1', 1, 101);
INSERT INTO T VALUES (101, 'Test2', 2, 202);


select * from S ; 
select * from T ;
                     



