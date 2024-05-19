CREATE OR ALTER PROC pr_CalculateEmployeeSalary
(
  @Id INT,
  @AbsentDays DECIMAL(10, 2),
  @WorkedDays DECIMAL(10, 2)
)
AS
BEGIN
 DECLARE @TotalSalary DECIMAL(18, 2)
 DECLARE @EmployeeTypeId VARCHAR(50) =
       (SELECT EmployeeTypeId FROM Employee where Employee.Id = @Id);
 DECLARE @Salary DECIMAL(18, 2);
 DECLARE @TaxRate DECIMAL(10, 2);
 DECLARE @Deduction DECIMAL(10, 2);

 IF (@EmployeeTypeId = 1)
   BEGIN
     SET @Salary = (SELECT MonthlySalary FROM EmployeeSalary WHERE EmployeeID = @Id);
	 SET @TaxRate = (SELECT [Value] FROM SetupTable WHERE [Key] = 'Tax');
	 SET @Deduction = (@Salary / 22) * @AbsentDays;

	 SET @TotalSalary =  @Salary - @Deduction - (@Salary * @TaxRate)
   END

 IF (@EmployeeTypeId = 2)
   BEGIN
	 SET @Salary = (SELECT DailyRate FROM EmployeeSalary WHERE EmployeeID = @Id);

	 SET @TotalSalary =  @Salary * @WorkedDays;
   END

 -- ADD HERE OTHER THE EMPLOYEE TYPE CALCULATIONS IF NEEDED.
 -- ex. IF (@EmployeeTypeId = 3)
 --  BEGIN
	-- SET @Salary = (SELECT Sample FROM EmployeeSalary WHERE EmployeeID = @Id);

	-- SET @TotalSalary =  @Salary * Sample;
 --  END
   
   SELECT @TotalSalary
END