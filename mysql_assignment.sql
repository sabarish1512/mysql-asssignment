create database if not exists sql_assignment;
use sql_assignment;

-- Table creation
-- Banking: customers
create table if not exists customers (
    customer_id int primary key auto_increment,
    name varchar(50) not null,
    city varchar(50)
);
-- Banking: accounts
create table if not exists accounts (
    account_id int primary key auto_increment,
    customer_id int,
    account_type varchar(20),
    balance decimal(10,2),
    foreign key (customer_id) references customers(customer_id)
);

-- Railway: trains
create table if not exists trains (
    train_id int primary key auto_increment,
    train_name varchar(50),
    source varchar(50),
    destination varchar(50)
);

-- Railway: bookings
create table if not exists bookings (
    booking_id int primary key auto_increment,
    train_id int,
    passenger_name varchar(50),
    fare decimal(10,2),
    status varchar(20),
    foreign key (train_id) references trains(train_id)
);

-- Employee management
create table if not exists employee (
    emp_id int primary key,
    emp_name varchar(50),
    department varchar(30),
    salary decimal(10,2),
    city varchar(30),
    joining_date date
);

-- Customers and Orders
-- A distinct table name avoids a collision with banking customers.
create table if not exists order_customers (
    customer_id int primary key,
    customer_name varchar(50),
    email varchar(100),
    city varchar(30)
);

create table if not exists orders (
    order_id int primary key,
    customer_id int,
    amount decimal(10,2),
    order_date date,
    foreign key (customer_id) references order_customers(customer_id)
);

-- Students
create table if not exists students (
    student_id int primary key,
    student_name varchar(50),
    department varchar(30),
    class int,
    marks int
);
-- INSERT SAMPLE DATA

-- Banking customers
insert into customers (name, city) values
('Janani', 'Chennai'),
('Arun', 'Coimbatore'),
('Priya', 'Madurai'),
('Karthik', 'Salem');

-- Banking accounts
insert into accounts (customer_id, account_type, balance) values
(1, 'Savings', 50000),
(1, 'Current', 20000),
(2, 'Savings', 30000),
(3, 'Savings', 15000),
(4, 'Current', 40000);

-- Railway trains
insert into trains (train_name, source, destination) values
('Express1', 'Chennai', 'Madurai'),
('Express2', 'Coimbatore', 'Salem'),
('Express3', 'Madurai', 'Chennai');

-- Railway bookings
insert into bookings (train_id, passenger_name, fare, status) values
(1, 'Janani', 500, 'Confirmed'),
(1, 'Arun', 500, 'Waiting'),
(2, 'Priya', 300, 'Confirmed'),
(3, 'Karthik', 450, 'Cancelled'),
(2, 'Meena', 300, 'Confirmed');

-- Employee sample data
insert into employee
(emp_id, emp_name, department, salary, city, joining_date) values
(101, 'John', 'IT', 60000, 'Chennai', '2022-01-15'),
(102, 'David', 'HR', 45000, 'Bangalore', '2021-03-10'),
(103, 'Smith', 'IT', 70000, 'Chennai', '2020-07-12'),
(104, 'Mary', 'Finance', 55000, 'Mumbai', '2023-01-20'),
(105, 'James', 'HR', 48000, 'Delhi', '2022-05-05'),
(106, 'Linda', 'Finance', 65000, 'Mumbai', '2021-08-18');

-- Customers sample data
insert into order_customers (customer_id, customer_name, email, city) values
(1, 'Anand', 'anand@example.com', 'Chennai'),
(2, 'Bala', 'bala@example.com', 'Bangalore'),
(3, 'Divya', 'divya@example.com', 'Madurai'),
(4, 'Kavya', 'kavya@example.com', 'Salem');

-- Orders sample data
insert into orders (order_id, customer_id, amount, order_date) values
(101, 1, 2500, '2026-01-10'),
(102, 2, 1500, '2026-01-12'),
(103, 1, 4000, '2026-01-15'),
(104, 3, 6000, '2026-01-18'),
(105, 4, 800, '2026-01-20');

