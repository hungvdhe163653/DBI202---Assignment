CREATE DATABASE ASSIGNMENT

CREATE TABLE Students (
	[StudentID] [varchar] (10) NOT NULL PRIMARY KEY,
	[StudentName] [nvarchar] (50) NOT NULL,
	[StudentGender] [char] (1) NOT NULL,
	[Address] [date] NOT NULL,
)
CREATE TABLE Subject (
	[SubjectID] [varchar] (10) NOT NULL PRIMARY KEY,
	[SubjectName] [nvarchar] (40) NOT NULL,
	[SubjectSemester] [int] NOT NULL,
)
CREATE TABLE Assessment(
	[AssID] [varchar] (10) NOT NULL PRIMARY KEY,
	[AssName] [nvarchar] (50) NOT NULL,
	[AssWeight] [Decimal] NOT NULL,
	[SubjectID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Subject(SubjectID),
)
CREATE TABLE StAssessment(
	[AssID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Assessment(AssID), 
	[StudnetID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Students(StudentID),
	[Date] [Date] NOT NULL,
	[Score] [float] NOT NULL,
)




