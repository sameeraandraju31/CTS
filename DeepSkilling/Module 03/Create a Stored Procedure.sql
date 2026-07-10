USE EmployeeDB;
GO

-- 1. Get Employees by Department
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GetEmployeesByDepartment 1;
GO

-- 2. Insert Employee
CREATE PROCEDURE sp_InsertEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    INSERT INTO Employees
    VALUES(@EmployeeID,@FirstName,@LastName,@DepartmentID,@Salary,@JoinDate);
END;
GO

EXEC sp_InsertEmployee
5,'David','Wilson',2,6500,'2024-01-10';
GO

-- 3. Update Employee Salary
CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary=@Salary
    WHERE EmployeeID=@EmployeeID;
END;
GO

EXEC sp_UpdateEmployeeSalary 1,5500;
GO

-- 4. Count Employees in Department
CREATE PROCEDURE sp_CountEmployees
    @DepartmentID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID=@DepartmentID;
END;
GO

EXEC sp_CountEmployees 2;
GO

-- 5. Total Salary Using Output Parameter
CREATE PROCEDURE sp_TotalSalary
    @DepartmentID INT,
    @TotalSalary DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @TotalSalary=SUM(Salary)
    FROM Employees
    WHERE DepartmentID=@DepartmentID;
END;
GO

DECLARE @Total DECIMAL(10,2);

EXEC sp_TotalSalary 2,@Total OUTPUT;

SELECT @Total AS TotalSalary;
GO

-- 6. Give Bonus
CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @Bonus DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary=Salary+@Bonus
    WHERE DepartmentID=@DepartmentID;
END;
GO

EXEC sp_GiveBonus 1,500;
GO

-- 7. Delete Stored Procedure
DROP PROCEDURE sp_CountEmployees;
GO