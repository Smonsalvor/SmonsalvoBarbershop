USE master;   -- you can't drop the database you're connected to
GO

IF DB_ID('SmonsalvoBarbershop') IS NOT NULL   -- DB_ID returns NULL if it doesn't exist
BEGIN
    ALTER DATABASE SmonsalvoBarbershop
        SET SINGLE_USER WITH ROLLBACK IMMEDIATE;   -- kicks out other connections
    DROP DATABASE SmonsalvoBarbershop;
END
GO

CREATE DATABASE SmonsalvoBarbershop;
GO
USE SmonsalvoBarbershop;
GO

CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY IDENTITY(1,1),
BossID INT NULL,
Name VARCHAR(100) Not Null,
Surname VARCHAR(100) Not Null,
CONSTRAINT FK_Employee_Boss FOREIGN KEY(BossID) 
References Employee(EmployeeID)
);


CREATE TABLE Client (
ClientID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(100) Not Null,
Surname VARCHAR(100) Not Null,
Email Varchar(100) Not Null,
CONSTRAINT UQ_Client_Email UNIQUE (Email)
);


CREATE TABLE Service (
ServiceID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(100) Not Null,
Price Decimal(10,2) Not Null
Constraint CK_Service_Price Check (Price > 0)
);


CREATE TABLE Visit (
VisitID INT PRIMARY KEY IDENTITY(1,1),
EmployeeID INT NOT NULL,
ClientID INT NOT NULL,
VisitDate DATETIME Not NULL
CONSTRAINT DF_Visit_VisitDate DEFAULT GETDATE(),
CONSTRAINT FK_Visit_Employee FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID),
CONSTRAINT FK_Visit_Client FOREIGN KEY(ClientID)
REFERENCES Client(ClientID)
);

CREATE TABLE VisitService (
VisitID INT Not Null,
ServiceID INT Not Null,
Price Decimal(10,2) Not Null,
Constraint CK_VisitService_Price Check (Price > 0),
PRIMARY KEY(VisitID, ServiceID),

CONSTRAINT FK_VisitService_Visit FOREIGN KEY (VisitID)
REFERENCES Visit(VisitID),

CONSTRAINT FK_VisitService_Service FOREIGN KEY (ServiceID)
REFERENCES Service(ServiceID)
);



