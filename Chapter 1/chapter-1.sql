-- Chapter 1: SQL Fundamentals

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    grade TEXT
);

INSERT INTO students (name, age, grade)
VALUES
    ('Alice', 20, 'A'),
    ('Bob', 22, 'B'),
    ('Charlie', 21, 'C');

SELECT * FROM students;
