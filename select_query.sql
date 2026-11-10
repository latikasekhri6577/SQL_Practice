CREATE TABLE customers_record (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE
);
INSERT INTO customers_record VALUES
(1, 'Aarav', 'Sharma', 25, 'aarav@gmail.com', '9876543210', 'Mumbai', 'Maharashtra', '2024-02-15'),
(2, 'Priya', 'Verma', 32, 'priya@yahoo.com', '8765432109', 'New Delhi', 'Delhi', '2023-05-20'),
(3, 'Ananya', 'Singh', 40, 'ananya@gmail.com', '9123456780', 'Bengaluru', 'Karnataka', '2024-07-10'),
(4, 'Rahul', 'Kumar', 19, 'rahul@gmail.com', '9988776655', 'Jaipur', 'Rajasthan', '2025-01-12'),
(5, 'Simran', 'Kaur', 28, 'simran@gmail.com', '8877665544', 'Amritsar', 'Punjab', '2024-11-05'),
(6, 'Aman', 'Gill', 45, 'aman@yahoo.com', '9876501234', 'Ludhiana', 'Punjab', '2022-08-18'),
(7, 'Neha', 'Gupta', 22, 'neha@gmail.com', '7654321098', 'Mumbai', 'Maharashtra', '2025-03-25'),
(8, 'Arjun', 'Mehta', 35, 'arjun@gmail.com', '9234567890', 'Chandigarh', 'Chandigarh', '2024-04-14'),
(9, 'Karan', 'Malhotra', 55, 'karan@yahoo.com', '8123456789', 'New Delhi', 'Delhi', '2023-09-30'),
(10, 'Isha', 'Patel', 27, 'isha@gmail.com', '9987654321', 'Ahmedabad', 'Gujarat', '2024-12-01'),
(11, 'Aditya', 'Shah', 30, 'aditya@gmail.com', '9345678901', 'Bengaluru', 'Karnataka', '2025-06-15'),
(12, 'Riya', 'Das', 18, 'riya@yahoo.com', '7890123456', 'Kolkata', 'West Bengal', '2023-02-10'),
(13, 'Kabir', 'Arora', 38, 'kabir@gmail.com', '9123456700', 'Jaipur', 'Rajasthan', '2024-08-22'),
(14, 'Aisha', 'Khan', 24, 'aisha@gmail.com', '8765432190', 'Hyderabad', 'Telangana', '2025-09-05'),
(15, 'Dev', 'Kapoor', 60, 'dev@yahoo.com', '9871234560', 'Pune', 'Maharashtra', '2022-04-17');

CREATE TABLE orders_record (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders_record VALUES
(101, 1, '2025-01-15', 25000),
(102, 2, '2024-06-20', 15000),
(103, 3, '2025-03-10', 45000),
(104, 4, '2025-07-25', 12000),
(105, 5, '2023-11-12', 30000),
(106, 6, '2025-09-05', 55000),
(107, 7, '2024-12-15', 18000),
(108, 8, '2025-11-01', 40000);

CREATE TABLE products_record (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products_record VALUES
(1, 'Laptop', 'Electronics', 45000, 10),
(2, 'Mobile Phone', 'Electronics', 25000, 20),
(3, 'Headphones', 'Accessories', 5000, 50),
(4, 'Smart TV', 'Electronics', 50000, 8),
(5, 'Tablet', 'Electronics', 18000, 15),
(6, 'Keyboard', 'Accessories', 1500, 40),
(7, 'Gaming Laptop', 'Electronics', 75000, 5),
(8, 'Smart Watch', 'Accessories', 12000, 25),
(9, 'Monitor', 'Electronics', 15000, 12),
(10, 'Camera', 'Electronics', 35000, 7);

-- List every record from the customers table.
select * from customers_record;

-- Show the unique states where customers are located, sorted alphabetically.
select DISTINCT state from customers_record
order by state asc;

-- Return the first 10 customers as they appear in the table.
select top 10 * from customers_record;

-- Find customers whose age is greater than 35.
select * from customers_record 
where age>35;

-- List customers whose first name starts with the letter ‘A’.
select * from customers_record
where first_name LIKE 'A%';


-- Show customers whose email address uses the ‘gmail.com’ domain.
select * from customers_record
where email LIKE '%gmail.com%';

-- Retrieve customers who registered in the year 2024.
select * from customers_record
where registration_date LIKE '2024%';

-- Return customers whose age is between 20 and 30 (inclusive).
select * from customers_record
where age between 20 and 30;

-- List customers who live in any of these cities: Mumbai, New Delhi, Bengaluru, or Jaipur.
select * from customers_record
where city in ('Mumbai', 'New Delhi', 'Bengaluru','Jaipur');

-- List customers who do not live in these cities: Mumbai, New Delhi, Bengaluru, or Jaipur.
select * from customers_record
where city not in ('Mumbai', 'New Delhi', 'Bengaluru','Jaipur');

-- Show the 5 oldest customers, from oldest to youngest.
select top 5 * from customers_record
order by age desc;

-- Show the 5 youngest customers, from youngest to oldest.
select top 5 * from customers_record
order by age asc;

-- Find customers whose phone number starts with ‘9’.
select * from customers_record
where phone like '9%';

-- Return all orders placed in the year 2025.
select * from orders_record
where order_date like '2025%';

-- List products priced between 10,000 and 50,000, ordered from highest to lowest price.
select * from products_record
where price between 10000 and 50000 
order by price desc;
