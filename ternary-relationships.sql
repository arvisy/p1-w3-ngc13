CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    professor_name VARCHAR(100)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(200),
    max_capacity INT
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE TeachingAssignment (
    assignment_id INT PRIMARY KEY,
    professor_id INT,
    course_id INT,
    start_date DATE,
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student (student_id, student_name)
VALUES
    (1, 'Meliodas'),
    (2, 'Kratos'),
    (3, 'Udin');

INSERT INTO Professor (professor_id, professor_name)
VALUES
    (101, 'Prof. Smith'),
    (102, 'Prof. Johnson'),
    (103, 'Prof. Davis'),
    (104, 'Prof. Wilson'),
    (105, 'Prof. Brown');

INSERT INTO Course (course_id, course_title, max_capacity)
VALUES
    (201, 'Introduction to Programming', 30),
    (202, 'Calculus I', 40),
    (203, 'Physics for Engineers', 35),
    (204, 'Organic Chemistry', 25),
    (205, 'Genetics', 30);

INSERT INTO Enrollment (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (301, 1, 201, '2023-01-10'),
    (302, 2, 202, '2023-01-11'),
    (303, 3, 203, '2023-01-12');

INSERT INTO TeachingAssignment (assignment_id, professor_id, course_id, start_date)
VALUES
    (401, 101, 201, '2023-01-10'),
    (402, 102, 202, '2023-01-11'),
    (403, 103, 203, '2023-01-12'),
    (404, 104, 204, '2023-01-13'),
    (405, 105, 205, '2023-01-14');

-- a. List of students enrolled in a specific course
SELECT Student.*
FROM Student
JOIN Enrollment ON Student.student_id = Enrollment.student_id
WHERE Enrollment.course_id = 201;

-- b. List of courses taught by a specific professor
SELECT Course.*
FROM Course
JOIN TeachingAssignment ON Course.course_id = TeachingAssignment.course_id
WHERE TeachingAssignment.professor_id = 102;

-- c. List of professors teaching a specific course
SELECT Professor.*
FROM Professor
JOIN TeachingAssignment ON Professor.professor_id = TeachingAssignment.professor_id
WHERE TeachingAssignment.course_id = 203;