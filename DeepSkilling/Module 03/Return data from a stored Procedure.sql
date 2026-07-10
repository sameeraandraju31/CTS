USE EmployeeDB;
GO

CREATE PROCEDURE sp_CountEmployees
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Execute the Stored Procedure
EXEC sp_CountEmployees 1;