

  use task2

  --### 1.Create the `Student` and `Courses` tables with a one-to-many relationship.( One from student and many from courses )


create table student 
( studentID int primary key,
  Name varchar(50),
  age int,
  Email varchar(50))

create table courses
(
  courseID int primary key ,
  courseName varchar(50),
  studentID int,
  foreign key (studentID) references student(studentID)

)


insert into student (studentID ,Name ,Age ,Email)
values 
(1,'sara',20,'sara@gmail.com'),
(2,'fatma',24,'fatma@gmail.com')

insert into courses
values
(1, 'math',1), 
(2,'arabic',2),
(3,'english',1)

select student.Name as studentName , courses.courseName
from student
join courses on student.studentID  =courses.courseID

select * from courses

select * from student

--2. Insert 3 records into the Student table.

insert into student (studentID ,Name ,Age ,Email)
values 
(3,'ali',20,'ali@gmail.com'),
(4,'amal' , 23,'amal@gmail.com'),

(5,'ahmad' , 20,'ahmad@gmail.com')


--3. Insert 5 records into the Courses table.

insert into courses
values
(4, 'programming',1), 
(5,'coumputer',2),
(6,'english',2),
(7,'database',3),
(8,'hestory',3)


--4. Retrieve all students and their courses.

select student.Name as studentName , courses.courseName
from student
join courses on student.studentID=courses.studentID

--5. Update a student's email address.

update student 
set Email = 'aa@gmail.com'
where studentID=1 

--6. Delete a course for a specific student.

DELETE FROM Courses
WHERE StudentID = 1 AND CourseID = 1

--7. Add a new column Gender to the Student table.
ALTER TABLE Student
ADD COLUMN Gender VARCHAR(50);

-- Update the Gender column for all students.
UPDATE Student
SET Gender = 'Male'
WHERE StudentID = 1;

--9. Retrieve the count of courses each student is enrolled in.
SELECT Student.Name AS StudentName, COUNT(Courses.CourseID) AS CourseCount
FROM Student
LEFT JOIN Courses ON Student.StudentID = Courses.StudentID
GROUP BY Student.StudentID, Student.Name

--10. Select students whose names start with 'M'.


SELECT * 
FROM Student
WHERE Name LIKE 'M%'


--11. Retrieve all students and convert their names to uppercase.
SELECT StudentID, UPPER(Name) AS UppercaseName, Age, Email
FROM Student

--12. Retrieve courses and convert their names to lowercase.

SELECT CourseID, LOWER(CourseName) AS LowercaseCourseName
FROM Courses


--15. Retrieve courses with student details using an alias.

SELECT 
    c.CourseID AS CourseID,
    c.CourseName AS CourseName,
    s.StudentID AS StudentID,
    s.Name AS StudentName,
    s.Age AS StudentAge,
    s.Email AS StudentEmail
FROM 
    Courses c
JOIN 
    Student s ON c.StudentID = s.StudentID

--16. Add a new student and enroll them in two courses.


	SELECT StudentID 
	FROM Student 
	WHERE Name = 'anwar'
	AND Email = 'anwar@gmil.com'


INSERT INTO Courses (CourseID, StudentID)
VALUES
(11, (SELECT StudentID FROM Student WHERE Name = 'aaaa' AND Email = 'aaa@egmil.com')),
(12, (SELECT StudentID FROM Student WHERE Name = 'bbb' AND Email = 'bbbb@gmil.com'));


---17. Find the youngest student.

SELECT * 
FROM Student
ORDER BY Age ASC




--18. Delete a student and all their associated courses.

DELETE FROM Student
WHERE StudentID = 1

begin transaction 
delete from courses where studentID =1
delete from student where studentID =1 
commit 

--20. Retrieve all course names in alphabetical order.

SELECT CourseName
FROM Courses
ORDER BY CourseName ASC

--Create Procedure to Display all Students with Course Name

CREATE PROCEDURE GetStudentsWithCourses()
BEGIN
    SELECT 
        s.StudentID, 
        s.Name AS StudentName, 
        s.Age, 
        s.Email, 
        c.CourseName
    FROM 
        Student s
    JOIN 
    Courses c ON s.StudentID = c.StudentID
    end 


--Create Procedure to Display all Students with Course Name by Student ID
cREATE PROCEDURE 
GetStudentCoursesByID(IN p_StudentID INT)
BEGIN
    SELECT 
        s.StudentID, 
        s.Name AS StudentName, 
        s.Age, 
        s.Email, 
        c.CourseName
    FROM 
        Student s
    JOIN 
        Courses c ON s.StudentID = c.StudentID
    WHERE 
        s.StudentID = p_StudentID;
END


CALL GetStudentCoursesByID(1) 





