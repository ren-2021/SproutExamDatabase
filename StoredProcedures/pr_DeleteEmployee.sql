CREATE OR ALTER PROC pr_DeleteEmployee
(
  @Id INT,
  @IsSuccess BIT OUTPUT
)
AS
BEGIN
 BEGIN TRY 
   UPDATE Employee SET IsDeleted = 1 WHERE Id = @Id
   SET @IsSuccess = 1;
 END TRY
 BEGIN CATCH
  SET @IsSuccess = 0;
 END CATCH
END