SELECT * FROM Student WHERE FirstName = 'Antonio'
GO

SELECT * FROM Student WHERE DateOfBirth > '1999-01-01'
GO

SELECT * FROM Student WHERE LastName LIKE 'J%' AND EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01'
GO

SELECT * FROM Student ORDER BY FirstName ASC
GO

SELECT LastName FROM Student
UNION 
SELECT LastName FROM Teacher
GO

SELECT c.Name, A.Name FROM Course c
CROSS JOIN AchievementType a
GO

SELECT t.* FROM Teacher t LEFT JOIN Grade g ON g.TeacherID = t.ID WHERE TeacherID IS NULL
GO