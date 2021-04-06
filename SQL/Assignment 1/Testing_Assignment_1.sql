CREATE DATABASE IF NOT EXISTS Testing_Assignment_1;
USE Testing_Assignment_1;
CREATE TABLE IF NOT EXISTS Department (
    DepartmentID   INT,
    DepartmentName VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Position (
    PositionID     INT PRIMARY KEY AUTO_INCREMENT,
    PositionName   VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS `Account` (
    AccountID      INT PRIMARY KEY AUTO_INCREMENT,
    Email          VARCHAR(50),
    Username       VARCHAR(50),
    Fullname       VARCHAR(50),
    DerpartmentID  INT,
    PossitionID    INT,
    CreatDate	   DATE
);
CREATE TABLE IF NOT EXISTS `Group` (
    GroupID        INT PRIMARY KEY AUTO_INCREMENT,
    GroupName	   VARCHAR(50),
    CreatorID	   INT,
    CreatDate	   DATE
);
CREATE TABLE IF NOT EXISTS GroupAccount (
    GroupID        INT,
    AccountID      INT,
    JoinDate	   DATE
);
CREATE TABLE IF NOT EXISTS TypeQuestion (
    TypeID         INT PRIMARY KEY AUTO_INCREMENT,
    TypeName       VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Question (
   QuestionID      INT PRIMARY KEY AUTO_INCREMENT,
   Content		   VARCHAR(50),
   CategoryID      INT,
   TypeID          INT,
   CreatorID       INT,
   CreatDate       DATE
);
CREATE TABLE IF NOT EXISTS Answer (
    AnswerID       INT PRIMARY KEY AUTO_INCREMENT,
    Content        VARCHAR(50),
    QuestionID     INT,
    isCorrect	   VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Exam (
    ExamID         INT PRIMARY KEY AUTO_INCREMENT,
    `Code`         VARCHAR(50),
    Title          VARCHAR(50),
    CategoryID     INT,
    Duration       DATETIME,
    CreatorID      INT,
    CreatDate      DATE
);
CREATE TABLE IF NOT EXISTS ExamQuestion (
    ExamID         INT,
    QuestionID     INT
);
