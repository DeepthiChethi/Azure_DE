CREATE VIEW vw_PeakTimes AS
SELECT 
    'Online' AS Channel,
    DATENAME(WEEKDAY, DateTime) AS DayName,
    DATEPART(HOUR, DateTime) AS Hour,
    COUNT(*) AS TotalTransactions
FROM OnlineTransactions
GROUP BY DATENAME(WEEKDAY, DateTime), DATEPART(HOUR, DateTime)

UNION ALL

SELECT 
    'InStore' AS Channel,
    DATENAME(WEEKDAY, DateTime) AS DayName,
    DATEPART(HOUR, DateTime) AS Hour,
    COUNT(*) AS TotalTransactions
FROM InStoreTransactions
GROUP BY DATENAME(WEEKDAY, DateTime), DATEPART(HOUR, DateTime);

select *from vw_PeakTimes;