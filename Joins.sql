-- Joins
use xyz;
create table t1(id  int);
insert into t1(id) values(1),(2),(3),(4),(5);
create table t2 (id int);
insert into t2(id) values(1),(2),(1),(3),(4);
select * from t1;
select * from t2;
-- -- s-- yntex => select column name1,columnname2 from left table
-- inner join right_table on left_table.colum_nname=right_table.column
select * from t1 a
inner join t2 b on a.id = b.id;
select * from t2;
select * from t1;
select * from t1 l
inner join t2 r on l.id = r.id;
use sakila;
select * from customer;
select * from payment;
select c.first_name, p.amount from customer c
inner join payment p on c.customer_id = p.customer_id;

select * from address;
select * from address;

select c.first_name, p.amount, a.address 
from customer c
inner join payment p on c.customer_id = p.customer_id
inner join address a on c.address_id = a.address_id;

-- <----------------------------------->30-07-2025<----------------------------------------------------->

use sakila;
select * from film;
select * from language;

-- (1).List all films along with their language name:
select film.film_id,film.title,language.name from film  inner join language language on film.language_id = language.language_id;

select * from staff;
select * from store;
-- Get all staff members with their store name:
select staff.first_name , staff.last_name , store.store_name from staff  inner join  store on staff.store_id = store.store_id;

describe store;	


-- (3). Display all inventory items with the film title
select * from inventory;
select * from film;
select i.inventory_id , f.title from inventory i inner join film f on i.film_id = f.film_id;

-- (-- 4). List all addresses along with the city name:
select * from city;
select * from address;
select a.address,c.city from address a inner join city c on a.city_id = c.city_id;

-- 5. 
select * from film ; 
select * from film_actor  ; 
select * from language ;  
 select * from actor ; 
 
select film.title , actor.first_name , actor.last_name , language.name from film 
inner join film_actor on film.film_id  = film_actor.film_id
inner join actor on  actor.actor_id = film_actor.actor_id 
inner join language on language.language_id = film.language_id ; 

--  6. 
select * from store  ;  
select * from staff ; 
select * from address ; 
select * from city ; 
select * from country ; 

select staff.first_name , staff.last_name , store.store_id , address.address , city.city , country.country from staff
inner join store on staff.store_id = store.store_id
inner join  address on store.address_id = address.address_id
inner join  city on address.city_id = city.city_id
inner join  country on city.country_id = country.country_id;  

-- <----------------------------------->31-07-2025<------------------------------->

-- list all customer with rental and payment details include customer with no  rental
-- find all fils then invent item and there inventory items with rental details  display films with no inventory with rental 
-- display customers there rental counnt and total payment amount 
-- list all staff members there  payment amount display all payments even if staff record missing

use sakila;
select * from customer;
select * from rental;
select * from payment;
-- --(1). list all customer with rental and payment details include customer with no  rental
select customer.first_name , rental.rental_id,payment.payment_id from customer left join rental on customer.customer_id = rental.customer_id
left join payment on  rental.rental_id=payment.rental_id;


-- (2).find all fils then invent item and there inventory items with rental details  display films with no inventory with rental 
select * from film;
select * from inventory;
select * from rental;

select film.title,inventory.inventory_id,rental.rental_id from film left join inventory on film.film_id = inventory.film_id
left join rental on inventory.inventory_id = rental.inventory_id;

-- --(3). display customers there rental counnt and total payment amount 
select  * from customer;
select * from rental;
select  * from payment;
select customer.first_name,customer.last_name,count(rental.rental_id),sum(payment.amount) from customer left join rental on customer.customer_id =
rental.customer_id left join payment on rental.rental_id = payment.rental_id group by customer.customer_id; 

-- --(4). list all staff members there  payment amount display all payments even if staff record missing
select * from staff;
select * from payment;
select staff.first_name , payment.amount from staff right join payment on payment.staff_id = staff.staff_id;

-- 1-08-2025

-- --(1). you have to display list of staff members and there  managers  use customer table for that 
use sakila;
select * from staff;
select * from customer;
select staff.first_name , customer.first_name from staff cross join customer;


-- (2). you have to find the customer living in the same city 
select * from customer;
select * from city;

-- tushar sir 
use sales;
select * from sales;


select product_name , avg(quantity_sold) from sales group by product_name;


select region , count(distinct product_name) from sales group by region;

select region , product_name ,count(*) from sales group by region , product_name;

-- identify regions where more then 2 types of product were sold 
select region from sales group by  region  having count(distinct product_name) > 1 ;

-- sabse pehle badi price baad me chhoti 
select product_name ,  price_per_unit from sales order by price_per_unit desc;

-- total quantity and average price per unit of mobile across all region
select sum(quantity_sold) , avg(price_per_unit) from sales where product_name = 'Mobile'; 

-- find the total revenue per year   
select * from sales;
select sale_date ,sum(quantity_sold),sum(price_per_unit) from sales group by year(sale_date);



use xyz;
select * from t1;
select * from t2;
delete from t1 where id is null;
select * from t1
left join t2 on t1.id = t2.id;

insert into t2(id) values(6),(7);
select * from t1
right join t2 on t1.id = t2.id;

use sakila;
select * from customer;
select * from payment;
select * from rental;
select c.first_name,r.rental_id,p.amount from customer c 
left join rental r on c.customer_id = r.customer_id 
left join payment p on r.rental_id=p.rental_id;

-- list all customer with rental and payment details include customer with no  rental
-- find all fils then invent item and there inventory items with rental details  display films with no inventory with rental 
-- display customers there rental counnt and total payment amount 
-- list all staff members there  payment amount display all payments even if staff record missing

select * from t1;
select * from t2;
select count(t1.id) from t1 cross join t2;

-- display all possible actors and laguage
use sakila;
select * from actor;
select * from language;
select count(actor.actor_id) from actor
cross join language;

-- display all country or city 
select * from country;
select * from city;

select distinct(country) from country 
cross join city
group by city.city;

select e1.employee_name, e2.employee_name as manager
from employee e1
left join employees e2 on e1.employee_id = e2.manager_id;

