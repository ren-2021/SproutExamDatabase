CREATE TABLE SetupTable(
	Id INT IDENTITY(1,1) NOT NULL,
	[Key] VARCHAR(100),
	[Value] DECIMAL(18, 2), 
	[Description] VARCHAR(500),
	[RecDateCreated] DATETIME
	)
GO


 --Insert Data for SetupTable : (Tax)
INSERT INTO SetupTable
([Key], [Value], [Description], [RecDateCreated])
VALUES
('Tax', 0.12, '12% tax', GETDATE())


SELECT * FROM SetupTable