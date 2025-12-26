
Nexus Asset Management (NAM) - Business Rules
Nexus Asset Management (NAM) is developing a new database system to manage its segregated investment portfolios.

Here are the key requirements:

**1. Client and Account Entities**
Each Client (e.g., "Jane Doe", "Acme Corporation") is uniquely identified by a ClientID. It also has a Name, Address, and ContactEmail. The Name and ContactEmail of a client must always be provided.
Investment Accounts (AccountNumber, DateOpened, Status) are established by clients. An Account is uniquely identified by the AccountNumber. The DateOpened and Status must always be provided.
A Client may own one or more Accounts. An Account is owned by one and only one Client.


**2. Strategy and Portfolio Entities**
Each Investment Strategy (StrategyID, StrategyName, RiskLevel) is uniquely identified by the StrategyID. The StrategyName must always be provided.
An Account must be managed under one and only one Investment Strategy. An Investment Strategy may be used for one or more Accounts.
A Portfolio (PortfolioID, PortfolioName, TotalValue) is linked to an account. A Portfolio is uniquely identified by the PortfolioID.
A Portfolio is contained by exactly one Account, and an Account contains exactly one Portfolio.


**3. Mandates and Assets**
Mandates (MandateID, MandateStartDate, MaxSingleAssetExposure) define the rules for a portfolio.
A Portfolio is governed by one and only one Mandate. A Mandate can apply to one or more Portfolios.
Assets (AssetTicker, AssetName, AssetType) are the securities traded. AssetTicker (e.g., 'AAPL', 'VFINX') uniquely identifies an asset.
A Mandate may permit one or more Assets (or types of assets), and an Asset may be permitted under multiple Mandates. When an Asset is permitted under a Mandate, the ApprovalDate is recorded.


**4. Holdings and Transactions**
A Portfolio may hold one or more Assets, and an Asset may be held in multiple Portfolios. This is a holding position.
When a Portfolio holds an Asset, the SharesUnits and DateAcquired are recorded. This Holding record is uniquely identified by the combination of the PortfolioID and the AssetTicker.
Transactions (TransactionID, TradeDate, Quantity, PricePerShare) are executed.
A Portfolio executes one or more Transactions. A Transaction is executed for one and only one Portfolio.
An Asset is involved in one or more Transactions, and a Transaction involves one and only one Asset.



