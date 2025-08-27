-- sub query
use world;
select * from city;
select name,population from city where name = 'kabul';
select name , population from city where population > 1780000;
select name , population from city where population >(select population from city where name = 'Amsterdam');
-- now get the name of the city where the district is same as of the district for amsterdam


select district from city where name = 'Amsterdam';
select name , district from city where district=(select district from city where name = 'Amsterdam');

-- get the country code and the country name  where continent matche is with the continent of the country albania
-- get the continent the name of the country where life expectancy matche is with the life expectancy of the country name is cook islands
-- get the country code and the continent and GNP value for the countries where the region do not match with the region of the country name is benin
select * from country;
select code, name , continent from country where name = 'Albania';
select name , continent from country where continent=(select continent  from country where name = 'Albania');

select  lifeExpectancy from country where name ='cook islands';
select name , continent from country where LifeExpectancy=(select lifeExpectancy from country where name = 'cook islands');

-- nested query/subquery
-- single row subquery
-- multi row subquery--> 
                      select region , continent from country where continent='Africa';
-- i need to get the country name and the population for all the countries available in the continent name is 'europe'
select  * from country;
-- Hume chahiye: country_name aur population
-- Condition: continent = 'Europe'
select name , population from country where continent = 'Europe';
select name , continent from country where continent = 'Europe';
-- multi row subquery (in where name in ('america','africa'))
select name , population, continent from country where name in (select name from country where continent='Europe');
-- i need to get the country name and the country code where the life ecpectency match with the life expectecy of the country name is 'bahamas'
select name,code from country where name = 'bahamas';
select name,code from country where lifeexpectancy=(select lifeexpectancy from country where name = 'Bahamas');


use sakila;
-- find the payment i,customer_id , amount 
-- amount is name as of payment id = 5
select amount from payment where payment_id = 5;
select payment_id , customer_id , amount from payment where amount=(select amount from payment where payment_id = 5);

select amount from payment where payment_id = 2 or payment_id= 3;

select payment_id , customer_id , amount from payment where amount in (select amount from payment where payment_id = 2 or payment_id=3);

select payment_id , customer_id , amount from payment where amount >any (select amount from payment where payment_id = 2 or payment_id=3);
-- any
select payment_id , customer_id , amount from payment where amount <=any (select amount from payment where payment_id = 2 or payment_id=3 or payment_id = 5);
select payment_id , customer_id , amount from payment where amount =any (select amount from payment where payment_id = 2 or payment_id=3 or payment_id = 5);
-- all
select payment_id , customer_id , amount from payment where amount <all (select amount from payment where payment_id = 2 or payment_id=3 or payment_id = 5);

-- Example
-- get the name of the country whos population is greater then the all the  population of all the country  the continent name is not america
select * from world.country;
select name from country where population >all(select population from country  where continent='North America');


-- get the country code the name of the country whos like ecpectenciy is same has for the countries from the Europe
select Code , name , lifeexpectancy 
from world.country
where lifeexpectancy in (
    select lifeexpectancy 
    from country 
    where continent = 'Europe'
);
-- get the name and the continent  for the countries who have got there indepedence near by the indepeYear of the countries from 'Asia'
select continent,count(*) from world.country where IndepYear>any(select IndepYear from world.country where continent="asia") and continent!='Asia' group by continent;

-- order by clause
select * from world.country order by name;
select * from world.country order by region desc,surfacearea asc;


select name , population,(select population from world.country where name='Anguilla')
from world.country;


use sakila;
create table studentAccess(id int , sname varchar(10) );  -- ddl
insert into studentAccess values(9 , 'abc');             -- dml
insert into studentAccess(id,sname) values (19,'abc');  -- method 2


-- problem
insert into studentAccess values(11);

-- solution
insert into studentAccess(id) values(22);
select * from studentAccess;

insert into studentAccess(sname) values('abc2');

drop table studentAccess;
create table studentAccess(id int , sname varchar(10)); 
insert into studentAccess(id) values(22);
insert into studentAccess(sname) values('yash');
select * from studentAccess;
use sakila;

-- dml (update)
update studentAccess set sname = 'raj';

-- 1. row update with where clause
update studentAccess set sname = 'abhishek' where id = 22;
select * from studentAccess;

drop table studentAccess;
create table studentAccess(id int , sname varchar(10)); 
insert into studentAccess(id,sname) values(21,'aman');
insert into studentAccess(id,sname) values(23,'naina');
select * from studentAccess;

delete from studentAccess;
delete from studentaccess where id between 20 and 22;
select * from studentAccess;


-- merge mysql me nhi lagta
/*amerge into table using refrencetable 
when condition then statement (insert/update/delete) is dml
*/

/*
MERGE INTO TargetTable AS T
USING SourceTable AS S
ON T.ID = S.ID
WHEN MATCHED THEN
    UPDATE SET T.Column1 = S.Column1, T.Column2 = S.Column2
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ID, Column1, Column2) VALUES (S.ID, S.Column1, S.Column2)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
*/
-- truncate ddl



create table test18(id tinyint);
insert into test18 values(10);
insert into test18 values(-128);
insert into test18 values(-129);

select * from test18;

select * from test18;

create table test19(id tinyint unsigned);  -- all number positive (255)
insert into test19 value(10);
insert into test19 value(-128);

-- small int (size=1 byte), medium int(3 byte), int(size=4 byte), big int(size=8 byte)