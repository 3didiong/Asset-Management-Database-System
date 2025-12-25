-- FULL CLIENT ASSET VALUATION REPORT
-- DESCRIPTION: This query performs a 4-way join across the Client, Account, Portfolio, 
-- and Holding tables. It translates technical IDs into a readable report that shows 
-- which human client owns which specific assets, their quantities, and the 
-- overarching investment strategy assigned to them.
SELECT 
    c.Name AS Client_Name, 
    p.PortfolioName, 
    h.AssetTicker, 
    h.SharesUnits,
    s.StrategyName
FROM Client c
JOIN Account a ON c.ClientID = a.ClientID
JOIN Portfolio p ON a.AccountNumber = p.AccountNumber
JOIN Holding h ON p.PortfolioID = h.PortfolioID
JOIN Investment_Strategy s ON a.StrategyID = s.StrategyID;

-- COMPLIANCE AUDIT: UNAPPROVED HOLDINGS
-- DESCRIPTION: Checks if a Portfolio holds an Asset that is NOT in its Mandate list.
-- This identifies regulatory or internal policy violations.
SELECT 
    p.PortfolioName, 
    h.AssetTicker AS "Non_Compliant_Asset"
FROM Portfolio p
JOIN Holding h ON p.PortfolioID = h.PortfolioID
LEFT JOIN Permitted_Asset pa ON p.MandateID = pa.MandateID AND h.AssetTicker = pa.AssetTicker
WHERE pa.AssetTicker IS NULL;
