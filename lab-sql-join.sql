use sakila;

# 1. List the number of films per category.

select G.name, count(H.film_id) as num_films
from category G								# contains the names of the categories
inner join film_category H					# contains the film_ids that need to be counted
on G.category_id = H.category_id
group by G.name;

# 2. Display the first and the last names, as well as the address, of each staff member.

select A.first_name, A.last_name, B.address, B.address2, B.postal_code
from staff A
inner join address B
on A.address_id = B.address_id;				# no need to group by: each value must be presented separately

# 3. Display the total amount rung up by each staff member in August 2005.

select * from payment;					# making sure I know how the date is formatted

select A.first_name, A.last_name, sum(C.amount) as money_collected
from staff A
inner join payment C
on A.staff_id = C.staff_id
where date(C.payment_date) regexp '^2005-08'			# date starting with 2005-08
group by  first_name, last_name;

# 4. List all films and the number of actors who are listed for each film.

select D.title, count(E.actor_id) as num_actors
from film D
inner join film_actor E
on D.film_id = E.film_id
group by D.title				# grouping actors by film title 
order by num_actors desc;		# making the table easier to read

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select F.last_name, F.first_name, sum(C.amount) as total_amount
from customer F
inner join payment C
on C.customer_id = F.customer_id
group by F.last_name, F.first_name
order by last_name asc;			# ascending order in the case of strings made up by letters is the same as alphabetical order