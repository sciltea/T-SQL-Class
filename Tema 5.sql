--1. Customers who have not placed any order
select * from Sales.Customer
where CustomerID not in
(select CustomerID from Sales.SalesOrderHeader)

--2. Product with the maximum number of colors available
select top 1 * from Production.ProductModel
where ProductModelID in
(select top 1 ProductModelID from Production.Product
where ProductModelID is not null
group by ProductModelID
order by count(*) desc)

-- 3. Sales person who made the highest number of sales
select * from Sales.SalesPerson
where BusinessEntityID in
(select top 1 SalesPersonID from Sales.SalesOrderHeader
group by SalesPersonID
order by count(*))

-- 4. Products that are more expensive than 
--the cheapest product in the 'Bikes' category
select * from Production.Product
select * from Production.ProductCategory
select * from Production.ProductSubcategory

select * from Production.Product
where ListPrice > (select top 1 ListPrice from Production.Product
where ProductSubcategoryID in
(select ProductSubcategoryID from Production.ProductSubcategory
where ProductCategoryID in
(select ProductCategoryID from Production.ProductCategory
where Name = 'Bikes'))
order by ListPrice)