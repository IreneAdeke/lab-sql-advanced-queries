use sakila; 

# 1. List each pair of actors that have worked together.
select * from actor; 
select * from film_actor; 

select concat(a.first_name, ' ', a.last_name) as First_Actor, 
concat(ac.first_name, ' ', ac.last_name) as Second_Actor
from actor a
inner join film_actor fa on a.actor_id = fa.actor_id
inner join film_actor ff on fa.film_id = ff.film_id
inner join actor ac on ac.actor_id = ff.actor_id
where fa.actor_id > ff.actor_id;
 


# 2. For each film, list actor that has acted in more films
select * from film; 
select * from actor; 
select * from film_actor; 


select fa.film_id, f.title, fa.actor_id 
from film_actor fa
join film f
on fa.film_id = f.film_id
where actor_id in (
	select actor_id from (
		select actor_id, count(film_id) as Number_of_films
		from film_actor
		group by  actor_id
		order by Number_of_films desc) sub1)
order by actor_id;

