use sakila;
create view temp as
(select first_name , count(*) from actor where actor_id > 10
group by first_name order by count(*) desc);

select * from temp;

create view temp2 as
(select first_name , last_name from actor);
select * from temp2;

-- physical 
-- CTAS => (create table as select) with the select command
create table factor as
(select actor_id,first_name,last_name from actor where actor_id>70);

select * from factor;

-- eska ek view bnao sare columns ka use karna hai view ke andr koi insert ya update query chalana or table me check karna ki original table change hua ya nhi 
-- fer ek view bana fir vaps koi insert karna hai or check karna hai ki koi changes hua ya nhi hua 
-- actor_id , first_name do insert in this and check it is happen or not

create view temp2 as
(select first_name , last_name from actor);
select * from temp2;

create view temp3 as
(select actor_id , first_name , last_name from actor);

select * from temp3;
INSERT INTO temp3 (actor_id, first_name, last_name)
VALUES (201, 'AMAN', 'Pareek');

-- -- make a view actor_id , first_name do insert in this and check it is happen or not
select * from actor;

CREATE VIEW actor_view AS
SELECT actor_id, first_name
FROM actor;
SELECT * FROM actor_view;

INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES (300, 'ROHIT', 'PAREEK', NOW());


insert into actor_view values(300,'Rohit','Pareek');

create temporary table xyz as 
(select actor_id, first_name, last_name from actor where actor_id>7);

select * from temporary;

