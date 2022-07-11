

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
)
CREATE TABLE Assessment(
	[AssID] [varchar] (10) NOT NULL PRIMARY KEY,
	[AssName] [nvarchar] (50) NOT NULL,
	[AssWeight] [float] NOT NULL,
	[SubjectID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Subject(SubjectID),
)
ALTER TABLE Assessment
ALTER COLUMN AssWeight [float];


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
	[SemesterID] [nvarchar] (50) FOREIGN KEY REFERENCES Semester(SemesterID),
	[StudentID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	[GroupID] [varchar] (10) NOT NULL,
)
CREATE TABLE Semester(
	[SemesterID] [nvarchar] (50) NOT NULL PRIMARY KEY,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
)

INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1610', 'Nguyen Van A', 'M', 'TQ')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1611', 'Nguyen Van B', 'M', 'HN')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1612', 'Tran Thi C', 'f', 'HY')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1613', 'Tran Thi D', 'f', 'HG')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1614', 'Tran Van E', 'M', 'TQ')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1615', 'Nguyen Van F', 'M', 'TQ')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1616', 'Hoang Thi G', 'f', 'HD')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1617', 'Cao Van H', 'M', 'BN')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1618', 'Nguyen Van I', 'M', 'BG')
INSERT INTO Student(StudentID,StudentName,StudentGender,Address)
VALUES ('HE1619', 'Hoang Thi K', 'f', 'LC')




INSERT INTO Subject(SubjectID, SubjectName)
VALUES ('PRO192', 'object-oriented programming')
INSERT INTO Subject(SubjectID, SubjectName)
VALUES ('MAD101', 'Discrete mathematics')
INSERT INTO Subject(SubjectID, SubjectName)
VALUES ('DBI202', 'Database')
INSERT INTO Subject(SubjectID, SubjectName)
VALUES ('WED201', 'Wed Design')
INSERT INTO Subject(SubjectID, SubjectName)
VALUES ('JPD113', ' Japanese')


INSERT INTO Semester(SemesterID, startDate, endDate)
VALUES ('Spring 2022', '2022-01-01', '2022-04-04')
INSERT INTO Semester(SemesterID, startDate, endDate)
VALUES ('Summer 2022', '2022-05-05', '2022-09-09')

INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1610', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1611', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1612', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1613', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1614', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1615', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1616', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1617', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1618', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Spring 2022', 'HE1619', 'SE1647')

INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1610', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1611', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1612', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1613', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1614', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1615', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1616', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1617', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1618', 'SE1647')
INSERT INTO Groups(SemesterID,StudentID,GroupID)
VALUES ('Summer 2022', 'HE1619', 'SE1647')

INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('PRO192_PT','PT','0.1','PRO192')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('PRO192_ASM','ASM','0.2','PRO192')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('PRO192_LAB','LAB','0.15','PRO192')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('PRO192_PE','PE','0.25','PRO192')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('PRO192_FE','FE','0.3','PRO192')

INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('MAD101_PT1','PT1','0.1','MAD101')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('MAD101_PT2','PT2','0.2','MAD101')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('MAD101_PT3','PT3','0.15','MAD101')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('MAD101_ASM','ASM','0.25','MAD101')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('MAD101_FE','FE','0.3','MAD101')

INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('DBI202_PT','PT','0.1','DBI202')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('DBI202_ASM','ASM','0.2','DBI202')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('DBI202_LAB','LAB','0.15','DBI202')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('DBI202_PE','PE','0.25','DBI202')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('DBI202_FE','FE','0.3','DBI202')

INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('WED201_PT','PT','0.1','WED201')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('WED201_ASM','ASM','0.2','WED201')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('WED201_LAB','LAB','0.15','WED201')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('WED201_PE','PE','0.25','WED201')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('WED201_FE','FE','0.3','WED201')

INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('JPD113_PT1','PT1','0.1','JPD113')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('JPD113_PT2','PT2','0.2','JPD113')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('JPD113_PT3','PT3','0.15','JPD113')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('JPD113_ASM','ASM','0.25','JPD113')
INSERT INTO Assessment(AssID,AssName,AssWeight,SubjectID)
VALUES ('JPD113_FE','FE','0.3','JPD113')


--HS1
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PT', 'HE1610', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_ASM', 'HE1610', '2022-02-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_LAB', 'HE1610', '2022-03-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PE', 'HE1610', '2022-03-20', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_FE', 'HE1610', '2022-04-01', 7.5)


INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT1', 'HE1610', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT2', 'HE1610', '2022-02-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT3', 'HE1610', '2022-03-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_ASM', 'HE1610', '2022-03-20', 8.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_FE', 'HE1610', '2022-04-01', 5.5)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PT', 'HE1610', '2022-01-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_ASM', 'HE1610', '2022-02-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_LAB', 'HE1610', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PE', 'HE1610', '2022-03-20', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_FE', 'HE1610', '2022-04-01', 8)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PT', 'HE1610', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_ASM', 'HE1610', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_LAB', 'HE1610', '2022-03-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PE', 'HE1610', '2022-03-20', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_FE', 'HE1610', '2022-04-01', 7)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT1', 'HE1610', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT2', 'HE1610', '2022-02-15', 8.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT3', 'HE1610', '2022-03-15', 5.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_ASM', 'HE1610', '2022-03-20', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_FE', 'HE1610', '2022-04-01', 7.5)


