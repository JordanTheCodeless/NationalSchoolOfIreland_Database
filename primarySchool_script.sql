# Database created 12/03/2024
CREATE DATABASE primarySchool;
#Use primarySchool dataBase
USE primarySchool;
CREATE TABLE Student (
    StudentID INT(6) NOT NULL PRIMARY KEY,
    StudentFName VARCHAR(20) NOT NULL,
    StudentLName VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);

