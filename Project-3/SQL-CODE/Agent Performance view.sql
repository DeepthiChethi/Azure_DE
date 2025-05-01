CREATE VIEW vw_AgentPerformance AS
SELECT 
    a.AgentID,
    a.Name,
    COUNT(c.InteractionID) AS TotalInteractions,
    SUM(CASE WHEN c.ResolutionStatus = 'Resolved' THEN 1 ELSE 0 END) AS ResolvedInteractions
FROM CustomerServiceInteractions c
JOIN Agents a ON c.AgentID = a.AgentID
GROUP BY a.AgentID, a.Name;

select *from vw_AgentPerformance;