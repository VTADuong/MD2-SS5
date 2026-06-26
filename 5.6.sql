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
    FOREIGN KEY (ord_id) REFERENCES orders (ord_id),
    PRIMARY KEY (ord_id, product_name)
);
INSERT INTO order_items
VALUES
('1', '2', 'Laptop Dell', 1, 15000000),
('1', '2', 'SamsungS15', 1, 23000000),
('1', '2', 'Sac du phong', 1, 500000),
('2', '1', 'Chuot Logitech', 2, 300000),
('3', '3', 'iPhone 15', 1, 22000000),
('3', '3', 'airphone', 1, 4000000);

SELECT o.ord_id, c.cus_name, SUM(oi.quantity * oi.price) AS total_price
FROM orders AS o
INNER JOIN customers AS c ON o.cus_id = c.cus_id
INNER JOIN order_items AS oi ON o.ord_id = oi.ord_id
GROUP BY o.ord_id, c.cus_name;

SELECT c.cus_id, c.cus_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM customers AS c
INNER JOIN orders AS o ON c.cus_id = o.cus_id
INNER JOIN order_items AS oi ON o.ord_id = oi.ord_id
GROUP BY cus_id, cus_name
HAVING SUM(oi.quantity * oi.price) > 20000000; 

SELECT c.cus_id, c.cus_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM customers AS c
INNER JOIN orders AS o ON c.cus_id = o.cus_id
INNER JOIN order_items AS oi ON o.ord_id = oi.ord_id
GROUP BY cus_id, cus_name
HAVING SUM(oi.quantity * oi.price) = (
	SELECT MAX(rev_table.total_rev)
    FROM (
		SELECT SUM(oi2.quantity * oi2.price) AS total_rev
        FROM orders AS o2
        INNER JOIN order_items AS oi2 ON o2.ord_id = oi2.ord_id
        GROUP BY o2.cus_id
	) AS rev_table
);
