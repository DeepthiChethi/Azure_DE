CREATE VIEW View_AgentResolutionStats AS
SELECT 
    a.AgentID,
    a.Name AS AgentName,
    a.Department,
    a.Shift,
    COUNT(csi.InteractionID) AS TotalInteractions,
    SUM(CASE WHEN csi.ResolutionStatus = 'Resolved' THEN 1 ELSE 0 END) AS ResolvedCount,
    ROUND(
        100.0 * SUM(CASE WHEN csi.ResolutionStatus = 'Resolved' THEN 1 ELSE 0 END) 
        / NULLIF(COUNT(csi.InteractionID), 0), 2
    ) AS ResolutionSuccessRate
FROM 
    dbo.Agents a
LEFT JOIN 
    dbo.CustomerServiceInteractions csi ON a.AgentID = csi.AgentID
GROUP BY 
    a.AgentID, a.Name, a.Department, a.Shift;




