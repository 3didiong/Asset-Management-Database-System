-- Adding a Strategy
INSERT INTO Investment_Strategy VALUES (1, 'Aggressive Growth', 'High');

-- Adding a Client
INSERT INTO Client VALUES (101, 'Didee Smith', '123 Lekki Phase 1', 'didee@example.com');

-- Adding an Account
INSERT INTO Account VALUES ('ACT-5500', '2025-01-15', 'Active', 101, 1);

-- Adding a Mandate
INSERT INTO Mandate VALUES (501, '2025-01-01', 15.00);

-- Adding a Portfolio (Linked to Account and Mandate)
INSERT INTO Portfolio VALUES (901, 'Didee Main Equity', 1000000.00, 'ACT-5500', 501);

-- Adding Assets
INSERT INTO Asset VALUES ('AAPL', 'Apple Inc.', 'Equity');
INSERT INTO Asset VALUES ('TSLA', 'Tesla Inc.', 'Equity');

-- Adding Holdings (What Didee actually owns)
INSERT INTO Holding VALUES (901, 'AAPL', 150, '2025-02-10');
INSERT INTO Holding VALUES (901, 'TSLA', 50, '2025-03-05');