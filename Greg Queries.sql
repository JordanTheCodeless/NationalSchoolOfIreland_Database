/*Query with a where clasue to find all the female employees that work in administration*/

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

