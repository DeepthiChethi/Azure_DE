CREATE VIEW View_AverageOrderValue AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Category,
	'Online' AS Location,
    SUM(t.Amount)/ COUNT(t.OrderID) AS AverageOrderValue
FROM 
    OnlineTransactions t
Inner JOIN 
    Products p ON t.ProductID = p.ProductID
GROUP BY 
    p.ProductID, p.Name, p.Category;

Select * from View_AverageOrderValue

Drop view View_AverageOrderValue
