CREATE TABLE EmployeeSalary(
	SalaryId INT IDENTITY(1,1) NOT NULL,
	EmployeeID INT NOT NULL,
	MonthlySalary DECIMAL(18, 2) null,
	DailyRate DECIMAL(18, 2) NULL,
	RecCreated DATETIME
	FOREIGN KEY (EmployeeID) REFERENCES Employee(Id)
	)
GO