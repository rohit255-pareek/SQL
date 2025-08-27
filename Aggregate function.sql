-- where ka use ham aggeregate function ke sath me nhi kar sakte 
use sakila;
select * from actor
where first_name='E';
-- trim

select first_name, length(first_name), char_length(first_name) from actor;

select first_name, last_name, concat('Mr'first_name,' ', last_name) from actor,
concat_ws('-','Mr',first_name,last_name) from actor;


select first_name,substr(first_name,3 ),
last_name,concat('Mr',first_name,' ',last_name),
concat_ws('-','Mr',first_name,last_name)from actor;

select first_name,substr(first_name,2,1) from actor;

select length('字'), char_length('字');

select first_name,locate("E",first_name,5) from actor;
select first_name , locate("E",first_name,5),replace(first_name,"E","-") from actor;
select char_length('  hey  ');
select char_length(  trim('  h    ey  '));
select char_length(trim( leading from 'hey'));

select * from payment;
select count(amount) from payment;
select count(amount), sum(amount) from payment;
select count(amount), sum(amount),avg(amount) from payment;

select count(amount) from payment group by customer_id=1;
select count(amount) as total_count, sum(amount) as total_sum,avg(amount) as total_average from payment where customer_id=1;
select customer_id ,count(amount),sum(amount) from payment group by customer_id;


select count(amount), sum(amount),max(amount) , min(amount) from payment;

-- get the total number of customer self by staff id 1 
-- get the total amount and the average amount spend by customer_id 5
-- get the total amount spend and the max amount spend in the month of may 
-- get the number of transections and the average transection amount done for each month 


select * from payment;
select count(customer_id) from payment where  staff_id = '1';
select sum(amount),avg(amount) from payment where customer_id = '5';
select sum(amount) , max(amount) from payment where month(payment_date) = 5 ;


-- get the total number of customers served by staff id 1
select count(customer_id)  from payment where staff_id = 1;

select count(amount),sum(amount) , avg(amount) from payment where customer_id = 5;


select sum(amount) , max(amount)  from payment where month(payment_date) = 5;


