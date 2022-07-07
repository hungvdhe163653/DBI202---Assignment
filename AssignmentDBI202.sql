CREATE DATABASE ASSIGNMENT

CREATE TABLE Student (
	[StudentID] [varchar] (10) NOT NULL PRIMARY KEY,
	[StudentName] [nvarchar] (50) NOT NULL,
	[StudentGender] [char] (1) NOT NULL,
	[Address] [nvarchar] (50) NOT NULL,
)
CREATE TABLE Subject (
	[SubjectID] [varchar] (10) NOT NULL PRIMARY KEY,
	[SubjectName] [nvarchar] (40) NOT NULL,
	[SemesterID] [int] NOT NULL,
)
DROP TABLE Subject;

ALTER TABLE Subject
DROP COLUMN SemesterID;

ALTER TABLE Student
DROP CONSTRAINT FK_StudentID;

CREATE TABLE Assessment(
	[AssID] [varchar] (10) NOT NULL PRIMARY KEY,
	[AssName] [nvarchar] (50) NOT NULL,
	[AssWeight] [Decimal] NOT NULL,
	[SubjectID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Subject(SubjectID),
)
CREATE TABLE StAssessment(
	[AssID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Assessment(AssID), 
	[StudentID] [varchar] (10) NOT NULL,
	[Date] [Date] NOT NULL,
	[Score] [float] NOT NULL,
	CONSTRAINT PK_StAssessment PRIMARY KEY (AssID,StudentID,Date),
	CONSTRAINT fk_Student FOREIGN KEY (StudentID) REFERENCES Student([StudentID]),
	CONSTRAINT fk_Assessment FOREIGN KEY (AssID) REFERENCES [Assessment](AssID)
)

CREATE TABLE Groups (
	[SemesterID] [int] NOT NULL FOREIGN KEY REFERENCES Semester(SemesterID),
	[StudnetID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	[GroupID] [varchar] (10) NOT NULL,
)
CREATE TABLE Semester(
	[SemesterID] [int] NOT NULL PRIMARY KEY,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
)

ALTER TABLE Semester
DROP CONSTRAINT SemesterID;  

INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1610', 'Nguyen Van A', 'Male', 'TQ')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1611', 'Nguyen Van B', 'Male', 'HN')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1612', 'Tran Thi C', 'female', 'HY')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1613', 'Tran Thi D', 'female', 'HG')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1614', 'Tran Van E', 'Male', 'TQ')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1615', 'Nguyen Van F', 'Male', 'TQ')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1616', 'Hoang Thi G', 'female', 'HD')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1617', 'Cao Van H', 'Male', 'BN')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1618', 'Nguyen Van I', 'Male', 'BG')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1619', 'Hoang Thi K', 'female', 'LC')

SELECT * FROM Student

INSERT INTO Subject(SubjectID, SubjectName, SemesterID)
VALUES ('PRO192', 'object-oriented programming', 2)
INSERT INTO Subject(SubjectID, SubjectName, SemesterID)
VALUES ('MAD101', 'Discrete mathematics', 2)
INSERT INTO Subject(SubjectID, SubjectName, SemesterID)
VALUES ('DBI202', 'Database', 3)
INSERT INTO Subject(SubjectID, SubjectName, SemesterID)
VALUES ('WED201', 'Wed Design', 3)
INSERT INTO Subject(SubjectID, SubjectName, SemesterID)
VALUES ('JPD113', ' Japanese', 3)

