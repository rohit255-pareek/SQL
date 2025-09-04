-- datatype
-- int (4 byte) 2**32
use regex1;
drop  table yash1;
create table yash1(id int unsigned);
insert into yash1 values(-10);  -- error here 
insert into yash1 values(10); 

select * from yash1;
-- tiny int (1 byte)
-- small int(2 byte) mediumbyte(3 byte)
-- big int(2**64)

drop  table yash1;
create table yash1(id bigint unsigned);
insert into yash1 values(18446744073709551615);  
insert into yash1 values(18446744073709551616);  -- errror here 
select * from yash1;

drop  table yash1;
create table yash1(name char(10));
insert into yash1 values('abc');  
insert into yash1 values('abc           '); 
select name , char_length(name) from yash1;
select * from yash1;



drop  table yash1;
create table yash1(name varchar(10));
insert into yash1 values('abc');  
insert into yash1 values('abc           ');  -- warning here
select name , char_length(name) from yash1;
select * from yash1;

-- ------------------------------------
-- CHAR_LENGTH → characters की गिनती करता है।  LENGTH → bytes की गिनती करता है।
drop table yash1;
create table yash1(dob date);
insert into yash1 values(curdate());  
insert into yash1 values('2026-01-30');
insert into yash1 values('2026-02-30');  -- error here
insert into yash1 values(now());
select * from yash1;
 
-- --------------------------------------------
drop table yash1;
create table yash1(dob timestamp);
insert into yash1 values(now());  
select * from yash1;

-- create table yash4(do--)
create table yash4(dob timestamp);
insert into yash4 values(now());  
select * from yash4;

-- insert into yash1 values(curdate())
-- how to store image in rdbms system
-- sqlzoo 1,2,3,4,5,6  
drop table yash4;
create table yash4(salary float);
insert into yash4 values(10.2),(20.1254789);  
select * from yash4;

drop table yash4;
create table yash5(salary double);
insert into yash5 values(10.2),(20.1254789);  
select * from yash5;

-- -------------------------------------
drop table yash5;
create table yash5(salary double(5,2));
insert into yash5 values(10.2);  
insert into yash5 values(103.23);
insert into yash5 values(10345.23);  -- error here
insert into yash5 values(103.5452);
select * from yash5;

																			


