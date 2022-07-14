
--Q1
SELECT s.StudentName FROM Student s
ORDER BY s.StudentName ASC
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