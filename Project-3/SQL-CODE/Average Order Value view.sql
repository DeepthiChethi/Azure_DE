CREATE VIEW vw_AverageOrderValue AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Category,
    s.Location,
    SUM(o.Amount) / COUNT(o.OrderID) AS AverageOrderValue
FROM OnlineTransactions o
JOIN Products p ON o.ProductID = p.ProductID
JOIN InStoreTransactions i ON o.CustomerID = i.CustomerID
JOIN Stores s ON i.StoreID = s.StoreID
GROUP BY p.ProductID, p.Name, p.Category, s.Location;

select *from vw_AverageOrderValue;