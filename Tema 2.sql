/*Exercise 1
You have to create a report based on
the tables Production.Product and
Production.ProductCategory .
The report should contain the
product name and the
category name of each product.*/

select top 2 * from Production.Product
select top 2 * from Production.ProductCategory

select pp.ProductID, pp.Name, ppc.Name from Production.Product pp join 
Production.ProductCategory ppc on pp.ProductSubcategoryID = ppc.ProductCategoryID

/*Exercise 2
Write a query that returns
all customers who placed at
least one order, with detailed information about each
one. The tables are Sales.Customers ,
Sales.SalesOrderHeader and Sales.OrderDetails

select top 2 * from Sales.Customer
select top 2 * from Sales.SalesOrderHeader
select top 2 * from Sales.SalesOrderDetail 
*/

select SC.CustomerID, SD.* from Sales.Customer SC join
Sales.SalesOrderHeader SH on SC.CustomerID = SH.CustomerID join 
Sales.SalesOrderDetail SD on SD.SalesOrderID = SH.SalesOrderID 
where SH.SalesPersonID is not null

/*Exercise 3
You have to create a report based
on the tables
Production.ProductSubcategory and
Production.ProductCategory .
The report
should return every combination between the
category name and the subcategory name .

select top 2 * from Production.ProductSubcategory
select top 2 * from Production.ProductCategory
*/

select PC.ProductCategoryID, PS.ProductSubcategoryID, PS.Name, PC.Name
from Production.ProductSubcategory PS cross join 
Production.ProductCategory PC 
where PC.ProductCategoryID = PS.ProductCategoryID
