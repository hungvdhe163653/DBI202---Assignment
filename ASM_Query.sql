--Q1
SELECT s.StudentName, s.StudentID, s.StudentGender, s.Address FROM Student s
ORDER BY s.StudentID

--Q2
SELECT s.StudentID, s.StudentName, g.GroupID, g.SemesterID, g.lectureID
FROM Student s
INNER JOIN Groups g ON s.StudentID = g.StudentID;

--Q3
SELECT s.StudentName AS StudentName, su.SubjectName AS SubjectName , 
s.StudentID AS StudentID,
SUM(sa.Score * a.AssWeight) AS [AVG]
FROM StAssessment sa LEFT JOIN Assessment a ON a.AssID = sa.AssID
					 LEFT JOIN Subject su ON su.SubjectID = a.SubjectID 
					 LEFT JOIN Student s ON sa.StudentID = s.StudentID
GROUP BY su.SubjectName, s.StudentName, s.StudentID

--Q4
SELECT tb1.StudentName, tb1.StudentID, AVG([AVG]) AS GPA FROM 
(SELECT s.StudentName AS StudentName, s.StudentID AS StudentID, su.SubjectName AS SubjectName ,
SUM(sa.Score * a.AssWeight) AS [AVG]
FROM StAssessment sa LEFT JOIN Assessment a ON a.AssID = sa.AssID
					 LEFT JOIN Subject su ON su.SubjectID = a.SubjectID 
					 LEFT JOIN Student s ON sa.StudentID = s.StudentID
GROUP BY su.SubjectName, s.StudentName, s.StudentID) tb1
GROUP BY tb1.StudentName, tb1.StudentID

--Q5
SELECT a.StudentName AS StudentName1, b.StudentName AS StudentName2, a.Address
FROM Student a, Student b
WHERE a.StudentID <> b.StudentID
AND a.Address = b.Address
ORDER BY a.Address;

--Q6
SELECT s.StudentName, s.StudentID, sts.Score, sts.AssID, sts.Date FROM Student s
INNER JOIN StAssessment sts ON s.StudentID = sts.StudentID
AND sts.Score BETWEEN 0 AND 5
WHERE sts.AssID = 'DBI202_ASM'
GROUP BY s.StudentID, s.StudentName, sts.Score, sts.AssID, sts.Date
ORDER BY s.StudentID


--Q7
SELECT Sts.StudentID, Sts.Score, COUNT(Sts.Score) AS NumberOfScore FROM StAssessment Sts
INNER JOIN Student s ON s.StudentID = Sts.StudentID
GROUP BY Sts.StudentID, Sts.Score HAVING COUNT(Sts.Score) = 5
ORDER BY Sts.StudentID

--Q8
SELECT  g.GroupID, l.lectureID, s.SemesterID, s.startDate, s.endDate
FROM ((Groups g
INNER JOIN Lecture l ON l.lectureID   = g.lectureID)
INNER JOIN Semester s ON g.SemesterID = s.SemesterID)
ORDER BY SemesterID

--Q9
SELECT  s.StudentName, s.StudentID, 
    CASE
        WHEN AVG(Score) <= 5 THEN 'Poor'
        WHEN AVG(Score) >= 7 AND AVG(Score) < 9 THEN 'WelDone'
        ELSE 'Excellent'
    END AS [Ranking]
FROM StAssessment St 
JOIN Student s On s.StudentID = St.StudentID
GROUP BY s.StudentID, s.StudentName

--Q10
SELECT tb1.StudentName, tb1.SubjectName, tb1.StudentID, tb1.SemesterID, 
tb1.startDate, tb1.endDate, SUM(AVGTest) AS AVGSubject,
CASE
	WHEN tb1.INFO = 'FAIL' THEN 'NOTPASS'
	WHEN SUM(tb1.AVGTest) < 5 THEN 'NOTPASS'
	ELSE 'PASS'
	END AS [STATUS]
FROM
(SELECT s.StudentName AS StudentName,  s.StudentID AS StudentID,
su.SubjectName AS SubjectName, g.SemesterID, se.startDate, se.endDate, 
ISNULL(sa.score,0) AS Grade, ISNULL((sa.score * a.AssWeight),0) AS [AVGTest],
CASE	
	WHEN ISNULL(sa.score,0) = 0 THEN 'FAIL'
	WHEN sa.Score < 4 AND a.AssName = 'Final Exam' THEN 'FAIL'
	ELSE 'PASS'
	END AS [INFO]
FROM StAssessment sa  LEFT JOIN Assessment a ON a.AssID = sa.AssID
					  LEFT JOIN Subject su  ON su.SubjectID = a.SubjectID 
					  LEFT JOIN Student s  ON sa.StudentID = s.StudentID
					  LEFT JOIN Groups g ON g.StudentID = sa.StudentID
					  LEFT JOIN Lecture l ON l.lectureID = g.lectureID
					  LEFT JOIN Semester se ON l.SemesterID = se.SemesterID)tb1
GROUP BY tb1.StudentName,tb1.SubjectName, tb1.INFO, tb1.StudentID, tb1.SemesterID,
tb1.startDate, tb1.endDate
ORDER BY tb1.StudentID


--TRIGGER
GO
CREATE TRIGGER trigger_asm ON Groups
AFTER INSERT,UPDATE,DELETE
AS
	DECLARE @GID nvarchar(10);
	DECLARE @COUNT nvarchar(10);
	SELECT @GID = GroupID  FROM inserted;
	SELECT @COUNT = COUNT(*) FROM Groups WHERE GroupID = @GID;
	IF @COUNT > 2
	BEGIN
		PRINT 'Existed';
		ROLLBACK TRAN
	END

INSERT INTO Groups VALUES ('Spring 2022', 'HE1610', 'SE1647', 'AnhTH')

INSERT INTO Groups VALUES ('Spring 2022', 'HE1610', 'SE1648', 'AnhTH')



--STORED PROCEDURE
GO
CREATE PROCEDURE uspFindScore
(
	@min_score AS DECIMAL = 9,
	@max_score AS DECIMAL = 10,
	@name AS VARCHAR(max)
)
AS
BEGIN
	SELECT 
		s.StudentID, s.StudentName, st.AssID, st.Score, st.Date
	FROM
		Student s, StAssessment st
	WHERE 
		Score > @min_score AND
		Score < @max_score AND
		s.StudentName LIKE @name + '%'
	ORDER BY 
		s.StudentID
END;

EXEC uspFindScore
	@name = 'N';

--INDEX	
CREATE INDEX index_id
ON Student (StudentID)















