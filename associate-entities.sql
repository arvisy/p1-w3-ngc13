CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255),
    major VARCHAR(50),
    year_of_study INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    instructor VARCHAR(100),
    schedule VARCHAR(50),
    credit_hours INT
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    preferred_schedule VARCHAR(50),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (student_id, name, email, major, year_of_study)
VALUES
    (1, 'Kratos', 'kratos@example.com', 'Computer Science', 2),
    (2, 'Meliodas', 'meliodas@example.com', 'Mathematics', 3),
    (3, 'Dragnil', 'dragnil@example.com', 'Physics', 1),
    (4, 'Udin', 'udin@example.com', 'Chemistry', 4),
    (5, 'Ming Ming', 'mingming@example.com', 'Biology', 2);

INSERT INTO courses (course_id, title, instructor, schedule, credit_hours)
VALUES
    (101, 'Introduction to Programming', 'Prof. Smith', 'MWF 10:00 AM - 11:30 AM', 3),
    (102, 'Calculus I', 'Prof. Johnson', 'TTH 1:00 PM - 2:30 PM', 4),
    (103, 'Physics for Engineers', 'Prof. Brown', 'MWF 2:00 PM - 3:30 PM', 4),
    (104, 'Organic Chemistry', 'Prof. Davis', 'TTH 10:00 AM - 11:30 AM', 3),
    (105, 'Genetics', 'Prof. Wilson', 'MWF 11:00 AM - 12:30 PM', 3);

INSERT INTO student_courses (student_id, course_id, preferred_schedule)
VALUES
    (1, 101, 'MWF 10:00 AM - 11:30 AM'),
    (1, 102, 'TTH 1:00 PM - 2:30 PM'),
    (2, 103, 'MWF 2:00 PM - 3:30 PM'),
    (3, 104, 'TTH 10:00 AM - 11:30 AM'),
    (4, 105, 'MWF 11:00 AM - 12:30 PM');

-- a. Retrieve the list of all students enrolled in a specific course.
SELECT students.*
FROM students
JOIN student_courses ON students.student_id = student_courses.student_id
WHERE student_courses.course_id = 101;

-- b. Find all the courses a particular student has registered for.
SELECT courses.*
FROM courses
JOIN student_courses ON courses.course_id = student_courses.course_id
WHERE student_courses.student_id = 1;

-- c. Get the preferred schedule of a student for a specific course.
SELECT preferred_schedule
FROM student_courses
WHERE student_id = 1 AND course_id = 101;