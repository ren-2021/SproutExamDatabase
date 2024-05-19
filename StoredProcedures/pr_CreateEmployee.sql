CREATE OR ALTER PROC pr_CreateEmployee
(
  @FullName VARCHAR(255),
  @Tin INT,
  @Birthdate DATE,
  @TypeId INT
)
AS
BEGIN
 BEGIN TRY 
   DECLARE @GeneratedID INT;

   INSERT INTO Employee
   (FullName,TIN, Birthdate, EmployeeTypeId, IsDeleted)
   VALUES
   (@FullName,@Tin, @Birthdate, @TypeId, 1)
   SET @GeneratedID = SCOPE_IDENTITY()

   IF (@TypeId = 1)
   BEGIN
     INSERT INTO EmployeeSalary
	   (EmployeeID,MonthlySalary,DailyRate,RecCreated)
	 VALUES
	   (@GeneratedID, 20000, NULL, GETDATE());
   END

   IF (@TypeId = 2)
   BEGIN
     INSERT INTO EmployeeSalary
	   (EmployeeID,MonthlySalary,DailyRate,RecCreated)
	 VALUES
	   (@GeneratedID, NULL, 500, GETDATE());
   END
   SELECT 1, @GeneratedID, 200;
 END TRY
 BEGIN CATCH
  SELECT 0, 0, 500;
 END CATCH
END
