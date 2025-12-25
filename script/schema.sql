-- 1. Create Investment Strategy Table
CREATE TABLE Investment_Strategy (
    StrategyID INT PRIMARY KEY,
    StrategyName VARCHAR(100) NOT NULL,
    RiskLevel VARCHAR(50)
);

-- 2. Create Client Table
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address TEXT,
    ContactEmail VARCHAR(255) NOT NULL UNIQUE
);

-- 3. Create Account Table
CREATE TABLE Account (
    AccountNumber VARCHAR(20) PRIMARY KEY,
    DateOpened DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    ClientID INT NOT NULL,
    StrategyID INT NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (StrategyID) REFERENCES Investment_Strategy(StrategyID)
);

-- 4. Create Mandate Table
CREATE TABLE Mandate (
    MandateID INT PRIMARY KEY,
    MandateStartDate DATE,
    MaxSingleAssetExposure DECIMAL(5, 2)
);

-- 5. Create Portfolio Table (1:1 with Account)
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY,
    PortfolioName VARCHAR(100),
    TotalValue DECIMAL(18, 2),
    AccountNumber VARCHAR(20) NOT NULL UNIQUE,
    MandateID INT NOT NULL,
    FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber),
    FOREIGN KEY (MandateID) REFERENCES Mandate(MandateID)
);

-- 6. Create Asset Table
CREATE TABLE Asset (
    AssetTicker VARCHAR(10) PRIMARY KEY,
    AssetName VARCHAR(255),
    AssetType VARCHAR(50)
);

-- 7. Create Holdings (Intersection Table for Portfolio & Asset)
-- This implements the Composite Primary Key we discussed for 2NF.



CREATE TABLE Holding (
    PortfolioID INT,
    AssetTicker VARCHAR(10),
    SharesUnits DECIMAL(18, 4),
    DateAcquired DATE,
    PRIMARY KEY (PortfolioID, AssetTicker),
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID),
    FOREIGN KEY (AssetTicker) REFERENCES Asset(AssetTicker)
);

-- 8. Create Transaction Table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    TradeDate DATE,
    Quantity DECIMAL(18, 4),
    PricePerShare DECIMAL(18, 2),
    PortfolioID INT NOT NULL,
    AssetTicker VARCHAR(10) NOT NULL,
    FOREIGN KEY (PortfolioID) REFERENCES Portfolio(PortfolioID),
    FOREIGN KEY (AssetTicker) REFERENCES Asset(AssetTicker)
);

-- 9. Create Permitted_Asset (Intersection for Mandate & Asset)
CREATE TABLE Permitted_Asset (
    MandateID INT,
    AssetTicker VARCHAR(10),
    ApprovalDate DATE,
    PRIMARY KEY (MandateID, AssetTicker),
    FOREIGN KEY (MandateID) REFERENCES Mandate(MandateID),
    FOREIGN KEY (AssetTicker) REFERENCES Asset(AssetTicker)
);
