--String Functions

--UPPER (Transact-SQL)
select * from [HR].[Employees]
select upper(lastname) from [HR].[Employees] where lastname = 'Davis'

--LOWER (Transact-SQL)
select lower(title) from [HR].[Employees] where title = 'CEO'

--RIGHT (Transact-SQL)
select * from [HR].[Employees]
SELECT RIGHT(lastname, 3) AS 'Last Name' FROM [HR].[Employees]  order by empid

--LEFT (Transact-SQL)
SELECT left(lastname, 2) AS 'Last Name' FROM [HR].[Employees]  order by empid

--REPLICATE()
SELECT REPLICATE('Test', 5);

--TRANSLATE (Transact-SQL)
SELECT TRANSLATE('3x[3+4]/{4-2}', '[]{}', '()()');

--SYSDATETIME ( )
select SYSDATETIME ( )

--GETDATE ( )
select GETDATE ( )

--CURRENT_TIMESTAMP
select CURRENT_TIMESTAMP

--	DAY ( date )
Select Day (2023-05-06)

--FORMAT
SELECT FORMAT(SYSDATETIME(), N'hh:mm tt');
