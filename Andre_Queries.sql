/*This querry  has a where clasue to find all the teachers with a salary greater than 30,000 €*/

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