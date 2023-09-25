-- view the table
prompt ******* viewing the employee table
select * from employee;
prompt

--inserting into a table row
prompt ******** inserting a value into the table
INSERT INTO employee (employe_id, name, email, join_date, salary, phone_no, employe_status) VALUES (6,'demo','unknown@gmail.com',date'2020-02-01',9000,'01978xxxxxx','part-timer');
select * from employee;
prompt

-- update a table row 
prompt ******* update the name of the employee from demo to rahat
update employee
set name = 'rahat'
where employe_id = 6;
select * from employee;
prompt

-- delete a table row 
prompt deleting the 6th record of the employee table
delete from employee where employe_id=6;
select * from employee;
prompt

-- union intersect except

-- aggregation
prompt number of employees in the rental service
select count(*) as no_of_employees from employee;

prompt second max salary of an employee
select max(salary) from employee
where salary!= (select max(salary) from employee);

prompt count of customers who have taken the same movie using group by
select count(customer_id) as no_customer,rented_movies from customer group by rented_movies;

prompt avg salary of the regular and part-time employees
select avg(salary),employe_status from employee group by employe_status;

-- nested queries
prompt employees that have higher salary than avg
select name,salary from employee
where salary > (select avg(salary) from employee);

prompt movie details rented by customer who have a gold membership_status
select movie_id,title,no_of_copies
from inventory
where movie_id in (select movie_id from rentals where customer_id
in (select customer_id from customer where membership_status='gold'));

--having instead of where
prompt seeing how many rentals a customer has taken
select customer_id,count(rental_id) as rental_count
from rentals
group by customer_id
having count(rental_id) > 1;

--membership function
prompt gold customers with loyalty_points>100
select name,loyalty_points,membership_status
from customer where 
membership_status = 'gold' AND loyalty_points>100;

--string operations
prompt movie names begining with 'The'
select title,director,actor,release_date
from inventory
where title like 'The%';

-- join operations
prompt customer details who have rented movies along with movie details
select c.customer_id, c.name, c.email, i.movie_id, i.title, i.release_date
from customer c
join rentals r ON c.customer_id = r.customer_id
join inventory i ON r.movie_id = i.movie_id;

prompt payments made by customer along with customer details and rental details
select p.payment_id, p.pay_date, c.customer_id, c.name, r.rental_id
from payment p
join rentals r on p.rental_id = r.rental_id
join customer c on r.customer_id = c.customer_id;

--views
prompt view to show the rentals that are currently overdue
drop view ovverdue_rentals;

create view ovverdue_rentals as
select r.rental_id,r.customer_id,r.due_date
from rentals r 
where r.rental_status = 'rented' and r.due_date<current_date;

select * from ovverdue_rentals;

prompt total earned through rentals
drop view rental_revenue;

CREATE VIEW rental_revenue AS
SELECT SUM(p.pay_amount) AS total_revenue
FROM payment p
JOIN rentals r ON p.rental_id = r.rental_id
WHERE r.rental_status = 'returned';

select * from rental_revenue
