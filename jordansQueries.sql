# Author Jordan Carthy
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

SET SQL_SAFE_UPDATES = 1;
# Here i created a simple view to find the students that had no associated parents and deleted the information as it is not necessary
CREATE VIEW All_Parents AS
SELECT parentID
FROM Parent;
# Here is where I found where the parentID values are null within students parentID
SELECT a.parentID
FROM All_Parents a
LEFT JOIN Students s ON a.parentID = s.parentID
WHERE s.parentID IS NULL;
