--dropiing all the tables first
drop table payment;
drop table rentals;
drop table employee;
drop table customer;
drop table inventory;

-- creating table for customers
create table customer(
    customer_id int primary key,
    name varchar2(40) not null,
    email varchar2(100) unique not null,
    address varchar2(100) not null,
    phone_no varchar(13) unique,
    loyalty_points int,
    preferences varchar2(100),
    member_start date not null,
    member_expire date not null,
    constraint check_date_status check (member_expire>member_start),
    membership_status varchar2(10) check (membership_status IN('gold','silver','platinum','bronze')),
    rented_movies varchar2(100)
);

create table inventory(
    movie_id int primary key,
    title varchar2(100) not null,
    release_Date date not null,
    genre varchar2(100) not null,
    actor varchar2(100),
    director varchar2(100),
    no_of_copies int not null
);

create table rentals(
    rental_id int primary key,
    customer_id int,
    movie_id int,
    rental_date date not null,
    due_date date not null,
    constraint date_status check (due_date > rental_date),
    return_date date,
    rental_status varchar2(10) check (rental_status in('rented','returned','overdue')),
    rental_fee int not null,
    late_fee int,
    payment_status varchar2(10) check(payment_status in('paid','pending')),
    foreign key (movie_id) references inventory(movie_id) on delete cascade,
    foreign key (customer_id) references customer(customer_id) on delete cascade
);

create table employee(
    employe_id int primary key,
    name varchar2(40) not null,
    email varchar2(100) unique not null,
    join_date date not null,
    salary int not null,
    phone_no int not null unique,
    employe_status varchar2(40) check(employe_status in('regular','part-time'))
);

create table payment(
    payment_id int primary key,
    rental_id int not null,
    employe_id int not null,
    pay_date date not null,
    pay_method varchar2(10) check (pay_method in('cash','card')),
    pay_amount int not null,
    foreign key(rental_id) references rentals(rental_id),
    foreign key(employe_id) references employee(employe_id)
);

-- inserting into customer table
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (1, 'John Doe', 'johndoe@example.com', '123 Main St', '1234567890', 100, 'Action, Comedy', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'gold', 'The Dark Knight');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (2, 'Jane Smith', 'janesmith@example.com', '456 Elm St', '9876543210', 50, 'Drama, Romance', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'silver', 'Forrest Gump');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (3, 'Michael Johnson', 'michael@example.com', '789 Oak St', '5555555555', 200, 'Action, Sci-Fi', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'gold', 'The Godfather');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (4, 'Emily Wilson', 'emily@example.com', '321 Pine St', '2222222222', 150, 'Comedy, Animation', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'platinum','The Dark Knight');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (5, 'David Brown', 'david@example.com', '987 Cedar St', '7777777777', 75, 'Thriller, Mystery', TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'bronze', 'The Godfather');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (6, 'Sarah Davis', 'sarah@example.com', '654 Maple St', '4444444444', 250, 'Drama, Romance', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'gold','Forrest Gump');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (7, 'Robert Lee', 'robert@example.com', '123 Oak St', '6666666666', 100, 'Action, Sci-Fi', TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-01', 'YYYY-MM-DD'), 'bronze', 'The Matrix');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (8, 'Olivia Wilson', 'olivia@example.com', '789 Pine St', '8888888888', 50, 'Comedy, Animation', TO_DATE('2022-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'silver', 'The Matrix');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies) VALUES (9, 'Daniel Taylor', 'daniel@example.com', '456 Elm St', '9999999999', 200, 'Thriller, Mystery', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'gold', 'The Dark Knight');
INSERT INTO customer (customer_id,name,email,address,phone_no,loyalty_points,preferences,member_start,member_expire,membership_status,rented_movies ) VALUES (10, 'Sophia Anderson', 'sophia@example.com', '321 Maple St', '0000000000', 150, 'Drama, Romance', TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'platinum', 'The Godfather');

