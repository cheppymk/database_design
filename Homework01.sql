
CREATE TABLE Student(
ID INT IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(25) NOT NULL,
LastName NVARCHAR(25) NOT NULL,
DateOfBirth DATE,
EnrolledDate DATE,
Gender NCHAR,
NationalIDNumber NVARCHAR(15),
StudentCardNumber NVARCHAR(20),
CONSTRAINT PK_StudentID PRIMARY KEY CLUSTERED(ID)
);

CREATE TABLE Teacher(
ID INT IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR(25) NOT NULL,
LastName NVARCHAR(25) NOT NULL,
DateOfBirth DATE,
AcademicRank NVARCHAR(25),
HireDate DATE,
CONSTRAINT PK_TeacherID PRIMARY KEY CLUSTERED(ID)
);

CREATE TABLE Course(
ID INT IDENTITY(1,1) NOT NULL,
Name NVARCHAR(30) NOT NULL,
Credit INT,
AcademicYear INT,
Semester INT,
CONSTRAINT PK_Course PRIMARY KEY CLUSTERED(ID)
);

CREATE TABLE AchievementType(
ID INT IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(15) NOT NULL,
[Description] NVARCHAR(20),
ParticipationRate INT,
CONSTRAINT PK_AchievementTypeID PRIMARY KEY CLUSTERED(ID)
);

CREATE TABLE Grade(
ID INT IDENTITY(1,1) NOT NULL,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
TeacherID INT NOT NULL,
Grade INT,
Comment NVARCHAR(50),
CreatedDate DATE,
CONSTRAINT PK_Grade PRIMARY KEY CLUSTERED(ID),
CONSTRAINT FK_Grade_Student FOREIGN KEY (StudentID) REFERENCES Student(ID),
CONSTRAINT FK_Grade_Course FOREIGN KEY (CourseID) REFERENCES Course(ID),
CONSTRAINT FK_Grade_Teacher FOREIGN KEY (TeacherID) REFERENCES Teacher(ID)
);

CREATE TABLE GradeDetails(
ID INT IDENTITY(1,1) NOT NULL,
GradeID INT NOT NULL,
AchievementTypeID INT NOT NULL,
AchievementPoints INT,
AchievementMaxPoints INT,
AchievementDate DATETIME,
CONSTRAINT PK_GradeDetailsID PRIMARY KEY CLUSTERED(ID),
CONSTRAINT FK_GradeDetails_Grade FOREIGN KEY (GradeID) REFERENCES Grade(ID),
CONSTRAINT FK_GradeDetails_AchievementType FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType(ID)
);