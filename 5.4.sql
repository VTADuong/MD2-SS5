CREATE TABLE customers(
	cus_id INT PRIMARY KEY,
    cus_name VARCHAR (50)
);
INSERT INTO customers
VALUE
('1', 'Tran Van A'),
('2', 'Nguyen Van B'),
('3', 'Le Van C');

CREATE TABLE orders (
	ord_id INT PRIMARY KEY,
    ord_date DATE,
    cus_id INT,
    FOREIGN KEY (cus_id) REFERENCES customers (cus_id)
);
INSERT INTO orders
VALUE
('1', '2026-06-27', '2'),
('2', '2026-06-29', '1'),
('3', '2026-06-28', '3');

CREATE TABLE order_items (
	ord_id INT,
    cus_id INT,
    product_name VARCHAR (50),
    quantity INT,
    price DECIMAL (20, 0),
    FOREIGN KEY (cus_id) REFERENCES customers (cus_id),
    FOREIGN KEY (ord_id) REFERENCES orders (ord_id)
);
INSERT INTO order_items
VALUES
('1', '2', 'Laptop Dell', 1, 15000000),
('2', '1', 'Chuot Logitech', 2, 300000),
('3', '3', 'iPhone 15', 1, 22000000);

SELECT ord_id, ord_date, cus_name FROM orders AS o
INNER JOIN customers AS c
ON o.cus_id = c.cus_id;

SELECT o.ord_id, o.ord_date, oi.product_name, oi.quantity, oi.price FROM orders AS o
INNER JOIN order_items AS oi
ON o.ord_id = i.ord_date;

SELECT o.ord_id, o.ord_date, SUM(oi.quantity * oi.price) AS total_price FROM orders AS o
INNER JOIN order_items AS oi
ON o.ord_id = oi.ord_id
GROUP BY o.ord_id, o.ord_date;

SELECT o.ord_id, o.ord_date, SUM(oi.quantity * oi.price) AS total_price FROM orders AS o
INNER JOIN order_items AS oi
ON o.ord_id = oi.ord_id
GROUP BY o.ord_id, o.ord_date
HAVING SUM(oi.quantity * oi.price) > 10000000;