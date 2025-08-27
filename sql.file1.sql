-- get the total number of customer self by staff id 1 
-- get the total amount and the average amount spend by customer_id 5
-- get the total amount spend and the max amount spend in the month of may 
-- get the number of transections and the average transection amount done for each month 
use sakila;
select * from customer;
select * from payment;
select * from payment where staff_id = '1';
select sum(amount) , avg(amount) from payment where customer_id = '5';
select max(amount) ,  sum(amount) from payment where month(payment_date) = 5;









select count(customer_id) from payment where staff_id = 1;

select sum(amount) , avg(amount) from payment where month(payment_date) = 5;

select sum(amount) , max(amount) from payment where  customer_id=5;


select month(payment_date) , count(*), avg(amount) as average_amount from payment group by month(payment_date);


use sakila;
select * from payment;
select staff_id , count(payment_id) from payment group by staff_id;
select staff_id , count(payment_id) from payment group by staff_id having count(payment_id) > 8000;


use sakila;
show tables;
select * from address;
select count(address_id) , count(address2),count(*) from address;

create database product;
create table product1(id int , pname varchar(20),amount int);
insert into product1 values(10,"laptop",199) , (11,"TV",200),(12,"watch",300);

create table orders(oid int , location varchar(20),productid int);
insert into orders values(888,"Jaipur",10) , (889,"Pune",200),(890,"himachal",15),(8891,"j&k",10);


select * from product1;






select * from product ;
select * from orders ; 

SELECT o.oid, o.location, p.pname, p.price
FROM orders o
INNER JOIN product p
ON o.productid = p.pid;

select o.oid,o.location,p.pname from orders as o join product as p where o.productid=p.pid;

select o.oid,o.location,p.pname from orders as o inner join product as p on o.productid=p.pid;

select p.pname, o.oid,o.location from product as p left join orders as o on p.pid= o.productid;

select p.pname, o.oid,o.location from product as p right join orders as o on p.pid= o.productid;

use sakila;
show tables;
select * from actor;
select * from film_actor;
desc film_actor;

select a.actor_id , a.first_name , a.last_name , f.film_id from actor as a join film_actor f on a.actor_id = f.actor_id ;





-- Write a query to find the total sales per customer .
select * from customer;
select * from payment;
show tables;
select customer_id , sum(sales) from payment  group by custoemr_id;

-- How many movies are rented by each customer
select * from rental;
select count(rental_id) , customer_id from rental group by customer_id;


-- 8. Average payment amount per staff
select avg(amount) , staff_id from payment group by staff_id;

-- 9. Number of rentals per month
select count(rental_id) from rental group by month(rental_date);

-- 10. Highest amount spent by each customer
select * from payment;
select max(amount) from payment group by customer_id;

-- Top 3 customers by total payment
select sum(amount) as total_payment from payment group by customer_id order by total_payment desc limit 3;

-- 2. Find the month with maximum sales
select sum(amount) as total_sales from payment group by month(payment_date) order by total_sales  desc limit 1;

-- . Customers who made more than 20 rentals
select count(customer_id) from rental where rental_id > 20;

-- 5. Staff who collected more than 8000 payments
select * from payment;
select count(payment_id), staff_id from payment  group by staff_id having count(payment_id) > 8000;
select * from film;
select * from language;
 
select film.title , language.name from film inner join language on film.language_id = language.language_id;
select film.title , language.name from film inner join language on film.language_id = language.language_id;




-- film table has film id primary key 
use sakila;
select * from film_actor;
select count(film_id),count(distinct film_id) from film_actor;  

desc film;  -- foren key nikalne ka tarika 
desc film_actor; 

select f.film_id , f.title,f.release_year , fa.actor_id from film as f join film_actor as fa  where f.film_id = fa.film_id;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Age INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');
   
   
   
