create database BCMS;
use bcms;
create table project(
Project_ID int primary key,
Name varchar(255),
Start_Date date,
End_Date date );

create table contractor(
Contractor_ID int primary key,
Name varchar(255),
Contact varchar(255) );

create table worker(
Worker_ID int primary key,
Name varchar(255), 
Contact varchar(255) );

create table material(
material_ID int primary key,
Name varchar(255), 
quantity varchar(255) );

create table assignment(
Assignment_ID int primary key,
Project_ID int,
Worker_ID int,
Start_Date date,
End_Date date);

 create table project_worker(
ProjectWorker_id int primary key,
Project_id int,
Worker_id int,
Hours_Worked int);

Insert into Project(Project_id,Name,Start_date,end_date)values
(1,'Office Building A','2023-01-01','2023-12-31'),
(2,'Residential Complex B','2023-02-15','2024-06-30'),
(3,'Shopping Mall C','2023-03-10','2023-11-30'),
(4,'Hospital D','2023-04-20','2024-03-15'),
(5,'School E','2023-06-01','2024-01-31'),
(6,'Apartment Building F','2023-07-15','2024-08-31'),
(7,'Hotel G','2023-08-10','2024-05-20'),
(8,'Industrial Plant H','2023-09-25','2024-04-15'),
(9,'Sports Complex I','2023-11-01','2024-10-31'),
(10,'Community Center J','2023-12-05','2024-09-15');

insert into contractor(contractor_id, name, contact)values
(1, 'ABC Construction', '123-456-7890'),
(2, 'XYZ Builders', '987-654-3210'),
(3, 'LMN Contractors', '555-555-5555'),
(4, 'PQR Construction', '888-888-8888'),
(5, 'EFG Builders', '777-777-7777');

Insert into Worker(worker_id,name,contact) values
(1, 'John Doe', '987-654-3210'),
(2, 'Jane Smith', '555-123-4567'),
(3, 'Robert Johnson', '777-888-9999'),
(4, 'Emily Davis', '123-456-7890'),
(5, 'Michael Brown', '555-987-6543'),
(6, 'Samantha White', '888-777-6666'),
(7, 'Daniel Lee', '333-222-1111'),
(8, 'Olivia Moore', '111-222-3333'),
(9, 'William Taylor', '444-555-6666'),
(10, 'Emma Anderson', '666-555-4444'),
(11, 'Christopher Hall', '999-888-7777'),
 (12, 'Sophia Martinez', '222-333-4444'),
(13, 'Matthew Wilson', '444-333-2222'),
(14, 'Ava Rodriguez', '777-666-5555'),
(15, 'James Garcia', '111-000-9999');

 Insert into material(material_id,name,quantity)values 
(1, 'Bricks', 5000),
(2, 'Steel Beams', 100),
(3, 'Wood Planks', 2000),
(4, 'Cement Bags', 800),
(5, 'Roofing Shingles', 300),
(6, 'Electrical Wiring', 500),
(7, 'Plumbing Pipes', 400),
(8, 'Paint Cans', 30),
(9, 'Insulation Rolls', 150),
(10, 'Windows', 50);

Insert into Assignment(assignment_id,project_id,worker_id,start_date,end_date) values
(2, 1, 1, '2023-03-01', '2023-04-01'),
(3, 1, 2, '2023-02-15', '2023-03-15'),
(4, 1, 3, '2023-03-10', '2023-04-10'),
(5, 1, 4, '2023-04-01', '2023-05-01'),
(6, 1, 5, '2023-03-15', '2023-04-15'),
(7, 1, 6, '2023-04-10', '2023-05-10'),
(8, 1, 7, '2023-05-01', '2023-06-01'),
(9, 1, 8, '2023-04-15', '2023-05-15'),
(10, 1, 9, '2023-05-10', '2023-06-10'),
(11, 1, 10, '2023-06-01', '2023-07-01');

Insert into Project_Worker (projectworker_id,project_id,worker_id,hours_worked)values
 (1, 1, 1, 80),
(2, 1, 2, 60), 
(3, 1, 3, 40),
(4, 2, 1, 50),
(5, 2, 2, 70),
(6, 2, 3, 30),
(7, 3, 1, 45),
(8, 3, 2, 55),
(9, 3, 3, 65),
(10, 4, 1, 75); 

select* from project;
select* from contractor;
select* from worker ;
select* from material; 
select* from assignment; 
select* from project_worker;

SELECT Name
FROM worker
WHERE Worker_ID IN (SELECT Worker_ID FROM assignment WHERE Project_ID = 1);

SELECT Name
FROM project
WHERE Project_ID IN (SELECT Project_ID FROM assignment WHERE Worker_ID = 1);

SELECT SUM(Hours_Worked) AS TotalHours
FROM project_worker
WHERE Worker_ID = (SELECT Worker_ID FROM worker WHERE Name = 'Jane Smith');

SELECT Name
FROM worker
WHERE Worker_ID NOT IN (SELECT DISTINCT Worker_ID FROM assignment);

SELECT Name
FROM material
WHERE quantity > (SELECT AVG(quantity) FROM material);


 SELECT Project.Project_ID, Project.Name AS Project_Name, Worker.Name AS Worker_Name
FROM Project
INNER JOIN Assignment ON Project.Project_ID = Assignment.Project_ID
INNER JOIN Worker ON Assignment.Worker_ID = Worker.Worker_ID;

SELECT Contractor.Name AS Contractor_Name, Project.Name AS Project_Name
FROM Contractor
INNER JOIN Project ON Contractor.Contractor_ID = Project.Project_ID;

SELECT material.Name, COALESCE(material.quantity, 'Not Specified') AS Quantity
FROM material
LEFT JOIN assignment ON material.material_ID = assignment.Assignment_ID;

SELECT Project.Name AS Project_Name, Worker.Name AS Worker_Name, Assignment.Start_Date, Assignment.End_Date
FROM Project
INNER JOIN Assignment ON Project.Project_ID = Assignment.Project_ID
INNER JOIN Worker ON Assignment.Worker_ID = Worker.Worker_ID
WHERE Project.Project_ID = 1;

SELECT contractor.Name, COALESCE(project.Name, 'No Project') AS Project_Name
FROM contractor
RIGHT JOIN project ON contractor.Contractor_ID = project.Project_ID;
