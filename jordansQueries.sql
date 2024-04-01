# Author Jordan Carthy
use primaryschool;
#First query
SELECT y.yearID, COUNT(s.studentID) AS TotalStudents
FROM Year y
LEFT JOIN Student s ON y.yearID = s.yearID
GROUP BY y.yearID;
# Here I will create the view with the information I have just gathered
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
