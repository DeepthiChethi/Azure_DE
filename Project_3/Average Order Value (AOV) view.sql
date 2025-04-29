CREATE VIEW View_AverageOrderValue AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Category,
    s.StoreID,
    s.Location,
    SUM(t.Amount) / COUNT(t.OrderID) AS AverageOrderValue
FROM 
    onlineTransaction t
INNER JOIN 
    dbo.Products p ON t.ProductID = p.ProductID
LEFT JOIN 
    dbo.Stores s ON s.StoreID IS NOT NULL  -- since online might not have a store directly, kept flexible
GROUP BY 
    p.ProductID, p.Name, p.Category, s.StoreID, s.Location;


select * from View_AverageOrderValue