--HS2
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PT', 'HE1611', '2022-01-15', 7.6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_ASM', 'HE1611', '2022-02-15', 7.0)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_LAB', 'HE1611', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PE', 'HE1611', '2022-03-20', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_FE', 'HE1611', '2022-04-01', 5)


INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT1', 'HE1611', '2022-01-15', 6.2)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT2', 'HE1611', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT3', 'HE1611', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_ASM', 'HE1611', '2022-03-20', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_FE', 'HE1611', '2022-04-01', 7)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PT', 'HE1611', '2022-01-15', 5.7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_ASM', 'HE1611', '2022-02-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_LAB', 'HE1611', '2022-03-15', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PE', 'HE1611', '2022-03-20', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_FE', 'HE1611', '2022-04-01', 7)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PT', 'HE1611', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_ASM', 'HE1611', '2022-02-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_LAB', 'HE1611', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PE', 'HE1611', '2022-03-20', 8.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_FE', 'HE1611', '2022-04-01', 7.5)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT1', 'HE1611', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT2', 'HE1611', '2022-02-15', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT3', 'HE1611', '2022-03-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_ASM', 'HE1611', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_FE', 'HE1611', '2022-04-01', 6)


--HS3
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PT', 'HE1612', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_ASM', 'HE1612', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_LAB', 'HE1612', '2022-03-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PE', 'HE1612', '2022-03-20', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_FE', 'HE1612', '2022-04-01', 8)


INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT1', 'HE1612', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT2', 'HE1612', '2022-02-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT3', 'HE1612', '2022-03-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_ASM', 'HE1612', '2022-03-20', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_FE', 'HE1612', '2022-04-01', 7.5)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PT', 'HE1612', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_ASM', 'HE1612', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_LAB', 'HE1612', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PE', 'HE1612', '2022-03-20', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_FE', 'HE1612', '2022-04-01', 8)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PT', 'HE1612', '2022-01-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_ASM', 'HE1612', '2022-02-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_LAB', 'HE1612', '2022-03-15', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PE', 'HE1612', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_FE', 'HE1612', '2022-04-01', 6)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT1', 'HE1612', '2022-01-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT2', 'HE1612', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT3', 'HE1612', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_ASM', 'HE1612', '2022-03-20', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_FE', 'HE1612', '2022-04-01', 6)


--HS4
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PT', 'HE1613', '2022-01-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_ASM', 'HE1613', '2022-02-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_LAB', 'HE1613', '2022-03-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PE', 'HE1613', '2022-03-20', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_FE', 'HE1613', '2022-04-01', 7)


INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT1', 'HE1613', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT2', 'HE1613', '2022-02-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT3', 'HE1613', '2022-03-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_ASM', 'HE1613', '2022-03-20', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_FE', 'HE1613', '2022-04-01', 8)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PT', 'HE1613', '2022-01-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_ASM', 'HE1613', '2022-02-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_LAB', 'HE1613', '2022-03-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PE', 'HE1613', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_FE', 'HE1613', '2022-04-01', 6)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PT', 'HE1613', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_ASM', 'HE1613', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_LAB', 'HE1613', '2022-03-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PE', 'HE1613', '2022-03-20', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_FE', 'HE1613', '2022-04-01', 5)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT1', 'HE1613', '2022-01-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT2', 'HE1613', '2022-02-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT3', 'HE1613', '2022-03-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_ASM', 'HE1613', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_FE', 'HE1613', '2022-04-01', 8)


--HS5
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PT', 'HE1614', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_ASM', 'HE1614', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_LAB', 'HE1614', '2022-03-15', 6.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_PE', 'HE1614', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('PRO192_FE', 'HE1614', '2022-04-01', 8)


INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT1', 'HE1614', '2022-01-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT2', 'HE1614', '2022-02-15', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_PT3', 'HE1614', '2022-03-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_ASM', 'HE1614', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('MAD101_FE', 'HE1614', '2022-04-01', 6)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PT', 'HE1614', '2022-01-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_ASM', 'HE1614', '2022-02-15', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_LAB', 'HE1614', '2022-03-15', 5.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_PE', 'HE1614', '2022-03-20', 8)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('DBI202_FE', 'HE1614', '2022-04-01', 6.5)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PT', 'HE1614', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_ASM', 'HE1614', '2022-02-15', 5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_LAB', 'HE1614', '2022-03-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_PE', 'HE1614', '2022-03-20', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('WED201_FE', 'HE1614', '2022-04-01', 8)

INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT1', 'HE1614', '2022-01-15', 7)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT2', 'HE1614', '2022-02-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_PT3', 'HE1614', '2022-03-15', 6)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_ASM', 'HE1614', '2022-03-20', 7.5)
INSERT INTO StAssessment(AssID,StudentID,Date,Score)
VALUES ('JPD113_FE', 'HE1614', '2022-04-01', 6)


SELECT * FROM Student
SELECT * FROM Subject
SELECT * FROM Assessment
SELECT * FROM Semester
SELECT * FROM Groups

SELECT * FROM StAssessment

