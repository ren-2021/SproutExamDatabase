CREATE OR ALTER PROC pr_GetEmployeeById
(
  @Id INT
)
AS
BEGIN
 SELECT Id, FullName, CONVERT(VARCHAR(20), CAST(Birthdate AS DATE)) AS Birthdate, TIN, EmployeeTypeId as [TypeId] FROM Employee WHERE Id = @Id
END
