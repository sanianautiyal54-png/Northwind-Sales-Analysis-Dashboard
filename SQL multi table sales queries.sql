
USE Northwind;
GO

SELECT
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.CompanyName,
    p.ProductID,
    p.ProductName,
    od.Quantity,
    od.UnitPrice,
    od.Discount,
    (od.Quantity * od.UnitPrice * (1 - od.Discount)) AS SalesAmount
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID
INNER JOIN Products AS p
    ON od.ProductID = p.ProductID
ORDER BY o.OrderDate;


SELECT
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    COUNT(DISTINCT o.CustomerID) AS TotalCustomers,
    COUNT(DISTINCT od.ProductID) AS ProductsSold,
    SUM(od.Quantity) AS TotalUnitsSold,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        / NULLIF(COUNT(DISTINCT o.OrderID), 0)
        AS DECIMAL(18, 2)
    ) AS AverageSalesPerOrder
FROM Orders AS o
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID;



SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS UnitsSold,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales
FROM Products AS p
INNER JOIN [Order Details] AS od
    ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY TotalSales DESC;



SELECT
    cat.CategoryName,
    SUM(od.Quantity) AS UnitsSold,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales
FROM Categories AS cat
INNER JOIN Products AS p
    ON cat.CategoryID = p.CategoryID
INNER JOIN [Order Details] AS od
    ON p.ProductID = od.ProductID
GROUP BY cat.CategoryName
ORDER BY TotalSales DESC;



SELECT
    c.CustomerID,
    c.CompanyName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID,
    c.CompanyName
ORDER BY TotalSales DESC;



SELECT
    YEAR(o.OrderDate) AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    DATEFROMPARTS(
        YEAR(o.OrderDate),
        MONTH(o.OrderDate),
        1
    ) AS MonthStart,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales
FROM Orders AS o
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID
WHERE o.OrderDate IS NOT NULL
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY SalesYear, SalesMonth;



SELECT
    c.Country,
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID
GROUP BY c.Country
ORDER BY TotalSales DESC;



SELECT
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS TotalSales
FROM Employees AS e
INNER JOIN Orders AS o
    ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.LastName
ORDER BY TotalSales DESC;



SELECT TOP 10
    o.OrderID,
    o.OrderDate,
    c.CompanyName,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS OrderSales
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID
INNER JOIN [Order Details] AS od
    ON o.OrderID = od.OrderID
GROUP BY
    o.OrderID,
    o.OrderDate,
    c.CompanyName
ORDER BY OrderSales DESC;



SELECT
    CASE
        WHEN od.Discount = 0 THEN 'No Discount'
        WHEN od.Discount <= 0.10 THEN 'Up to 10%'
        WHEN od.Discount <= 0.20 THEN '11% to 20%'
        ELSE 'Above 20%'
    END AS DiscountGroup,
    COUNT(*) AS OrderLines,
    SUM(od.Quantity) AS TotalUnits,
    CAST(
        SUM(od.Quantity * od.UnitPrice * od.Discount)
        AS DECIMAL(18, 2)
    ) AS DiscountAmount,
    CAST(
        SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
        AS DECIMAL(18, 2)
    ) AS NetSales
FROM [Order Details] AS od
GROUP BY
    CASE
        WHEN od.Discount = 0 THEN 'No Discount'
        WHEN od.Discount <= 0.10 THEN 'Up to 10%'
        WHEN od.Discount <= 0.20 THEN '11% to 20%'
        ELSE 'Above 20%'
    END
ORDER BY DiscountGroup;




