CREATE DATABASE SQL_Practice;

USE SQL_Practice;

-- 1. Banking: Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- 2. Banking: Accounts
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


INSERT INTO customers (name, city) VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);


-- 3. Railway: Trains
CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

-- 4. Railway: Bookings
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id)
        REFERENCES trains(train_id)
);
INSERT INTO trains (train_name, source, destination) VALUES
('Express1','Chennai','Madurai'),
('Express2','Coimbatore','Salem'),
('Express3','Madurai','Chennai');

INSERT INTO bookings
(train_id, passenger_name, fare, status) VALUES
(1,'Janani',500,'Confirmed'),
(1,'Arun',500,'Waiting'),
(2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'),
(2,'Meena',300,'Confirmed');
-- 5. Employee Management
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');
-- 6. Customers and Orders
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

-- 7. Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

SHOW TABLES;
SELECT * FROM customers;
SELECT * FROM accounts;
SELECT * FROM trains;
SELECT * FROM bookings;
SELECT * FROM Employee;

-- Questions 1-50
-- q1. retrieve all accounts with balance greater than 20,000
select *
from accounts
where balance > 20000;

-- q2. find customers who live in chennai
select *
from customers
where city = 'Chennai';


-- q3. display accounts with balance between 20,000 and 50,000
select *
from accounts
where balance between 20000 and 50000;


-- q4. find customers whose names start with 'j'
select *
from customers
where name like 'J%';


-- q5. retrieve accounts of type savings or current
select *
from accounts
where account_type in ('Savings', 'Current');


-- q6. display accounts that are not savings
select *
from accounts
where account_type <> 'Savings';


-- q7. find customers whose names contain the letter 'a'
select *
from customers
where name like '%a%';


-- q8. retrieve accounts with balance less than or equal to 30,000
select *
from accounts
where balance <= 30000;


-- q9. find customers who are not from madurai
select *
from customers
where city <> 'Madurai';


-- q10. display accounts whose balance is not between
select *
from accounts
where balance not between 10000 and 40000;


-- q11. retrieve customers whose names end with 'i'
select *
from customers
where name like '%i';


-- q12. find accounts with balance equal to 50,000
select *
from accounts
where balance = 50000;


-- q13. display customers from chennai or salem
select *
from customers
where city in ('Chennai', 'Salem');


-- q14. find accounts with balance greater than 10,000
select *
from accounts
where balance > 10000
  and balance < 40000;


-- q15. retrieve accounts whose type is not current
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

-- q18. display accounts sorted by account type and then by balance in descending order
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


-- q33. list customers with their total balance using join
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

-- q35. count the number of accounts for each city using join
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

select trains.train_name,
       bookings.passenger_name
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

-- q48. display train names and total fare for each train

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

-- employee management: questions 1 to 15

-- q1. display all employee records

select *
from Employee;


-- q2. display employee names and salaries
select emp_name, salary
from Employee;


-- q3. find employees whose salary is greater than 50,000

select *
from Employee
where salary > 50000;


-- q4. find employees whose salary is between 30,000 and 60,000

select *
from Employee
where salary between 30000 and 60000;

-- q5. find employees who belong to department 2

select *
from Employee
where dept_id = 2;


-- q6. find employees whose names start with A

select *
from Employee
where emp_name like 'A%';


-- q7. display employees in descending order of salary
select *
from Employee
order by salary desc;


-- q8. display the highest salary

select max(salary) as highest_salary
from Employee;


-- q9. display the lowest salary

select min(salary) as lowest_salary
from Employee;


-- q10. calculate the average salary

select avg(salary) as average_salary
from Employee;


-- q11. count the total number of employees
select count(*) as total_employees
from Employee;


-- q12. calculate the total salary paid to all employees

select sum(salary) as total_salary
from Employee;


-- q13. count employees in each department
select dept_id,
       count(*) as total_employees
from Employee
group by dept_id;

-- q14. display departments where the average salary is greater than 50,000

select dept_id,
       avg(salary) as average_salary
from Employee
group by dept_id
having avg(salary) > 50000;


-- q15. find employees who earn more than the average salary

select *
from Employee
where salary > (
    select avg(salary)
    from Employee
);


-- customers and orders: questions 16 to 30

-- q16. display all customers

select *
from Customers;


-- q17. display all orders

select *
from Orders;


-- q18. display customer names and email addresses

select name, email
from Customers;


-- q19. find customers from Chennai

select *
from Customers
where city = 'Chennai';


-- q20. find orders with an amount greater than 1,000

select *
from Orders
where amount > 1000;


-- q21. find orders with an amount between 500 and 2,000

select *
from Orders
where amount between 500 and 2000;


-- q22. display orders from highest amount to lowest amount

select *
from Orders
order by amount desc;


-- q23. calculate the total amount of all orders

select sum(amount) as total_order_amount
from Orders;


-- q24. calculate the average order amount

select avg(amount) as average_order_amount
from Orders;


-- q25. count the total number of orders

select count(*) as total_orders
from Orders;


-- q26. display customer names with their order details

select Customers.name,
       Orders.order_id,
       Orders.amount
from Customers
inner join Orders
    on Customers.customer_id = Orders.customer_id;


-- q27. display all customers, including those without orders

select Customers.name,
       Orders.order_id,
       Orders.amount
from Customers
left join Orders
    on Customers.customer_id = Orders.customer_id;


-- q28. calculate the total order amount for each customer

select Customers.customer_id,
       Customers.name,
       coalesce(sum(Orders.amount), 0) as total_amount
from Customers
left join Orders
    on Customers.customer_id = Orders.customer_id
group by Customers.customer_id, Customers.name;


-- q29. find customers whose total order amount is greater than 5,000

select Customers.customer_id,
       Customers.name,
       sum(Orders.amount) as total_amount
from Customers
inner join Orders
    on Customers.customer_id = Orders.customer_id
group by Customers.customer_id, Customers.name
having sum(Orders.amount) > 5000;


-- q30. find orders whose amount is greater than the average order amount

select *
from Orders
where amount > (
    select avg(amount)
    from Orders
);


-- students: questions 31 to 45

-- q31. display all student records

select *
from Students;


-- q32. display student names and marks

select student_name, marks
from Students;


-- q33. find students who scored more than 80 marks

select *
from Students
where marks > 80;


-- q34. find students who scored between 60 and 90 marks

select *
from Students
where marks between 60 and 90;


-- q35. find students who belong to class 10

select *
from Students
where class = 10;


-- q36. find students whose names start with A

select *
from Students
where student_name like 'A%';


-- q37. display students in descending order of marks

select *
from Students
order by marks desc;


-- q38. display the highest mark

select max(marks) as highest_marks
from Students;


-- q39. display the lowest mark

select min(marks) as lowest_marks
from Students;


-- q40. calculate the average marks

select avg(marks) as average_marks
from Students;


-- q41. count the total number of students

select count(*) as total_students
from Students;


-- q42. calculate the total marks of all students

select sum(marks) as total_marks
from Students;


-- q43. count the number of students in each class

select class,
       count(*) as total_students
from Students
group by class;


-- q44. display classes where the average marks are greater than 75

select class,
       avg(marks) as average_marks
from Students
group by class
having avg(marks) > 75;


-- q45. find students who scored more than the average marks

select *
from Students
where marks > (
    select avg(marks)
    from Students
);
