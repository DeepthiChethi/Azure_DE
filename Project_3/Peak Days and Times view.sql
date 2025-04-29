CREATE VIEW View_PeakTimes AS
SELECT 
    'Online' AS TransactionType,
    DATENAME(WEEKDAY, DateTime) AS DayOfWeek,
    DATEPART(HOUR, DateTime) AS HourOfDay,
    COUNT(OrderID) AS TransactionCount
FROM 
    onlineTransaction
GROUP BY 
    DATENAME(WEEKDAY, DateTime), DATEPART(HOUR, DateTime)

UNION ALL

SELECT 
    'Instore' AS TransactionType,
    DATENAME(WEEKDAY, Datetime) AS DayOfWeek,
    DATEPART(HOUR, Datetime) AS HourOfDay,
    COUNT(TransactioID) AS TransactionCount
FROM 
    dbo.InstoreTransactions
GROUP BY 
    DATENAME(WEEKDAY, Datetime), DATEPART(HOUR, Datetime);

select * from View_PeakTimes