-- Homework:
-- Problem 1: List all products and their suppliers.
-- Partial result
--ProductID  ProductName              SupplierName
--1          Adjustable Race          Litware, Inc.
--879        All-Purpose Bike Stand   Green Lake Bike Company
--712        AWC Logo Cap             Integrated Sport Products
--2          Bearing Ball          Wood Fitness
--877        Bike Wash - Dissolver    Green Lake Bike Company

select pp.productID, pp.Name as ProductName, v.name as SupplierName
from Production.Product pp 
join Purchasing.ProductVendor pv on pp.ProductID = pv.ProductID
join Purchasing.Vendor v on pv.BusinessEntityID = v.BusinessEntityID

-- Problem 2: List all orders placed by a specific customer (e.g., CustomerID = 29825) along with the order details.
-- Partial result
--SalesOrderID    OrderDate    ProductID    ProductName    OrderQty    UnitPrice    LineTotal
--43659    2011-05-31 00:00:00.000    776    Mountain-100 Black, 42    1    2024.994    2024.994000
--43659    2011-05-31 00:00:00.000    777    Mountain-100 Black, 44    3    2024.994    6074.982000
--43659    2011-05-31 00:00:00.000    778    Mountain-100 Black, 48    1    2024.994    2024.994000
--43659    2011-05-31 00:00:00.000    771    Mountain-100 Silver, 38    1    2039.994    2039.994000
--43659    2011-05-31 00:00:00.000    772    Mountain-100 Silver, 42    1    2039.994    2039.994000

select sod.SalesOrderID, soh.OrderDate, pp.ProductID, pp.Name as ProductName, sod.OrderQty, sod.UnitPrice, sod.LineTotal
from sales.SalesOrderDetail sod join
Production.Product pp on sod.ProductID = pp.ProductID 
join sales.SalesOrderHeader soh on sod.SalesOrderID = soh.SalesOrderID

-- Problem 3: List all customers and their respective sales territories.
-- Partial result
--CustomerID    FirstName    LastName    TerritoryName
--29485    Catherine    Abel    Southwest
--29486    Kim    Abercrombie    Central
--29487    Humberto    Acevedo    Northeast
--29484    Gustavo    Achong    Southeast
--29488    Pilar    Ackerman    Australia

select sc.CustomerID, pp.FirstName, pp.LastName, st.name as TerritoryName
from sales.Customer sc join Person.person pp on
sc.PersonID = pp.BusinessEntityID 
join sales.SalesTerritory st on
sc.TerritoryID = st.TerritoryID

-- Problem 4: List all products with their subcategories and categories.
-- Partial results
-- ProductID    ProductName    SubcategoryName    CategoryName
-- 680    HL Road Frame - Black, 58    Road Frames    Components
-- 706    HL Road Frame - Red, 58    Road Frames    Components
-- 707    Sport-100 Helmet, Red    Helmets    Accessories
-- 708    Sport-100 Helmet, Black    Helmets    Accessories
-- 709    Mountain Bike Socks, M    Socks    Clothing

select pp.ProductID, pp.name as ProductName, ps.Name as SubcategoryName, pc.Name as CategoryName
from Production.Product pp join 
Production.ProductSubcategory ps on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join Production.ProductCategory pc on ps.ProductCategoryID = pc.ProductCategoryID

-- Problem 5: List all vendors and their respective purchase order approvers.
-- Partial result
-- BusinessEntityID    VendorName    FirstName    LastName    EmailAddress
-- 1492    Australia Bike Retailer    Annette    Hill    annette0@adventure-works.com
-- 1492    Australia Bike Retailer    Arvind    Rao    arvind0@adventure-works.com
-- 1492    Australia Bike Retailer    Ben    Miller    ben0@adventure-works.com
-- 1492    Australia Bike Retailer    Eric    Kurjan    eric2@adventure-works.com
-- 1492    Australia Bike Retailer    Erin    Hagens    erin0@adventure-works.com

select distinct v.BusinessEntityID, v.Name as VendorName, pp.FirstName, pp.LastName, ea.EmailAddress from 
Purchasing.PurchaseOrderHeader poh join
Purchasing.Vendor v on poh.VendorID = v.BusinessEntityID 
join Person.Person pp on poh.EmployeeID = pp.BusinessEntityID
join Person.EmailAddress ea on pp.BusinessEntityID = ea.BusinessEntityID