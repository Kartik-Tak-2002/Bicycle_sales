Create bicycle_sales;
use bicycle_sales;

CREATE TABLE brands (
    brand_ID INT,
    brand_name VARCHAR(20)
);
select * from brands;

CREATE TABLE categories (
    category_Id INT,
    category_name VARCHAR(20)
);
select * from categories;
CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(30),
    city VARCHAR(50),
    state VARCHAR(40)
); 
select * from customers;

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price FLOAT,
    discount FLOAT
);
select * from order_items;

CREATE TABLE orders1 (
    order_id INT,
    customer_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT,
    staff_id INT
);
select * from orders1;


CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    brand_id INT,
    category_id INT,
    model_year YEAR,
    list_price FLOAT
);

select * from products;

CREATE TABLE Staff (
    staff_id INT,
    Emp_name VARCHAR(50),
    email VARCHAR(50),
    phone INT,
    active INT,
    store_id INT,
    maanger_id INT
);
select * from Staff;

CREATE TABLE stocks (
    store_id INT,
    product_id INT,
    quantity INT
);

CREATE TABLE stores (
    store_id INT,
    store_name VARCHAR(50),
    phone INT,
    email VARCHAR(40),
    street VARCHAR(100),
    city VARCHAR(40),
    state VARCHAR(20),
    zip_code INT
);

select * from stores;


-- Total sales

SELECT 
    SUM(oi.list_price) AS Total_Sale
FROM
    order_items oi;
    
    
-- Top 3 order_item price

SELECT 
    *
FROM
    order_items
ORDER BY list_price desc
LIMIT 3;

-- top 10 customre
SELECT 
    *
FROM
    customers c 
WHERE
    customer_id
LIMIT 10;

--
SELECT 
    o.store_id,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM
    order_items o
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY o.store_id;



