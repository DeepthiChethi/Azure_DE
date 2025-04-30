CREATE VIEW View_PeakTimes AS
SELECT 
    'Online' AS TransactionType,
    DATENAME(WEEKDAY, DateTime) AS DayOfWeek,
    DATEPART(HOUR, DateTime) AS HourOfDay,
    COUNT(OrderID) AS TransactionCount
FROM 
   OnlineTransactions
GROUP BY 
    DATENAME(WEEKDAY, DateTime), DATEPART(HOUR, DateTime)

UNION ALL

SELECT 
    'Instore' AS TransactionType,
    DATENAME(WEEKDAY, DateTime) AS DayOfWeek,
    DATEPART(HOUR, DateTime) AS HourOfDay,
    COUNT(TransactionID) AS TransactionCount
FROM 
    InStoreTransactions
GROUP BY 
    DATENAME(WEEKDAY, DateTime), DATEPART(HOUR, DateTime);