INSERT INTO Students (StudentID, StudentName, Age, DepartmentID)
VALUES
    (101, 'Alice', 20, 1),
    (102, 'Bob', 21, 2),
    (103, 'Charlie', 22, 1),
    (104, 'Diana', 23, 3),
    (105, 'Evan', 20, NULL); -- Evan has no department assigned
   
select * from Students;
select * from Departments;

select s.studentid, s.studentname,  d.departmentname
from students as s join departments as d
  where s.departmentid = d.departmentid;
  
create table employee81(eid int , ename varchar(20) , managerid int);
insert into employee81 values(10,"yash",null) , (11,"aman",12),(12,"naina",10),
(13,"happy singh",11);
select * from employee81;

select e.eid,e.managerid,e.ename , mgr.ename from employee81 as e join employee81 as mgr where e.managerid = mgr.eid;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    PrerequisiteCourseID INT,
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Courses (CourseID, CourseName, PrerequisiteCourseID)
VALUES
    (1, 'Intro to Programming', NULL),
    (2, 'Data Structures', 1),
    (3, 'Algorithms', 2),
    (4, 'Databases', 1),
    (5, 'Advanced Databases', 4),
    (6, 'Computer Networks', NULL),
    (7, 'Operating Systems', 2),
    (8, 'Computer Architecture', 1),
    (9, 'Machine Learning', 3),
    (10, 'Artificial Intelligence', 3),
    (11, 'Deep Learning', 9),
    (12, 'Compiler Design', 7),
    (13, 'Cloud Computing', 6),
    (14, 'Cybersecurity Fundamentals', 6),
    (15, 'Blockchain Technology', 14);


select * from courses;
select c.CourseID , c.CourseName ,c.PrerequisiteCourseID from courses as c left join courses as co on c.PrerequisiteCourseID = co.courseid;
select c.courseid,c.coursename,c.prerequisitecourseid from courses as c left join courses as co on c.prerequisitecourseid = co.courseid;




use sakila;
select * from actor;
select * from film_actor;

-- natural join 
select * from product;
select * from orders;
select a.actor_id,a.first_name,fa.film_id from actor as a join film_actor as fa where a.actor_id=fa.actor_id;

select a.actor_id,a.first_name,fa.film_id from actor as a inner join film_actor as fa on a.actor_id=fa.actor_id;

select a.actor_id,a.first_name,fa.film_id from actor as a inner join film_actor as fa using (actor_id);

-- find out kis actor ne kitne movies me kam kiya 
select * from film_actor;
select * from actor;
select a.first_name,count(fa.film_id) from actor as a join film_actor as fa where a.actor_id=fa.actor_id group by a.first_name;


select * from film_actor;
select * from actor;
select * from film;
select act.actor_id , act.first_name , factor.film_id , film.title from actor as act join film_actor as factor join film where act.actor_id = factor.actor_id 
and factor.film_id=film.film_id;

use world;
show tables;
select * from city;
select * from country;

-- get the city name and district where the district do not have the word noord 
-- get the total number of cities present in each country having the population greater then 1.5 lacs 
-- get the district which has more then 2 cities 
select * from city;
select name , district from city where district not like '%noord%';

-- get the total number of cities present in each country having the population greater then 1.5 lacs 
select * from country;
select co.name , count(*)  from city c  join  country  co on c.countrycode  = co.code where co.Population  > 150000 
group by co.name;

-- get the district which has more then 2 cities 
select countrycode , district , count(name) from city group by countrycode , district  having count(name) > 2;

-- find the city name the country code and the country name where the country population is greater then 50000
-- get the district and the total population  for each country
-- get the total number of countryes present and each contenet having there independent year after 1920 
-- get the avg surface area the total population avg life expecttence and the total number of contents  available for each region 




select * from city;
select * from country;

select c.name , c.countrycode , co.name from city as c join country as co on c.countrycode = co.code where co.population > 50000;

-- get the district and the total population  for each country
select name , district , sum(population) from city group by district,name;

-- get the total number of countryes present and each contenet having there independent year after 1920 
select * from country;
select continent , count(name) from country where indepyear > 1990 group by continent;