-- Students sample data
insert into students (student_id, student_name, department, class, marks) values
(1, 'Arun', 'IT', 10, 85),
(2, 'Banu', 'CSE', 10, 92),
(3, 'Charan', 'IT', 9, 68),
(4, 'Divya', 'ECE', 10, 78),
(5, 'Ezhil', 'CSE', 9, 55),
(6, 'Farah', 'ECE', 10, 88);

-- SECTION 3: BANKING QUESTIONS 1-40

-- q1. retrieve all accounts with balance greater than 20,000
select *
from accounts
where balance > 20000;

-- q2. find customers who live in Chennai
select *
from customers
where city = 'Chennai';

-- q3. display accounts with balance between 20,000 and 50,000
select *
from accounts
where balance between 20000 and 50000;

-- q4. find customers whose names start with J
select *
from customers
where name like 'J%';

-- q5. retrieve accounts of type Savings or Current
select *
from accounts
where account_type in ('Savings', 'Current');

-- q6. display accounts that are not Savings
select *
from accounts
where account_type <> 'Savings';

-- q7. find customers whose names contain the letter a
select *
from customers
where name like '%a%';

-- q8. retrieve accounts with balance less than or equal to 30,000
select *
from accounts
where balance <= 30000;

-- q9. find customers who are not from Madurai
select *
from customers
where city <> 'Madurai';

-- q10. display accounts whose balance is not between 10,000 and 40,000
select *
from accounts
where balance not between 10000 and 40000;

-- q11. retrieve customers whose names end with i
select *
from customers
where name like '%i';

-- q12. find accounts with balance equal to 50,000
select *
from accounts
where balance = 50000;

-- q13. display customers from Chennai or Salem
select *
from customers
where city in ('Chennai', 'Salem');

-- q14. find accounts with balance greater than 10,000 and less than 40,000
select *
from accounts
where balance > 10000
  and balance < 40000;

-- q15. retrieve accounts whose type is not Current
select *
from accounts
where account_type not in ('Current');

-- q16. display all accounts sorted by balance in descending order
select *
from accounts
order by balance desc;

-- q17. list customers sorted alphabetically by name
select *
from customers
order by name asc;

-- q18. display accounts sorted by account type and then balance descending
select *
from accounts
order by account_type asc, balance desc;

-- q19. find the total balance of all accounts
select sum(balance) as total_balance
from accounts;

-- q20. calculate the average balance of accounts
select avg(balance) as average_balance
from accounts;

-- q21. find the maximum account balance
select max(balance) as maximum_balance
from accounts;

-- q22. find the minimum account balance
select min(balance) as minimum_balance
from accounts;

-- q23. count the total number of customers
select count(*) as total_customers
from customers;

-- q24. find total balance grouped by account type
select account_type, sum(balance) as total_balance
from accounts
group by account_type;

-- q25. find average balance for each account type
select account_type, avg(balance) as average_balance
from accounts
group by account_type;

-- q26. display account types having average balance greater than 20,000
select account_type, avg(balance) as average_balance
from accounts
group by account_type
having avg(balance) > 20000;

-- q27. count the number of accounts for each customer
select customer_id, count(*) as total_accounts
from accounts
group by customer_id;

-- q28. display customers having more than one account
select customer_id, count(*) as total_accounts
from accounts
group by customer_id
having count(*) > 1;

-- q29. retrieve customer names along with their account balances
select customers.name, accounts.balance
from customers
inner join accounts
    on customers.customer_id = accounts.customer_id;

-- q30. display all customers and their accounts
select customers.*, accounts.*
from customers
left join accounts
    on customers.customer_id = accounts.customer_id;

-- q31. display all accounts and corresponding customer details
select accounts.*, customers.name, customers.city
from accounts
inner join customers
    on accounts.customer_id = customers.customer_id;

-- q32. retrieve customer names and account type where balance is greater than 20,000
select customers.name, accounts.account_type, accounts.balance
from customers
inner join accounts
    on customers.customer_id = accounts.customer_id
