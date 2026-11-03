USE SmonsalvoBarbershop;
INSERT INTO Employee (Name, Surname, BossID) 
Values ('Tom', 'Jones', Null), ('Charles', 'Jackson', 1), ('Justin', 'Poirier', 1), ('Dustin', 'Gaethje', 1), ('Alexander', 'Johnson', 1);

INSERT INTO Client (Name, Surname, Email)
VALUES ('Alexander', 'Yan', 'Alexander.Yan@example.com'), ('Petr', 'Pimblett', 'Petr.Pimblett@example.com'), 
('Arman', 'Torres', 'Arman.Torres@example.com'), ('Ilia', 'Sikora', 'Ilia.Sikora@example.com');

INSERT INTO Service (Name, Price)
VALUES ('Haircut', 20), ('Beard', 15), ('Haircut + Beard', 30), ('Eyebrows', 5); 

INSERT INTO Visit (EmployeeID, ClientID) 
VALUES (1, 1), (2, 1), (3, 2), (2, 1), (4, 4);

INSERT INTO VisitService (VisitID, ServiceID, Price)
VALUES (1, 1, 25), (2, 2, 20), (3, 3, 30), (4, 4, 5), (5, 4, 5);


UPDATE Employee
SET BossID = 2
WHERE EmployeeID > 2;