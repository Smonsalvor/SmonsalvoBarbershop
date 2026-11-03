
-- Design History (Do not execute)

-- Later change: CK_VisitService_Price
-- Reason: the price CHECK only existed in Service, so a negative price
-- was accepted in VisitService (tested with -25). Added the same rule there.
-- (Final schema already includes it inside CREATE TABLE VisitService.)
-- ALTER TABLE VisitService
-- ADD CONSTRAINT CK_VisitService_Price CHECK (Price > 0);

USE SmonsalvoBarbershop;

ALTER TABLE Visit
ALTER COLUMN ClientID INT NOT NULL;

ALTER TABLE Visit
ALTER COLUMN EmployeeID INT NOT NULL;

ALTER TABLE Client
Add Email Varchar(100) NULL;

Go

UPDATE Client 
SET Email = 'Alexander.Yan@gmail.com' 
WHERE ClientID = 1;

UPDATE Client
SET Email = 'Petr.Pimblett@gmail.com' 
Where ClientID = 2;

UPDATE Client
SET Email = 'Arman.Torres@gmail.com' 
Where ClientID = 3;

UPDATE Client 
SET Email = 'Ilia.Sikora@gmail.com' 
WHERE ClientID = 4;


ALTER TABLE Client 
Add Constraint UQ_Client_Email Unique (Email);

ALTER TABLE Service
Add Constraint CK_Service_Price Check (Price > 0);