where accounts.balance > 20000;

-- q33. list customers with their total balance using a join
select customers.customer_id,
       customers.name,
       sum(accounts.balance) as total_balance
from customers
inner join accounts
    on customers.customer_id = accounts.customer_id
group by customers.customer_id, customers.name;

-- q34. display customer names and balances sorted by balance
select customers.name, accounts.balance
from customers
inner join accounts
    on customers.customer_id = accounts.customer_id
order by accounts.balance desc;

-- q35. count the number of accounts for each city using a join
select customers.city,
       count(accounts.account_id) as total_accounts
from customers
left join accounts
    on customers.customer_id = accounts.customer_id
group by customers.city;

-- q36. find accounts with balance greater than average balance
select *
from accounts
where balance > (
    select avg(balance)
    from accounts
);

-- q37. retrieve customers who have accounts
select *
from customers
where customer_id in (
    select customer_id
    from accounts
);

-- q38. find customers who do not have any accounts
select *
from customers
where customer_id not in (
    select customer_id
    from accounts
);

-- q39. display account(s) with the maximum balance
select *
from accounts
where balance = (
    select max(balance)
    from accounts
);

-- q40. find customers whose total balance is greater than 40,000
select customers.customer_id,
       customers.name,
       sum(accounts.balance) as total_balance
from customers
inner join accounts
    on customers.customer_id = accounts.customer_id
group by customers.customer_id, customers.name
having sum(accounts.balance) > 40000;

-- q41. retrieve all bookings with fare greater than 400
select *
from bookings
where fare > 400;

-- q42. find bookings where status is not Confirmed
select *
from bookings
where status <> 'Confirmed';

-- q43. display trains starting from Chennai
select *
from trains
where source = 'Chennai';

-- q44. retrieve bookings with fare between 300 and 500
select *
from bookings
where fare between 300 and 500;

-- q45. find passengers whose names start with A
select *
from bookings
where passenger_name like 'A%';

-- q46. retrieve train names along with passenger names
select trains.train_name, bookings.passenger_name
from trains
inner join bookings
    on trains.train_id = bookings.train_id;

-- q47. count the number of bookings for each train
select trains.train_id,
       trains.train_name,
       count(bookings.booking_id) as total_bookings
from trains
left join bookings
    on trains.train_id = bookings.train_id
group by trains.train_id, trains.train_name;

-- q48. display train names and total fare across all bookings
select trains.train_name,
       coalesce(sum(bookings.fare), 0) as total_fare
from trains
left join bookings
    on trains.train_id = bookings.train_id
group by trains.train_id, trains.train_name;

-- q49. find bookings with fare equal to the highest fare
select *
from bookings
where fare = (
    select max(fare)
    from bookings
);

-- q50. retrieve trains that have more than one booking
select trains.train_id,
       trains.train_name,
       count(bookings.booking_id) as total_bookings
from trains
inner join bookings
    on trains.train_id = bookings.train_id
group by trains.train_id, trains.train_name
having count(bookings.booking_id) > 1;


-- EMPLOYEE MANAGEMENT QUESTIONS

-- q1. display all employee records
select *
from employee;

-- q2. display employee names and salaries
select emp_name, salary
from employee;

-- q3. find employees whose salary is greater than 50,000
select *
from employee
where salary > 50000;

-- q4. find employees whose salary is between 30,000 and 60,000
select *
from employee
where salary between 30000 and 60000;

-- q5. find employees who belong to the IT department
-- The table stores department names, not department IDs.
select *
from employee
where department = 'IT';

-- q6. find employees whose names start with A
select *
from employee
where emp_name like 'A%';

-- q7. display employees in descending order of salary
select *
from employee
order by salary desc;

-- q8. display the highest salary
select max(salary) as highest_salary
from employee;

-- q9. display the lowest salary
select min(salary) as lowest_salary
from employee;

