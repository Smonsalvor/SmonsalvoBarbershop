USE SmonsalvoBarbershop;
-- Name of the service, price and VisitID
SELECT Service.Name, Service.Price, VisitService.VisitID
FROM Service
JOIN VisitService ON Service.ServiceID = VisitService.ServiceID;

-- Client name, surname, email, barber and visit date
SELECT Client.Name, Client.Surname, Client.Email, Visit.EmployeeID, Visit.VisitDate
FROM Client
LEFT JOIN Visit ON Client.ClientID = Visit.ClientID;

-- Barber name, surname, BossID, ClientID and visit date, excluding null values for BossID (the Boss)
SELECT Employee.Name, Employee.Surname, Employee.BossID, Visit.ClientID, Visit.VisitDate
FROM Employee
LEFT JOIN Visit ON Employee.EmployeeID = Visit.EmployeeID
Where BossID > 0;

-- Double Join, client name, surname and email, employee name and surname, visitID and VisitDate, shows only the real visits
SELECT Client.Name, Client.Surname, Client.Email, Employee.Name, Employee.Surname, Visit.VisitID, Visit.VisitDate
FROM Visit
JOIN Client ON Visit.ClientID = Client.ClientID
JOIN Employee ON Visit.EmployeeID = Employee.EmployeeID;


-- Shows all the recorded services, Client name, surname and email, employee name and surname, service name and price (the one established in that date) and VisitDate
SELECT Client.Name, Client.Surname, Client.Email, Employee.Name, Employee.Surname, Service.Name, VisitService.Price, VisitDate
FROM Visit
JOIN Client ON Visit.ClientID = Client.ClientID
JOIN Employee ON Visit.EmployeeID = Employee.EmployeeID
JOIN VisitService ON Visit.VisitID = VisitService.VisitID
JOIN Service ON VisitService.ServiceID = Service.ServiceID;

