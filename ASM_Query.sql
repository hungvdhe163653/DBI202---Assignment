--Q1
SELECT s.StudentName, s.StudentID, s.StudentGender, s.Address FROM Student s
ORDER BY s.StudentID

--Q2
SELECT s.StudentID, s.StudentName, g.GroupID, g.SemesterID
FROM Student s
INNER JOIN Groups g ON s.StudentID = g.StudentID;

--Q3
SELECT s.StudentName AS StudentName, su.SubjectName AS SubjectName ,
SUM(sa.Score * a.AssWeight) AS [AVG]
FROM StAssessment sa LEFT JOIN Assessment a ON a.AssID = sa.AssID
					 LEFT JOIN Subject su ON su.SubjectID = a.SubjectID 
					 LEFT JOIN Student s ON sa.StudentID = s.StudentID
GROUP BY su.SubjectName, s.StudentName

--Q4
SELECT tb1.StudentName, AVG([AVG]) AS GPA FROM 
(SELECT s.StudentName AS StudentName, su.SubjectName AS SubjectName ,
SUM(sa.Score * a.AssWeight) AS [AVG]
FROM StAssessment sa LEFT JOIN Assessment a ON a.AssID = sa.AssID
					 LEFT JOIN Subject su ON su.SubjectID = a.SubjectID 
					 LEFT JOIN Student s ON sa.StudentID = s.StudentID
GROUP BY su.SubjectName, s.StudentName) tb1
GROUP BY tb1.StudentName

--Q5
SELECT s.StudentName, s.StudentID FROM Student s
INNER JOIN StAssessment sts ON sts.StudentID = s.StudentID
WHERE Sts.Score > 8.5

--Q6
SELECT Sts.StudentID, Sts.Score, COUNT(Sts.Score) AS NumberOfScore FROM StAssessment Sts
INNER JOIN Student s ON s.StudentID = Sts.StudentID
GROUP BY Sts.StudentID, Sts.Score HAVING COUNT(Sts.Score) = 5
ORDER BY Sts.StudentID

--Q7
SELECT DISTINCT g.GroupID, l.lectureID, s.SemesterID
FROM ((Groups g
INNER JOIN Lecture l ON l.lectureID   = g.lectureID)
INNER JOIN Semester s ON g.SemesterID = s.SemesterID)
ORDER BY SemesterID

--Q8
SELECT DISTINCT s.StudentName, s.StudentID,
    CASE
        WHEN AVG(Score) <= 5 THEN 'Poor'
        WHEN AVG(Score) > 7 AND AVG(Score) <= 9 THEN 'WelDone'
        ELSE 'Excellent'
    END as[Ranking]
FROM StAssessment St
JOIN Student s On s.StudentID = St.StudentID
GROUP BY s.StudentID, s.StudentName