-- q10. calculate the average salary
select avg(salary) as average_salary
from employee;

-- q11. count the total number of employees
select count(*) as total_employees
from employee;

-- q12. calculate the total salary paid to all employees
select sum(salary) as total_salary
from employee;

-- q13. count employees in each department
select department, count(*) as total_employees
from employee
group by department;

-- q14. display departments where the average salary is greater than 50,000
select department, avg(salary) as average_salary
from employee
group by department
having avg(salary) > 50000;

-- q15. find employees who earn more than the average salary
select *
from employee
where salary > (
    select avg(salary)
    from employee
);

-- q16. display all customers
select *
from order_customers;

-- q17. display all orders
select *
from orders;

-- q18. display customer names and email addresses
select customer_name, email
from order_customers;

-- q19. find customers from Chennai
select *
from order_customers
where city = 'Chennai';

-- q20. find orders with an amount greater than 1,000
select *
from orders
where amount > 1000;

-- q21. find orders with an amount between 500 and 2,000
select *
from orders
where amount between 500 and 2000;

-- q22. display orders from highest amount to lowest amount
select *
from orders
order by amount desc;

-- q23. calculate the total amount of all orders
select sum(amount) as total_order_amount
from orders;

-- q24. calculate the average order amount
select avg(amount) as average_order_amount
from orders;

-- q25. count the total number of orders
select count(*) as total_orders
from orders;

-- q26. display customer names with their order details
select order_customers.customer_name,
       orders.order_id,
       orders.amount
from order_customers
inner join orders
    on order_customers.customer_id = orders.customer_id;

-- q27. display all customers, including those without orders
select order_customers.customer_name,
       orders.order_id,
       orders.amount
from order_customers
left join orders
    on order_customers.customer_id = orders.customer_id;

-- q28. calculate the total order amount for each customer
select order_customers.customer_id,
       order_customers.customer_name,
       coalesce(sum(orders.amount), 0) as total_amount
from order_customers
left join orders
    on order_customers.customer_id = orders.customer_id
group by order_customers.customer_id, order_customers.customer_name;

-- q29. find customers whose total order amount is greater than 5,000
select order_customers.customer_id,
       order_customers.customer_name,
       sum(orders.amount) as total_amount
from order_customers
inner join orders
    on order_customers.customer_id = orders.customer_id
group by order_customers.customer_id, order_customers.customer_name
having sum(orders.amount) > 5000;

-- q30. find orders whose amount is greater than the average order amount
select *
from orders
where amount > (
    select avg(amount)
    from orders
);
-- SECTION 7: STUDENTS QUESTIONS 31-45
-- q31. display all student records
select *
from students;

-- q32. display student names and marks
select student_name, marks
from students;

-- q33. find students who scored more than 80 marks
select *
from students
where marks > 80;

-- q34. find students who scored between 60 and 90 marks
select *
from students
where marks between 60 and 90;

-- q35. find students who belong to class 10
select *
from students
where class = 10;

-- q36. find students whose names start with A
select *
from students
where student_name like 'A%';

-- q37. display students in descending order of marks
select *
from students
order by marks desc;

-- q38. display the highest mark
select max(marks) as highest_marks
from students;

-- q39. display the lowest mark
select min(marks) as lowest_marks
from students;

-- q40. calculate the average marks
select avg(marks) as average_marks
from students;

-- q41. count the total number of students
select count(*) as total_students
from students;

-- q42. calculate the total marks of all students
select sum(marks) as total_marks
from students;

-- q43. count the number of students in each class
select class, count(*) as total_students
from students
group by class;

-- q44. display classes where the average marks are greater than 75
select class, avg(marks) as average_marks
from students
group by class
having avg(marks) > 75;

-- q45. find students who scored more than the average marks
select *
from students
where marks > (
    select avg(marks)
    from students
);

select * from customers;
select * from accounts;
select * from trains;
select * from bookings;
select * from employee;
select * from order_customers;
select * from orders;
select * from students;

-- ====================== END OF ASSIGNMENT ======================
