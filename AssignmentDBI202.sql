CREATE TABLE Subject (
	[SubjectID] [varchar] (10) NOT NULL PRIMARY KEY,
	[SubjectName] [nvarchar] (40) NOT NULL,
	[SubjectSemester] [int] NOT NULL,
)

CREATE TABLE Semester (
	[SemesterID] [varchar] (10) NOT NULL PRIMARY KEY,
	[SemesterName] [nvarchar] (40) NOT NULL,
	[StartDate] [Date] NOT NULL,
	[EndDate] [Date] NOT NULL,
)

CREATE TABLE Student (
	[StudentID] [varchar] (10) NOT NULL PRIMARY KEY,
	[StudentName] [nvarchar] (40) NOT NULL,
)

CREATE TABLE Groups (
	[GroupID] [varchar] (10) NOT NULL PRIMARY KEY,
	[SemesterID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Semester(SemesterID),
	[StudentID] [varchar] (10) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	
)

CREATE TABLE Attenden (
	[GroupID] [varchar] (10)  not null FOREIGN KEY REFERENCES Groups(GroupID),
	[StudentID] [varchar] (10) not null FOREIGN KEY REFERENCES Student(StudentID),
	[SubjectID] [varchar] (10) not null FOREIGN KEY REFERENCES Subject(SubjectID),
	[Status] [varchar] (10) NOT NULL,
)

INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163653', 'Vu Duy Hung')
INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163652', 'Nguyen Thanh Huy')
INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163651', 'Doan Duc Loc')
INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163650', 'Vu Duc Huy')
INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163649', 'Vu Duy Nam')
INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163648', 'Nguyen Van Chien')
INSERT INTO  Student(StudentID, StudentName)
VALUES ('HE163647', 'Cao Minh Ngoc')

INSERT INTO  Subject(SubjectID, SubjectName, SubjectSemester)
VALUES ('DBI202', 'Database', 3)
INSERT INTO  Subject(SubjectID, SubjectName, SubjectSemester)
VALUES ('JPD113', ' Japanese', 3)
INSERT INTO  Subject(SubjectID, SubjectName, SubjectSemester)
VALUES ('LAB211', 'OOP with Java', 3)
INSERT INTO  Subject(SubjectID, SubjectName, SubjectSemester)
VALUES ('WED201c', 'Wed Design', 3)
INSERT INTO  Subject(SubjectID, SubjectName, SubjectSemester)
VALUES ('CSD201', 'Data Structures and Algorithms', 3)

INSERT INTO Semester(SemesterID, SemesterName, StartDate, EndDate)
VALUES ('SP22', 'Spring 2022', '1/1/2022', '4/4/2022')
INSERT INTO Semester(SemesterID, SemesterName, StartDate, EndDate)
VALUES ('SU22', 'Summer 2022', '5/5/2022', '9/9/2022')

INSERT INTO Groups(GroupID, StudentID, SemesterID)
VALUES ('SE1647', 'HE163653', 'SP22')

