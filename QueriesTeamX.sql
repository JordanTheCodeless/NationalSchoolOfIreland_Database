#Jordans Queries
#Author Jordan Carthy
use primaryschool;
#First query
SELECT y.yearID, COUNT(s.studentID) AS TotalStudents
FROM Year y
LEFT JOIN Student s ON y.yearID = s.yearID
GROUP BY y.yearID;
#Here I will create the view with the information I have just gathered
CREATE VIEW YearWithTotalStudents AS
SELECT y.yearID, COUNT(s.studentID) AS TotalStudents
FROM Year y
LEFT JOIN Student s ON y.yearID = s.yearID
GROUP BY y.yearID;
SELECT * FROM YearWithTotalStudents;
#This query I needed to add facultyID to the employees table
ALTER TABLE employees
ADD COLUMN facultyID INT;
UPDATE employees e
JOIN faculty f ON e.faculty = f.faculty
SET e.facultyID = f.facultyID;

# Here i created a simple view to find the students that had no associated parents and deleted the information as it is not necessary
CREATE VIEW All_Parents AS
SELECT parentID
FROM Parent;
SELECT * FROM All_Parents;
# Here is where I found where the parentID values are null within students parentID
SELECT a.parentID
FROM All_Parents a
LEFT JOIN Students s ON a.parentID = s.parentID
WHERE s.parentID IS NULL;

# Created a view that shows Parents that have multiple children
CREATE VIEW Parents_With_Multiple_Children AS
SELECT parentID, COUNT(*) AS numStudents
FROM Student
GROUP BY parentID
HAVING COUNT(*) > 1;
SELECT * FROM Parents_With_Multiple_Children;

# Calculated total hours for employees working
SELECT
    employeeId, employeeFirstName,
    (
        COALESCE(mondayHours, 0) +
        COALESCE(tuesdayHours, 0) +
        COALESCE(wednesdayHours, 0) +
        COALESCE(thursdayHours, 0) +
        COALESCE(fridayHours, 0) +
        COALESCE(saturdayHours, 0) +
        COALESCE(sundayHours, 0)
    ) AS totalHours
FROM
    hours;

/*THESE ARE ANDRÉ'S QUERIES*/

/*This query  has a where clause to find all the teachers with a salary greater than 30,000 €*/

SELECT employeeID, employeeFirstName, employeeLastName, salary FROM employees WHERE position = 'teacher' AND salary > 30000;

/*Query with a group by clause to calculate the average salary for each faculty department*/

SELECT Faculty.faculty, AVG(employees.salary) AS average_salary FROM employees
JOIN Faculty ON employees.facultyID = Faculty.facultyID GROUP BY Faculty.faculty;

/*Query with a join between relations to get a list of students and the parent's contact information*/

SELECT Student.studentID, Student.firstName AS StudentFirstName, Student.lastName AS StudentLastName, Parent.parentFirstName, Parent.parentLastName, Parent.contact
FROM Student JOIN Parent ON Student.parentID = Parent.parentID;


/*Query combining where, group by and join clauses to find the total number of students for each year where the number of students is higher than 20*/

SELECT Year.yearID, COUNT(Student.studentID) AS TotalStudents FROM Year
JOIN Student ON Year.yearID = Student.yearID GROUP BY Year.yearID HAVING COUNT(Student.studentID) >= 20;


/*THESE ARE GREG'S QUERIES*/

/*Query with a where clause to find all the female employees that work in administration*/

SELECT employeeID, employeeFirstName, employeeLastName
FROM employees WHERE gender = 'F' AND faculty = 'administration';
 
/*Query with a group by clause to count the number of students in each year and list the corresponding teacher's first name*/

SELECT y.yearID, e.employeeFirstName AS TeacherFirstName, COUNT(s.studentID) AS NumberOfStudents FROM Year y
JOIN employees e ON y.employeeID = e.employeeID
JOIN Student s ON y.yearID = s.yearID
GROUP BY y.yearID, e.employeeFirstName;

/*Query with join to display all students along with their grades in maths*/

SELECT s.studentID, s.firstName AS StudentFirstName, s.lastName AS StudentLastName, g.Maths AS MathsGrade
FROM Student s
JOIN grades g ON s.studentID = g.studentID;

/*Query combining where, group by and join clauses to list the average maths grade for each year that is above 60*/

SELECT 
    g.yearID,
    AVG(g.Irish) AS avg_Irish,
    AVG(g.History) AS avg_History,
    AVG(g.Maths) AS avg_Maths,
    AVG(g.English) AS avg_English,
    AVG(g.Geography) AS avg_Geography
FROM 
    grades g
INNER JOIN 
    Year y ON g.yearID = y.yearID
GROUP BY 
    g.yearID
HAVING 
    AVG(g.Maths) > 60;


