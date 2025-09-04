-- set operation = \
-- union
use sakila;
select * from actor where actor_id between 1 and 3
union
select * from actor where actor_id between 3 and 5;
-- union all
select * from actor where actor_id between 1 and 3
union all
select * from actor where actor_id between 3 and 5;
-- except
SELECT * FROM actor WHERE actor_id BETWEEN 1 AND 3
EXCEPT
SELECT * FROM actor WHERE actor_id BETWEEN 3 AND 5;

-- a common table expression cte in sql is a named temprary

-- recursive

-- recursive with factorial
with recursive cte as
(select 1 as num , 1 as x
union
select num+1,x*(num+1) from cte where num<6
)
select * from cte; 

-- -------------------------------------------------------
use regex1;
drop table employees;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- Reports to Alice
(3, 'Carol', 1),          -- Reports to Alice
(4, 'David', 2),          -- Reports to Bob
(5, 'Eve', 2),            -- Reports to Bob
(6, 'Frank', 3),          -- Reports to Carol
(7, 'Grace', 4);          -- Reports to David

select * from employees;
with recursive cte as
(select employee_id, name, manager_id, 1 as level
from employees as e where manager_id is null
union
select etemp.employee_id, etemp.name, etemp.manager_id, level + 1
from employees as etemp 
join cte where etemp.manager_id = cte.employee_id)
select * from cte ; 
