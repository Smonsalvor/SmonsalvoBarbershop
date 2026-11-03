USE SmonsalvoBarbershop;

DECLARE @VisitID INT;   -- must be in the same batch as the code below

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Visit (ClientID, EmployeeID) VALUES (3, 4);
    SET @VisitID = SCOPE_IDENTITY();   -- the ID the INSERT above just generated

    INSERT INTO VisitService (VisitID, ServiceID, Price)
    VALUES (@VisitID, 1, 20);           -- no hand-typed ID

     INSERT INTO VisitService (VisitID, ServiceID, Price)
    VALUES (@VisitID, 2, 15);    

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0                  -- only roll back if a transaction is still open
        ROLLBACK TRANSACTION;
    THROW;                              -- re-raise the original error so it doesn't get swallowed
END CATCH;

GO

--'after COMMIT' AS Moment
SELECT COUNT(*) AS Visits FROM Visit;
SELECT COUNT(*) AS VisitServices FROM VisitService;

DECLARE @VisitID INT;   

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO Visit (ClientID, EmployeeID) VALUES (3, 4);
    SET @VisitID = SCOPE_IDENTITY();   

    INSERT INTO VisitService (VisitID, ServiceID, Price)
    VALUES (@VisitID, 2, 15);  

    INSERT INTO VisitService (VisitID, ServiceID, Price)
    VALUES (@VisitID, 1, -25); 

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0                  
        ROLLBACK TRANSACTION;
    THROW;                              
END CATCH;

Go

--'after ROLLBACK' AS Moment
SELECT COUNT(*) AS Visits FROM Visit;
SELECT COUNT(*) AS VisitServices FROM VisitService;