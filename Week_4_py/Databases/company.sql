-- SQLite
PRAGMA foreign_keys = ON

CREATE TABLE Employees (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
First_name TEXT NOT NULL,
Last_name TEXT NOT NULL,
Age INTEGER,
Email TEXT UNIQUE,
Department_Id INTEGER,
FOREIGN KEY(Department_Id) REFERENCES Department(Id)
);



CREATE TABLE Department (
Id INTEGER PRIMARY KEY AUTOINCREMENT,
Name TEXT NOT NULL
);

INSERT INTO Department(Name)
VALUES
("Data Analytics"),
("Software Engineering"),
("Data Science"),
("Front-end Developing")-

INSERT INTO Employees(First_name,Last_name,Age,Email,Department_Id)
VALUES
("Teyanna", "Zawadi", 22, "zawadit@gmail.com", 2),
("Claire", "Pendo", 19, "clairependo@yahoo.com", 4),
("Megan", "Good", 26, "goodmegan@icloud.com", 1),
("Anthony", "Kamau", 27, "kamauant@hotmail.com", 3),
("Jordan", "Baker", 18, "jordanb@outlook.com", 4)


SELECT * FROM Employees

SELECT * FROM Department

/* 

That is a multi-line comment in SQL

*/

-- This is how we add comments in SQL
UPDATE Employees
set Department_Id = 2
WHERE Id = 3;


SELECT Employees.First_name, Employees.Last_name, Department.Name
FROM Employees    
JOIN Department  
ON Employees.Department_Id = Department.Id      

-- New Query
SELECT * FROM Employees
WHERE First_name = "Megan" AND Last_name = "Good"

SELECT * FROM Department
WHERE Name = "Data Analytics"

UPDATE Employees
set Department_Id = 1
WHERE Id = 1;
