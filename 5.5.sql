CREATE TABLE scores(
	`student_id` INT,
    `subject` VARCHAR (20),
    `score` DECIMAL (4, 2),
    PRIMARY KEY (student_id, subject)
);
INSERT INTO scores 
VALUES 
('1', 'Toan cao cap', '8.5'),
('1', 'Triet hoc', '4.5'),
('2', 'Toan cao cap', '9.0'),
('2', 'Triet hoc', '7.0'),
('3', 'Toan cao cap', '3.5');
SELECT student_id, AVG(score) AS diem_tb 
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7.0;

SELECT student_id, AVG (score) AS max_diem_tb 
FROM scores
GROUP BY student_id
HAVING AVG (score) = (
	SELECT MAX(avg_table.avg_score)
    FROM (
		SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
	) AS avg_table
);

SELECT student_id, AVG(score) AS diem_tb
FROM scores
GROUP BY student_id
HAVING
	AVG(score) > (
		SELECT AVG (score)
        FROM scores
	);