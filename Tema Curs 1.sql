--Retrieve the top 10 most expensive products in the 'Product' table.
select top 10 * from [Production].[Product]

select max(ListPrice) as 'Maximum Price' from Production.Product group by ListPrice

select distinct top 10 ListPrice from Production.Product where 
ListPrice in (select max(ListPrice) as 'Maximum Price' from Production.Product group by ListPrice) order by ListPrice desc

select top 10 ProductID, Name, ListPrice from [Production].[Product] order by ListPrice desc

select distinct top 10 ListPrice from [Production].[Product] order by ListPrice desc

--Find the total number of products for each product subcategory
select * from [Production].[Product]
select ProductSubcategoryID, count(ProductID) as TotalNumber from Production.Product group by ProductSubcategoryID

--List all products that have a standard cost between $100 and $500. 
Select ProductID, Name, StandardCost from Production.Product where StandardCost between '100' and '500' order by StandardCost
Select ProductID, Name, StandardCost from Production.Product where StandardCost >= '100' and StandardCost <= '500' order by StandardCost

--Retrieve the top 5 product subcategories with the highest average list price.
select top 5 ProductSubcategoryID, avg(ListPrice) as Average 
from Production.Product group by ProductSubcategoryID 
order by avg(ListPrice) desc

--Find the total number of discontinued products.
SELECT Count(ProductID) as DiscoundedProductes FROM Production.Product where DiscontinuedDate is not null GROUP BY DiscontinuedDate
