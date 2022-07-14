
--F1
SELECT s.StudentName FROM Student s
ORDER BY s.StudentName ASC
--F2
SELECT s.StudentID, s.StudentName, g.GroupID, g.SemesterID
FROM Student s
INNER JOIN Groups g ON s.StudentID = g.StudentID;

