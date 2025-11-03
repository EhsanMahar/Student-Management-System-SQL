CREATE DATABASE school_db;
USE school_db;

-- Students Table
CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT CHECK (age > 0),
city VARCHAR (50),
grade VARCHAR(2) DEFAULT 'A'

);
-- DESC students;

-- Courses Table
CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(50) NOT NULL,
duration_months INT CHECK (duration_months > 0)
);

-- Results Table
CREATE TABLE results (
result_id INT PRIMARY KEY,
student_id INT,
course_id INT,
marks INT CHECK (marks BETWEEN 0 AND 100),
FOREIGN KEY (student_id) REFERENCES students (student_id),
FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

SHOW TABLES;

INSERT INTO students(student_id, name, age, city , grade) VALUES
(1, 'Ehsan', 21, 'Mpk', 'A'),
(2, 'Ali', 19, 'Hyd', 'B'),
(3, 'Haris', 20, 'Hyd', 'A'),
(4, 'Faisal', 17, 'Lhr', 'C');

SELECT * FROM students;

INSERT INTO courses (course_id,course_name,duration_months) VALUES
(101, 'Database Basics', 2),
(102, 'Advanced SQL', 3),
(103, 'Python for Data', 4);
SELECT * FROM courses;

INSERT INTO results VALUES
(1, 1, 101, 92),
(2, 2, 102, 88),
(3, 3, 103, 79),
(4, 1, 103, 85),
(5, 4, 101, 66);
SELECT * FROM results;

-- Students with marks > 80

SELECT s.name, r.marks 
FROM students s
JOIN results r ON s.student_id = r.student_id
WHERE r.marks > 80;

-- Average marks by course
SELECT c.course_name, AVG(r.marks) AS avg_marks
FROM results r
JOIN courses c ON r.course_id = c.course_id
GROUP BY c.course_name;

-- Students sorted by marks (top performers)
SELECT s.name, r.marks 
FROM students s
JOIN results r ON s.student_id = r.student_id
ORDER BY r.marks DESC
LIMIT 3;

-- Count students by city

SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;

-- Update Result
UPDATE students
SET grade = 'A+'
WHERE student_id = 2;

