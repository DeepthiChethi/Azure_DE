CREATE VIEW View_CustomerSegmentation1 AS
WITH CustomerSpending AS (
    SELECT 
        c.CustomerID,
        c.Name,
        SUM(t.Amount) AS TotalSpend,
        COUNT(t.OrderID) AS PurchaseFrequency,
        l.TierLevel
    FROM 
        Customers c
    LEFT JOIN 
        OnlineTransactions t ON c.CustomerID = t.CustomerID
    LEFT JOIN 
        LoyaltyAccounts l ON c.CustomerID = l.CustomerID
    GROUP BY 
        c.CustomerID, c.Name, l.TierLevel
),
Percentile AS (
    -- Calculate the 90th percentile spend threshold over the entire dataset
    SELECT 
        PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY TotalSpend) OVER () AS HighValueThreshold
    FROM CustomerSpending
)
SELECT 
    cs.CustomerID,
    cs.Name,
    cs.TotalSpend,
    cs.PurchaseFrequency,
    cs.TierLevel,
    CASE 
        WHEN cs.TotalSpend >= (SELECT TOP 1 HighValueThreshold FROM Percentile) THEN 'High-Value Customer'
        WHEN cs.PurchaseFrequency = 1 THEN 'One-Time Buyer'
        WHEN cs.TierLevel = 'Gold' OR cs.TierLevel = 'Platinum' THEN 'Loyalty Champion'
        ELSE 'Regular Customer'
    END AS CustomerSegment
FROM 
    CustomerSpending cs;



