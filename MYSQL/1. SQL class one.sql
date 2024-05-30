
-- DQL: Data Query Language

-- SELECT statement

SELECT 2 + 2;
SELECT 23 / 9;

use sakila;

SELECT actor_id, first_name, last_name, last_update
from actor;

select customer_id,first_name, last_name, email
from customer;

select *
from customer;

select *
from customer
limit 5
offset 20;

select *
from customer
limit 100; -- 2billion

-- ORDER BY: sorting our record
select *
from customer
order by email asc;

select film_id, title, length
from film
order by length desc;

select film_id, title, length, rental_duration
from film
order by rental_duration asc, length desc;

select first_name, last_name, email
from customer
order by first_name asc, last_name desc;

-- WHERE statement - filtering
select film_id, title, release_year, rental_duration
from film
where rental_duration = 3;




