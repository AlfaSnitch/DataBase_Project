-- for viewing all the table neatly
set pagesize 200
set linesize 400

-- to see the name of the users.
prompt ****** the user ********
show user;

-- to see all the table names.
prompt
prompt *** all the tables ****
select table_name from user_tables;

-- to see all the table and records and information
prompt
prompt **** customer *****
select * from customer;

prompt
prompt **** inventory *****
select * from inventory;

prompt
prompt **** rentals *****
select * from rentals;

prompt
prompt **** employee *****
select * from employee;

prompt
prompt **** payment *****
select * from payment; 

