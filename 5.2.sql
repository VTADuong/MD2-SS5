CREATE TABLE employees (
	`emp_id` INT PRIMARY KEY,
    `full_name` VARCHAR (100),
    `department` VARCHAR (20),
    `salary` DECIMAL (15, 0)
);
INSERT INTO employees
VALUE
('1', 'Nguyen Long Nhat', 'Sale', '5000000'),
('2', 'Tran Anh Luyen', 'HR', '15000000'),
('3', 'Nguyen Ngoc Lien', 'Marketing', '5000000'),
('4', 'Le Thanh Mai', 'Sale', '21000000'),
('5', 'Bui Manh Hai', 'IT', '17000000'),
('6', 'Nguyen Anh', 'Sale', '25000000'),
('7', 'Tran Lung', 'IT', '40000000'),
('8', 'Nguyen Lien', 'Marketing', '3000000'),
('9', 'Le Thanh', 'IT', '21000000'),
('10', 'Bui Hien', 'IT', '16000000');

SELECT department, COUNT(emp_id) AS total
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS luong_tb
FROM employees
GROUP BY department;

SELECT department, COUNT(emp_id) AS so_luong_nv
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 3;

SELECT department, AVG(salary) AS luong_tb
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;