CREATE OR ALTER PROC pr_GetEmployees
AS
BEGIN
   SELECT Id, FullName, CONVERT(VARCHAR(20), CAST(Birthdate AS DATE)) AS Birthdate, TIN, EmployeeTypeId as [TypeId] FROM Employee WHERE IsDeleted <> 0
END