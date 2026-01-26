CREATE TABLE customer_orders(
    order_id INT PRIMARY KEY ,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price INT,
    order_date DATE
);

INSERT INTO customer_orders (order_id,customer_name,product,quantity,price,order_date)VALUES
(1,'Roshan','Laptop',1,55000,'2025-01-10'),
(2,'Sanchit','Mouse',2,1200,'2025-01-11'),
(3,'Riya','Laptop',1,58000,'2025-01-12'),
(4,'Rohan','Keyboard',1,2500,'2025-01-12'),
(5,'Swayam','Mouse',3,1800,'2025-01-13'),
(6,'Rittika','Laptop',2,110000,'2025-01-14');

--step 2
SELECT * FROM customer_orders WHERE price>50000;

--step3
--asc
SELECT customer_name,product,price FROM customer_orders ORDER BY price ASC;
--desc
SELECT customer_name,product,price FROM customer_orders ORDER BY price DESC;
--mul col
SELECT customer_name,product,price FROM customer_orders ORDER BY product ASC, price DESC;

--step4
SELECT product, SUM(price) AS total_sales FROM customer_orders GROUP BY product;

--step5
SELECT product, SUM(price) AS total_sales FROM customer_orders GROUP BY product HAVING SUM(price)>60000;

--step6
SELECT product, SUM(price * quantity) AS total_sales FROM customer_orders WHERE SUM(price * quantity) > 60000 GROUP BY product;

SELECT product, SUM(price) FROM customer_orders GROUP BY product HAVING SUM(price)>60000;
