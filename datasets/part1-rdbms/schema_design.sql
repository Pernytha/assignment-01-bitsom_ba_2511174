CREATE DATABASE assignment_db;
USE assignment_db;

-- Customers table
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(150) NOT NULL UNIQUE,
    customer_city VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives
CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(150) NOT NULL UNIQUE,
    office_address VARCHAR(200) NOT NULL
);

-- Orders table
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

-- Order Items table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

SHOW TABLES;


-- INSERT DATA
-- ============================

-- Customers
INSERT INTO Customers VALUES
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');


-- Products
INSERT INTO Products VALUES
('P004', 'Notebook', 'Stationery', 120),
('P007', 'Pen Set', 'Stationery', 250),
('P005', 'Headphones', 'Electronics', 3200),
('P003', 'Desk Chair', 'Furniture', 8500),
('P006', 'Standing Desk', 'Furniture', 22000);

-- SalesReps
INSERT INTO SalesReps VALUES
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

-- Orders
INSERT INTO Orders VALUES
('ORD1027', '2023-11-02', 'C002', 'SR02'),
('ORD1114', '2023-08-06', 'C001', 'SR01'),
('ORD1153', '2023-02-14', 'C006', 'SR01'),
('ORD1002', '2023-01-17', 'C002', 'SR02'),
('ORD1118', '2023-11-10', 'C006', 'SR02');

-- OrderItems
INSERT INTO OrderItems (order_id, product_id, quantity) VALUES
('ORD1027', 'P004', 4),
('ORD1114', 'P007', 2),
('ORD1153', 'P007', 3),
('ORD1002', 'P005', 1),
('ORD1118', 'P007', 5);

-- TEST QUERY
-- ============================

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;