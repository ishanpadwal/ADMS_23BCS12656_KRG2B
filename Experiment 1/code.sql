-- QUESTION 1

CREATE TABLE Author (
author_id INT PRIMARY KEY,
name VARCHAR(100),
country VARCHAR(100)
);
-- Create Book table with a foreign key to Author
CREATE TABLE Book (
book_id INT PRIMARY KEY,
title VARCHAR(200),
author_id INT,
FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
-- Insert data into Author
INSERT INTO Author (author_id, name, country) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, ' Erich Segal ', 'United States'),
(3, 'Jojo Moyes', 'Japan');
-- Insert data into Book
INSERT INTO Book (book_id, title, author_id) VALUES
(101, 'Harry Potter and the Philosopher\s Stone', 1),
(102, 'Love Story', 2),
(103, 'Me Before You', 3);
-- Join the tables to get book title, author name, and country
SELECT
Book.title AS Book_Title,
Author.name AS Author_Name,
Author.country AS Author_Country
FROM
Book
INNER JOIN
Author ON Book.author_id = Author.author_id;


--Question 2

- Department table
CREATE TABLE Department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100)
);
-- Course table with a foreign key to Department
CREATE TABLE Course (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
-- Insert into Department
INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Civil Engineering'),
(5, 'Biotech');
-- Insert into Course
INSERT INTO Course (course_id, course_name, dept_id) VALUES
(101, 'Data Structures', 1),
(102, 'Algorithms', 1),
(103, 'Operating Systems', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),
-- Departments with more than 2 courses
SELECT dept_name
FROM Department
WHERE dept_id IN (
SELECT dept_id
FROM Course
GROUP BY dept_id
HAVING COUNT(course_id) > 2
);
-- Grant SELECT access
GRANT SELECT ON Course TO readonly_user;