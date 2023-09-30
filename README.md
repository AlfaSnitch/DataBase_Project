# Movie Rental System

A movie rental system database will include several tables that store information related to customers, movies, rentals, and payments. Here are some examples of tables that could be included in such a database:
- **Customer table**: This table stores information about customers, including their names, addresses, phone numbers, and email addresses.
  
- **Movie table**: This table stores information about movies, including the title, release date, genre, director, and cast.
  
- **Rental table**: This table stores information about rentals, including the rental date, due date, and return date. It also includes foreign keys to the customer and movie tables to associate rentals with customers and movies

- **Payment table**: This table stores information about payments, including the payment amount, payment date, and payment method. It also includes foreign keys to the rental and customer tables to associate payments with rentals and customers.

- **Inventory table**: This table stores information about the number of copies of each movie available for rental.

- **Employee table**: This table stores information about employees who work at the movie rental store, including their names, job titles, and contact information

# Overview
- The customer table stores information about each customer, while the movie table stores information about each movie available for rental. The rental table links customers to movies, indicating which movies have been rented by which customers. The payment table links rentals to customers, indicating which customers have made payments for which rentals. The inventory table keeps track of the number of copies of each movie available for rental. Finally, the employee table stores information about employees who work at the movie rental store.
