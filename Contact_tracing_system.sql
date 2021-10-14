-- =============================================
-- Database: MySQL
--
-- Question 1
-- Created the database, tables and schema 
-- Inserted data in those tables

-- =============================================

CREATE DATABASE Contact_Tracing;
USE Contact_Tracing;

CREATE TABLE Employee (
	Employee_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Employee_name varchar(255) NOT NULL,
    Employee_age int,
    Employee_office_no int NOT NULL,
    Employee_floor_no int NOT NULL CHECK (Employee_floor_no BETWEEN 1 AND 10),
    Employee_phone_no bigint UNIQUE NOT NULL CHECK (Employee_phone_no BETWEEN 1000000000 AND 9999999999),
    Employee_email varchar(50) UNIQUE
);

CREATE TABLE Meeting (
	Meeting_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Meeting_room_no int NOT NULL,
    Meeting_floor_no int NOT NULL CHECK (Meeting_floor_no BETWEEN 1 AND 10),
    Meeting_start_time int NOT NULL CHECK (Meeting_start_time BETWEEN 8 AND 18)
);

CREATE TABLE Employee_Meeting_Bridge (
	Employee_id int,
    Meeting_id int,
    PRIMARY KEY (Employee_id,Meeting_id),
	FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Meeting_id) REFERENCES Meeting(Meeting_id)
);

CREATE TABLE Notification (
	Notification_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Employee_id int,
    Notification_date date NOT NULL,
    Notification_type varchar(25) NOT NULL CHECK (Notification_type IN ('Optional','Mandatory')),
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

CREATE TABLE Symptom (
	Row_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Employee_id int,
    Date_reported date NOT NULL,
    Symptom_id int NOT NULL CHECK (Symptom_id BETWEEN 1 and 5),
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

CREATE TABLE Scan (
	Scan_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Scan_date date NOT NULL,
    Scan_time int NOT NULL CHECK (Scan_time BETWEEN 8 AND 18),
    Employee_id int,
    Temperature float NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);

CREATE TABLE Test (
	Test_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Scan_id int,
    Test_location varchar(50) NOT NULL,
    Test_date date NOT NULL,
    Test_time int NOT NULL CHECK (Test_time BETWEEN 0 and 23),
    Employee_id int,
    Test_result varchar(25) NOT NULL CHECK (Test_result IN ('Positive','Negative')),
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Scan_id) REFERENCES Scan(Scan_id)
);

CREATE TABLE Patient (
	Patient_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Test_id int,
    Employee_id int,
    Case_date date NOT NULL,
    Case_resolution varchar(30) NOT NULL CHECK (Case_resolution IN ('back to work','left the company','deceased')),
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Test_id) REFERENCES Test(Test_id)
);

CREATE TABLE Health_Status (
	Health_status_row_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Patient_id int,
    Employee_id int,
    Health_status_date date NOT NULL,
    Current_status varchar(20) NOT NULL CHECK (Current_status IN ('sick','hospitalized','well')),
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Patient_id)
);

-- =============================================
-- Database: MySQL
--
-- Inserting data into the tables
-- =============================================

INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES ('Karan',23,1,1,1504426618,'karan.rao@gmail.com'); 
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES ('Manreet',22,2,1,6504426899,'manreet@gmail.com'); 
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES ('Kinjal',25,1,2,8045547122,'kinjalpm@gmail.com'); 
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES ('Naithik',20,1,3,9820100543,'naithik2000@yahoo.in'); 
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES ('Kushal',30,2,2,1234757891,'kushal@gmail.com');
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Yun",35,2,3,8234567261,"yun42@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Kunyi",24,3,3,7234587891,"kunyi@usc.edu");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Ching",32,4,4,6234512891,"ching@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Tao",27,1,5,8834567981,"tao@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email)VALUES("Alia", 25,2,5,1234562491,"alia@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email)VALUES("Janice", 24,1,6,7276567876,"ja.nice@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email)VALUES("Parth", 29,2,6,8776567891,"parth.j1@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email)VALUES("Ayush K",23,1,7,6872567891,"ayush.k90@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Purvil Jain",20,2,7,9176567891,"purvil11@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Priyanka",32,3,7,7046567891,"priyanka.m@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Kullu",40,1,1,4576567891,"kullu23@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email)VALUES("Manas",45,1,8,6575670891,"manas87@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Pranav Gor",29,2,8,8976567891,"pgr@gmail.com");

INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Pratik Kurkure",55,1,9,6666567891,"pratikkurkur@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Aadit",45,2,9,7776567891,"aadi12@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("K Smith",33,1,10,6896567891,"k.sm@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Vedant",26,2,10,9116567891,"vedu00@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Ankit Kochar",22,3,10,8767567891,"ankit.k@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Pranav Keshkamat",24,4,10,5576567891,"pk43@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Jai Kotia",34,5,10,6076567811,"jk11@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Aqid Khatkatay",38,3,9,7876567891,"khatkatay@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Disha P",33,4,9,1270567891,"pdish@gmail.com");
INSERT INTO Employee (Employee_name, Employee_age, Employee_office_no, Employee_floor_no, Employee_phone_no,
Employee_email) VALUES("Pavi",35,4,8,1276567601,"pi2@gmail.com");

INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 1,9);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(2, 2,11);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 3,10);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 4,12);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 5,8);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(3, 6,12);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(2, 1,15);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 2,8);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(3, 1,12);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(2, 2,13);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(4, 3,11);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 4,10);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 8,15);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(5, 9,16);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 6,17);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(3, 4,16);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(2, 1,12);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(4, 1,11);
INSERT INTO Meeting(Meeting_room_no, Meeting_floor_no, Meeting_start_time) VALUES(1, 10,8);

INSERT INTO Employee_Meeting_Bridge VALUES (1,1);
INSERT INTO Employee_Meeting_Bridge VALUES (2,1);
INSERT INTO Employee_Meeting_Bridge VALUES (3,1);
INSERT INTO Employee_Meeting_Bridge VALUES (5,2);
INSERT INTO Employee_Meeting_Bridge VALUES (6,2);
INSERT INTO Employee_Meeting_Bridge VALUES (1,3);
INSERT INTO Employee_Meeting_Bridge VALUES (2,3);
INSERT INTO Employee_Meeting_Bridge VALUES (5,4);
INSERT INTO Employee_Meeting_Bridge VALUES (3,4);
INSERT INTO Employee_Meeting_Bridge VALUES (4,4);
INSERT INTO Employee_Meeting_Bridge VALUES (6,4);
INSERT INTO Employee_Meeting_Bridge VALUES (1,5);
INSERT INTO Employee_Meeting_Bridge VALUES (6,5);
INSERT INTO Employee_Meeting_Bridge VALUES (3,6);
INSERT INTO Employee_Meeting_Bridge VALUES (4,6);
INSERT INTO Employee_Meeting_Bridge VALUES (5,7);
INSERT INTO Employee_Meeting_Bridge VALUES (1,7);
INSERT INTO Employee_Meeting_Bridge VALUES (2,8);
INSERT INTO Employee_Meeting_Bridge VALUES (9,8);
INSERT INTO Employee_Meeting_Bridge VALUES (2,9);
INSERT INTO Employee_Meeting_Bridge VALUES (8,9);
INSERT INTO Employee_Meeting_Bridge VALUES (2,10);
INSERT INTO Employee_Meeting_Bridge VALUES (6,10);
INSERT INTO Employee_Meeting_Bridge VALUES (5,11);
INSERT INTO Employee_Meeting_Bridge VALUES (4,11);
INSERT INTO Employee_Meeting_Bridge VALUES (1,12);
INSERT INTO Employee_Meeting_Bridge VALUES (3,12);
INSERT INTO Employee_Meeting_Bridge VALUES (2,13);
INSERT INTO Employee_Meeting_Bridge VALUES (4,13);
INSERT INTO Employee_Meeting_Bridge VALUES (1,14);
INSERT INTO Employee_Meeting_Bridge VALUES (5,14);
INSERT INTO Employee_Meeting_Bridge VALUES (9,15);
INSERT INTO Employee_Meeting_Bridge VALUES (16,15);
INSERT INTO Employee_Meeting_Bridge VALUES (10,16);
INSERT INTO Employee_Meeting_Bridge VALUES (12,16);
INSERT INTO Employee_Meeting_Bridge VALUES (11,17);
INSERT INTO Employee_Meeting_Bridge VALUES (1,17);
INSERT INTO Employee_Meeting_Bridge VALUES (8,18);
INSERT INTO Employee_Meeting_Bridge VALUES (9,18);
INSERT INTO Employee_Meeting_Bridge VALUES (2,19);
INSERT INTO Employee_Meeting_Bridge VALUES (1,19);

INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(5, '2021-8-8',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(2, '2021-8-9',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(1, '2021-8-9',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(3, '2021-8-9',1);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(4, '2021-8-10',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(6, '2021-8-14',1);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(7, '2021-8-15',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(9, '2021-8-15',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(8, '2021-8-16',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(10, '2021-8-18',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(11, '2021-8-18',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(12, '2021-8-22',1);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(15, '2021-8-23',3);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(16, '2021-8-28',1);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(17, '2021-8-28',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(18, '2021-9-1',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(13, '2021-9-2',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(14, '2021-9-8',4);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(20, '2021-9-8',3);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(22, '2021-9-8',4);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(20, '2021-9-8',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(22, '2021-9-8',5);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(20, '2021-9-8',2);
INSERT INTO Symptom(Employee_id, Date_reported, Symptom_id) VALUES(22, '2021-9-8',2);

INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-8',10,1,97.5);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-9',10,2,92.5);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-10',11,3,99.5);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-11',12,5,101);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-12',10,6,100);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-13',9,7,99.2);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-14',8,4,98.8);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-15',10,8,96.5);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-16',11,9,102);
INSERT INTO Scan(Scan_date,Scan_time,Employee_id,Temperature) VALUES('2021-8-17',10,10,101);


INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-8',10,1,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-9',10,2,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-10',10,3,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-11',10,4,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-12',10,5,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-13',10,6,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-14',10,7,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-15',10,8,'Negative');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-16',10,9,'Positive');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-18',10,8,'Positive');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-16',10,10,'Positive');
INSERT INTO Test(Test_location,Test_date,Test_time,Employee_id,Test_result) 
VALUES('Office','2021-8-16',10,12,'Positive');

INSERT INTO Patient(Employee_id,Case_date,Case_resolution) VALUES(9,'2021-8-16','left the company');
INSERT INTO Patient(Employee_id,Case_date,Case_resolution) VALUES(10,'2021-8-18','back to work');
INSERT INTO Patient(Employee_id,Case_date,Case_resolution) VALUES(11,'2021-8-18','deceased');
INSERT INTO Patient(Employee_id,Case_date,Case_resolution) VALUES(12,'2021-8-18','back to work');
INSERT INTO Patient(Employee_id,Case_date,Case_resolution) VALUES(13,'2021-8-18','back to work');

INSERT INTO Health_Status (Patient_id,Employee_id,Health_status_date,Current_status) VALUES (1,9,'2021-8-15','sick');
INSERT INTO Health_Status (Patient_id,Employee_id,Health_status_date,Current_status) VALUES (2,10,'2021-8-17','sick');
INSERT INTO Health_Status (Patient_id,Employee_id,Health_status_date,Current_status) VALUES (3,11,'2021-8-17','sick');
INSERT INTO Health_Status (Patient_id,Employee_id,Health_status_date,Current_status) VALUES (4,12,'2021-8-17','hospitalized');
INSERT INTO Health_Status (Patient_id,Employee_id,Health_status_date,Current_status) VALUES (5,13,'2021-8-17','sick');

