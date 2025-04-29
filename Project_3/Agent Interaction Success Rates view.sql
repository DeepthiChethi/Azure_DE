CREATE OR ALTER VIEW View_AgentResolutionStats AS
SELECT 
    a.AgentID,
    a.Name AS AgentName,
    COUNT(csi.InteractionID) AS TotalInteractions,
    SUM(CASE WHEN csi.ResolutionStatus = 'Resolved' THEN 1 ELSE 0 END) AS ResolvedCount,
    CASE 
        WHEN COUNT(csi.InteractionID) = 0 THEN 0
        ELSE CAST(
            (SUM(CASE WHEN csi.ResolutionStatus = 'Resolved' THEN 1 ELSE 0 END) * 100.0) / 
            COUNT(csi.InteractionID) 
            AS DECIMAL(5,2)
        )
    END AS ResolutionSuccessRate
FROM 
    Agents a
LEFT JOIN 
    CustomerServiceInteraction csi ON a.AgentID = csi.AgentID
GROUP BY 
    a.AgentID, a.Name;



select * from View_AgentResolutionStats