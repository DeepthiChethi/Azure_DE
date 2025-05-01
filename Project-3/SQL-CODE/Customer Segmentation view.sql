CREATE VIEW vw_CustomerSegments AS
SELECT 
    c.CustomerID,
    SUM(o.Amount) AS TotalSpend,
    COUNT(o.OrderID) AS TotalOrders,
    l.TierLevel,
    CASE
        WHEN SUM(o.Amount) >= 1000 THEN 'High-Value'
        WHEN COUNT(o.OrderID) = 1 THEN 'One-Time Buyer'
        WHEN l.TierLevel = 'Gold' THEN 'Loyalty Champion'
        ELSE 'Regular'
    END AS Segment
FROM Customers c
LEFT JOIN OnlineTransactions o ON c.CustomerID = o.CustomerID
LEFT JOIN LoyaltyAccounts l ON c.CustomerID = l.CustomerID
GROUP BY c.CustomerID, l.TierLevel;

select *from vw_CustomerSegments;