CREATE VIEW View_PeakTrafficAnalysis AS
SELECT 
    DATENAME(WEEKDAY, DateTime) AS DayOfWeek,
    DATEPART(HOUR, DateTime) AS HourOfDay,
    'Online' AS Channel,
    COUNT(*) AS TransactionCount
FROM 
    OnlineTransactions
GROUP BY 
    DATENAME(WEEKDAY, DateTime),
    DATEPART(HOUR, DateTime)

UNION ALL

SELECT 
    DATENAME(WEEKDAY, DateTime) AS DayOfWeek,
    DATEPART(HOUR, DateTime) AS HourOfDay,
    'In-Store' AS Channel,
    COUNT(*) AS TransactionCount
FROM 
    InStoreTransactions
GROUP BY 
    DATENAME(WEEKDAY, DateTime),
    DATEPART(HOUR, DateTime);


Select * from View_PeakTrafficAnalysis
