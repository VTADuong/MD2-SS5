CREATE TABLE products(
	`id` INT PRIMARY KEY,
    `name` VARCHAR (50),
    `category`VARCHAR (50),
    `price` DECIMAL (20, 0)
);
INSERT INTO products
VALUE
('1', 'snack', 'banh keo', '8000'),
('2', 'bap my', 'fresh', '21000'),
('3', 'nuoc suoi', 'drink', '5000'),
('4', 'custar', 'banh keo', '30000');

SELECT * FROM products
WHERE `price` > (SELECT AVG(`price`) FROM products); 

SELECT * FROM products AS p
WHERE price = (
	SELECT MAX(price)
    FROM products
    WHERE category = p.category
);

SELECT * FROM products AS p1
WHERE EXISTS (
	SELECT 1 
    FROM products AS p2
    WHERE p2.category = p1.category AND p2.price > 20000
);