--inserting into inventory 
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (1, 'The Shawshank Redemption', TO_DATE('1994-10-14', 'YYYY-MM-DD'), 'Drama', 'Tim Robbins', 'Frank Darabont', 5);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (2, 'The Godfather', TO_DATE('1972-03-24', 'YYYY-MM-DD'), 'Crime, Drama', 'Marlon Brando', 'Francis Ford Coppola', 3);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (3, 'Pulp Fiction', TO_DATE('1994-10-14', 'YYYY-MM-DD'), 'Crime, Drama', 'John Travolta', 'Quentin Tarantino', 7);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (4, 'The Dark Knight', TO_DATE('2008-07-18', 'YYYY-MM-DD'), 'Action, Crime, Drama', 'Christian Bale', 'Christopher Nolan', 4);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (5, 'The Lord of the Rings: The Fellowship of the Ring', TO_DATE('2001-12-19', 'YYYY-MM-DD'), 'Adventure, Drama, Fantasy', 'Elijah Wood', 'Peter Jackson', 6);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (6, 'Inception', TO_DATE('2010-07-16', 'YYYY-MM-DD'), 'Action, Adventure, Sci-Fi', 'Leonardo DiCaprio', 'Christopher Nolan', 5);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (7, 'Forrest Gump', TO_DATE('1994-07-06', 'YYYY-MM-DD'), 'Drama, Romance', 'Tom Hanks', 'Robert Zemeckis', 3);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (8, 'Fight Club', TO_DATE('1999-10-15', 'YYYY-MM-DD'), 'Drama', 'Brad Pitt', 'David Fincher', 4);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (9, 'The Matrix', TO_DATE('1999-03-31', 'YYYY-MM-DD'), 'Action, Sci-Fi', 'Keanu Reeves', 'The Wachowski Brothers', 6);
INSERT INTO inventory (movie_id, title, release_date, genre, actor, director, no_of_copies) values (10, 'Interstellar', TO_DATE('2014-11-07', 'YYYY-MM-DD'), 'Adventure, Drama, Sci-Fi', 'Matthew McConaughey', 'Christopher Nolan', 4);

--inserting into rentals
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (1, 1, 4, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-08', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), 'returned', 5, NULL, 'paid');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (2, 1, 3, TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-02-08', 'YYYY-MM-DD'), NULL, 'rented', 5, NULL, 'pending');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (3, 3, 5, TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-08', 'YYYY-MM-DD'), TO_DATE('2022-03-09', 'YYYY-MM-DD'), 'returned', 5, NULL, 'paid');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (4, 4, 4, TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-04-08', 'YYYY-MM-DD'), NULL, 'rented', 5, NULL, 'pending');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (5, 5, 2, TO_DATE('2022-05-01', 'YYYY-MM-DD'), TO_DATE('2022-05-08', 'YYYY-MM-DD'), NULL, 'rented', 5, NULL, 'pending');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (6, 6, 2, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2022-06-08', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'returned', 5, NULL, 'paid');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (7, 7, 4, TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2022-07-08', 'YYYY-MM-DD'), NULL, 'rented', 5, NULL, 'pending');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (8, 9, 4, TO_DATE('2022-08-01', 'YYYY-MM-DD'), TO_DATE('2022-08-08', 'YYYY-MM-DD'), TO_DATE('2022-08-10', 'YYYY-MM-DD'), 'returned', 5, NULL, 'paid');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (9, 10, 8, TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-08', 'YYYY-MM-DD'), NULL, 'rented', 5, NULL, 'pending');
INSERT INTO rentals (rental_id,customer_id,movie_id,rental_date,due_date,return_date,rental_status,rental_fee,late_fee,payment_status) VALUES (10, 10, 2, TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2022-10-08', 'YYYY-MM-DD'), NULL, 'rented', 5, NULL, 'pending');

-- inserting into employee
INSERT INTO employee (employe_id, name, email, join_date, salary, phone_no, employe_status) VALUES (1,'Shujoy','shujoy@gmail.com',date'2021-01-01',10000,'0104889984','regular');
INSERT INTO employee (employe_id, name, email, join_date, salary, phone_no, employe_status) VALUES (2,'Dip','dip@gmail.com',date'2020-02-23',15000,'01978109678','regular');
INSERT INTO employee (employe_id, name, email, join_date, salary, phone_no, employe_status) VALUES (3,'Shahana','shahana@gmail.com',date'2022-01-22',70000,'12344123','part-time');
INSERT INTO employee (employe_id, name, email, join_date, salary, phone_no, employe_status) VALUES (4,'Pantho','pantho@gmail.com',date'2021-03-01',20000,'2233441123','regular');
INSERT INTO employee (employe_id, name, email, join_date, salary, phone_no, employe_status) VALUES (5,'Kim','kim@gmail.com',date'2021-02-01',13000,'2211234432','regular');

--inserting into payment
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (1, 1, 1, TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'cash', 10);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (2, 1, 2, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 'card', 15);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (3, 1, 3, TO_DATE('2022-03-20', 'YYYY-MM-DD'), 'cash', 20);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (4, 4, 4, TO_DATE('2022-04-25', 'YYYY-MM-DD'), 'card', 25);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (5, 3, 5, TO_DATE('2022-05-30', 'YYYY-MM-DD'), 'cash', 30);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (6, 2, 6, TO_DATE('2022-06-05', 'YYYY-MM-DD'), 'card', 35);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (7, 3, 7, TO_DATE('2022-07-10', 'YYYY-MM-DD'), 'cash', 40);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (8, 2, 8, TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'card', 45);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (9, 5, 9, TO_DATE('2022-09-20', 'YYYY-MM-DD'), 'cash', 50);
INSERT INTO payment (payment_id,employe_id,rental_id,pay_date,pay_method,pay_amount) VALUES (10, 4, 10, TO_DATE('2022-10-25', 'YYYY-MM-DD'), 'card', 55);
