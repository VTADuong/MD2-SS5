CREATE TABLE students(
	`student_id` INT PRIMARY KEY,
    `full_name` VARCHAR (100),
    `birth_year` YEAR,
    `gender` VARCHAR (10),
    `score` DECIMAL (3, 1)
);
INSERT INTO students
VALUES 
('1', 'Nguyen Van A', '2002', 'male', '8'),
('2', 'Tran Van B', '2001', 'male', '7.6'),
('3', 'Bui Thi C', '2004', 'female', 5.5),
('4', 'Lai Van D', '2001', 'male', '7.8'),
('5', 'Duong Thi E', '2003', 'female', '9.5');

SELECT 
	`student_id`, 
    UPPER (`full_name`) AS up_name
FROM students;

SELECT
	`full_name`,
    (2026 - `birth_year`) AS age
FROM students;

SELECT 
	`student_id`,
    `full_name`,
    ROUND(score, 1) AS ro_score
FROM students;

SELECT
	COUNT(student_id) AS total,
    MAX(score) AS max_score,
    MIN(score) AS min_score
FROM students;