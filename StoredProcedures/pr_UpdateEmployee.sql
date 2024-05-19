CREATE PROC pr_UpdateEmployee
(
  @Id INT,
  @FullName VARCHAR(255),
  @Tin INT,
  @Birthdate DATE,
  @TypeId INT,
  @IsSuccess BIT OUTPUT
)
AS
BEGIN
 BEGIN TRY 
   UPDATE Employee 
   SET 
   FullName = @FullName, 
   TIN = @Tin,
   Birthdate = @Birthdate,
   EmployeeTypeId = @TypeId
   WHERE ID = @Id

   SET @IsSuccess = 1;
 END TRY
 BEGIN CATCH
  SET @IsSuccess = 0;
 END CATCH
END
