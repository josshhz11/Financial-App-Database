-- New Investors
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('8123-4567', 'Alice Tan', 'Female', '1985-09-12', 120000.00, 'DBS'),
('8234-5678', 'John Lim', 'Male', '1993-04-25', 95000.00, 'Shopee'),
('8345-6789', 'Muthu Raj', 'Male', '1962-01-10', 70000.00, 'SingHealth'),
('8456-7890', 'Grace Ho', 'Female', '2000-11-05', 65000.00, 'GovTech');

-- Risk Tolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Moderate', '8123-4567', 'B', 'C', 'C', 'B', 'B'),
('Aggressive', '8234-5678', 'A', 'A', 'B', 'A', 'A'),
('Conservative', '8345-6789', 'C', 'C', 'D', 'C', 'D'),
('Aggressive', '8456-7890', 'A', 'B', 'B', 'A', 'B');

-- Portfolios
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '8123-4567'),  -- PID = 2
(0, 0, '2024-01-01', 0, '8234-5678'), -- PID = 3
(0, 0, '2024-01-01', 0, '8345-6789'),  -- PID = 4
(0, 0, '2024-01-01', 0, '8456-7890');  -- PID = 5

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '8123-4567', 400000.00, '2024-12-31', '2024-04-07'),
('Retirement planning', '8123-4567', 800000.00, '2024-06-30', '2024-04-07'),

('Start a business', '8234-5678', 100000.00, '2024-12-31', '2024-04-07'),
('Travel to Europe', '8234-5678', 15000.00, '2024-05-01', '2024-04-07'),

('Fund children’s education', '8345-6789', 120000.00, '2024-03-01', '2024-04-07'),
('Retirement planning', '8345-6789', 500000.00, '2024-05-01', '2024-04-07'),

('Buy a house', '8456-7890', 350000.00, '2024-06-01', '2024-04-07'),
('Travel to Europe', '8456-7890', 18000.00, '2024-08-01', '2024-04-07');

-- Stock, Fund, Bond Allocations per PID
-- PID 2
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(2, 2, '2024-01-01', 0.20, 'Tiger Brokers'),
(3, 2, '2024-01-01', 0.15, 'Tiger Brokers');
INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(12, 2, '2024-01-01', 0.25, 'Tiger Brokers'),
(14, 2, '2024-01-01', 0.10, 'Tiger Brokers');
INSERT INTO BondInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(16, 2, '2024-01-01', 0.30, 'Tiger Brokers');

-- PID 3
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(5, 3, '2024-01-01', 0.25, 'Webull'),
(6, 3, '2024-01-01', 0.25, 'Webull'),
(8, 3, '2024-01-01', 0.20, 'Webull');
INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(11, 3, '2024-01-01', 0.30, 'Webull');

-- PID 4
INSERT INTO BondInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(15, 4, '2024-01-01', 0.25, 'OCBC Securities'),
(16, 4, '2024-01-01', 0.25, 'OCBC Securities'),
(17, 4, '2024-01-01', 0.25, 'OCBC Securities');
INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(12, 4, '2024-01-01', 0.25, 'OCBC Securities');

-- PID 5
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(4, 5, '2024-01-01', 0.15, 'Moomoo'),
(10, 5, '2024-01-01', 0.15, 'Moomoo');
INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(13, 5, '2024-01-01', 0.25, 'Moomoo'),
(14, 5, '2024-01-01', 0.25, 'Moomoo');
INSERT INTO BondInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company) VALUES
(18, 5, '2024-01-01', 0.20, 'Moomoo');

-- Invested Values
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 2, '8123-4567', 8000),
('2024-03-01', 2, '8123-4567', 2000),

('2024-01-01', 3, '8234-5678', 6000),
('2024-04-01', 3, '8234-5678', 6000),

('2024-01-01', 4, '8345-6789', 10000),

('2024-01-01', 5, '8456-7890', 10000),
('2024-05-01', 5, '8456-7890', 1000);

-- Transaction Logs for PID 2 to 5
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 2, 2, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 3, 2, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 12, 2, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 14, 2, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 16, 2, 'Purchase', 50);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-03-01 11:00:00', 2, 2, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-03-01 11:00:00', 3, 2, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-03-01 11:00:00', 12, 2, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-03-01 11:00:00', 14, 2, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-03-01 11:00:00', 16, 2, 'TopUp', 50);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 5, 3, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 6, 3, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 8, 3, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 11, 3, 'Purchase', 50);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-04-01 11:00:00', 5, 3, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-04-01 11:00:00', 6, 3, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-04-01 11:00:00', 8, 3, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-04-01 11:00:00', 11, 3, 'TopUp', 50);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 15, 4, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 16, 4, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 17, 4, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 12, 4, 'Purchase', 50);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 4, 5, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 10, 5, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 13, 5, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 14, 5, 'Purchase', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 18, 5, 'Purchase', 50);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-05-01 11:00:00', 4, 5, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-05-01 11:00:00', 10, 5, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-05-01 11:00:00', 13, 5, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-05-01 11:00:00', 14, 5, 'TopUp', 50);
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-05-01 11:00:00', 18, 5, 'TopUp', 50);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
-- PID 2: Alice Tan
('2024-01-31', 2, '8123-4567', 0),
('2024-02-29', 2, '8123-4567', -100),
('2024-03-31', 2, '8123-4567', -400),
('2024-04-30', 2, '8123-4567', -100),
('2024-05-31', 2, '8123-4567', 100),
('2024-06-30', 2, '8123-4567', -500),
('2024-07-31', 2, '8123-4567', -600),
('2024-08-31', 2, '8123-4567', -500),
('2024-09-30', 2, '8123-4567', -300),
('2024-10-31', 2, '8123-4567', -100),
('2024-11-30', 2, '8123-4567', -100),
('2024-12-31', 2, '8123-4567', -900),

-- PID 3: John Lim
('2024-01-31', 3, '8234-5678', 100),
('2024-02-29', 3, '8234-5678', 0),
('2024-03-31', 3, '8234-5678', -300),
('2024-04-30', 3, '8234-5678', 0),
('2024-05-31', 3, '8234-5678', 200),
('2024-06-30', 3, '8234-5678', -400),
('2024-07-31', 3, '8234-5678', -500),
('2024-08-31', 3, '8234-5678', -400),
('2024-09-30', 3, '8234-5678', -200),
('2024-10-31', 3, '8234-5678', 0),
('2024-11-30', 3, '8234-5678', 0),
('2024-12-31', 3, '8234-5678', -800),

-- PID 4: Muthu Raj
('2024-01-31', 4, '8345-6789', 200),
('2024-02-29', 4, '8345-6789', 100),
('2024-03-31', 4, '8345-6789', -200),
('2024-04-30', 4, '8345-6789', 100),
('2024-05-31', 4, '8345-6789', 300),
('2024-06-30', 4, '8345-6789', -300),
('2024-07-31', 4, '8345-6789', -400),
('2024-08-31', 4, '8345-6789', -300),
('2024-09-30', 4, '8345-6789', -100),
('2024-10-31', 4, '8345-6789', 100),
('2024-11-30', 4, '8345-6789', 100),
('2024-12-31', 4, '8345-6789', -700),

-- PID 5: Grace Ho
('2024-01-31', 5, '8456-7890', 300),
('2024-02-29', 5, '8456-7890', 200),
('2024-03-31', 5, '8456-7890', -100),
('2024-04-30', 5, '8456-7890', 200),
('2024-05-31', 5, '8456-7890', 400),
('2024-06-30', 5, '8456-7890', -200),
('2024-07-31', 5, '8456-7890', -300),
('2024-08-31', 5, '8456-7890', -200),
('2024-09-30', 5, '8456-7890', 0),
('2024-10-31', 5, '8456-7890', 200),
('2024-11-30', 5, '8456-7890', 200),
('2024-12-31', 5, '8456-7890', -600);


-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 2 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 2 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 2;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 2 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 2 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 2;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 2 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 2 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 2;

-- Update Portfolio: Annualised_Returns for PID = 3
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 3 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 3 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 3;

-- Update Portfolio: Market_Value for PID = 3
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 3 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 3 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 3;

-- Update Portfolio: Fee for PID = 3
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 3 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 3 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 3;


-- Update Portfolio: Annualised_Returns for PID = 4
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 4 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 4 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 4;

-- Update Portfolio: Market_Value for PID = 4
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 4 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 4 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 4;

-- Update Portfolio: Fee for PID = 4
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 4 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 4 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 4;


-- Update Portfolio: Annualised_Returns for PID = 5
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 5 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 5 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 5;

-- Update Portfolio: Market_Value for PID = 5
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 5 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 5 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 5;

-- Update Portfolio: Fee for PID = 5
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 5 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 5 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 5;

-- New Investor
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-1111', 'Aisha Rahman', 'Female', '1991-07-22', 85000, 'Singhealth');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Moderate', '9000-1111', 'B', 'C', 'B', 'B', 'C');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9000-1111', 450000.00, '2024-12-31', '2024-04-07'),
('Travel to Europe', '9000-1111', 25000.00, '2024-07-01', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-1111'); -- PID = 6

-- Stock & Fund allocation (same structure)
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (5, 6, '2024-01-01', 0.25, 'Webull'),
       (8, 6, '2024-01-01', 0.25, 'Webull');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (12, 6, '2024-01-01', 0.30, 'Webull'),
       (14, 6, '2024-01-01', 0.20, 'Webull');

-- Invested Values
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 6, '9000-1111', 3000),
('2024-04-01', 6, '9000-1111', 4000),
('2024-07-01', 6, '9000-1111', 5000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 11:00:00', 5, 6, 'Purchase', 50),
('2024-01-01 11:00:00', 8, 6, 'Purchase', 50),
('2024-01-01 11:00:00', 12, 6, 'Purchase', 50),
('2024-01-01 11:00:00', 14, 6, 'Purchase', 50),
-- TopUp (April)
('2024-04-01 11:00:00', 5, 6, 'TopUp', 50),
('2024-04-01 11:00:00', 8, 6, 'TopUp', 50),
('2024-04-01 11:00:00', 12, 6, 'TopUp', 50),
('2024-04-01 11:00:00', 14, 6, 'TopUp', 50),
-- TopUp (July)
('2024-07-01 11:00:00', 5, 6, 'TopUp', 50),
('2024-07-01 11:00:00', 8, 6, 'TopUp', 50),
('2024-07-01 11:00:00', 12, 6, 'TopUp', 50),
('2024-07-01 11:00:00', 14, 6, 'TopUp', 50);

-- Unrealised Gain/Loss (one per month)
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 6, '9000-1111', 100),
('2024-02-29', 6, '9000-1111', 150),
('2024-03-31', 6, '9000-1111', 200),
('2024-04-30', 6, '9000-1111', 300),
('2024-05-31', 6, '9000-1111', 350),
('2024-06-30', 6, '9000-1111', 400),
('2024-07-31', 6, '9000-1111', 450),
('2024-08-31', 6, '9000-1111', 500),
('2024-09-30', 6, '9000-1111', 400),
('2024-10-31', 6, '9000-1111', 300),
('2024-11-30', 6, '9000-1111', 200),
('2024-12-31', 6, '9000-1111', 100);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 6 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 6 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 6;

-- Update Portfolio: Marke_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 6 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 6 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 6;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 6 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 6 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 6;

-- PID = 7
-- New Investor
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9111-2222', 'Bryan Koh', 'Male', '1995-09-10', 72000, 'Singhealth');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Aggressive', '9111-2222', 'A', 'A', 'B', 'A', 'A');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Start a business', '9111-2222', 90000.00, '2024-12-01', '2024-04-07'),
('Buy a house', '9111-2222', 450000.00, '2024-12-31', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9111-2222'); -- PID = 7

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (3, 7, '2024-01-01', 0.3, 'Webull');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (11, 7, '2024-01-01', 0.7, 'Webull');

-- Invested Values
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 7, '9111-2222', 1000),
('2024-02-02', 7, '9111-2222', 1000),
('2024-03-03', 7, '9111-2222', 1000),
('2024-04-01', 7, '9111-2222', 1000),
('2024-05-02', 7, '9111-2222', 1000),
('2024-06-03', 7, '9111-2222', 1000),
('2024-07-01', 7, '9111-2222', 1000),
('2024-08-02', 7, '9111-2222', 1000),
('2024-09-03', 7, '9111-2222', 1000),
('2024-10-01', 7, '9111-2222', 1000),
('2024-11-02', 7, '9111-2222', 1000),
('2024-12-03', 7, '9111-2222', 1000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 3, 7, 'TopUp', 50),
('2024-02-02 11:00:00', 3, 7, 'TopUp', 50),
('2024-03-03 11:00:00', 3, 7, 'TopUp', 50),
('2024-04-01 11:00:00', 3, 7, 'TopUp', 50),
('2024-05-02 11:00:00', 3, 7, 'TopUp', 50),
('2024-06-03 11:00:00', 3, 7, 'TopUp', 50),
('2024-07-01 11:00:00', 3, 7, 'TopUp', 50),
('2024-08-02 11:00:00', 3, 7, 'TopUp', 50),
('2024-09-03 11:00:00', 3, 7, 'TopUp', 50),
('2024-10-01 11:00:00', 3, 7, 'TopUp', 50),
('2024-11-02 11:00:00', 3, 7, 'TopUp', 50),
('2024-12-03 11:00:00', 3, 7, 'TopUp', 50);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 7, '9111-2222', 120),
('2024-02-29', 7, '9111-2222', 130),
('2024-03-31', 7, '9111-2222', 140),
('2024-04-30', 7, '9111-2222', 150),
('2024-05-31', 7, '9111-2222', 160),
('2024-06-30', 7, '9111-2222', 170),
('2024-07-31', 7, '9111-2222', 180),
('2024-08-31', 7, '9111-2222', 190),
('2024-09-30', 7, '9111-2222', 200),
('2024-10-31', 7, '9111-2222', 210),
('2024-11-30', 7, '9111-2222', 220),
('2024-12-31', 7, '9111-2222', 230);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 7 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 7 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 7;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 7 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 7 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 7;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 7 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 7 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 7;

-- PID = 8
-- New Investor (PID = 8)
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9222-3333', 'Elaine Chua', 'Female', '1988-06-18', 95000, 'DBS');

-- Risk Tolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Moderate', '9222-3333', 'B', 'B', 'C', 'C', 'B');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9222-3333', 420000.00, '2024-12-31', '2024-04-08');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9222-3333'); -- PID = 8

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (2, 8, '2024-01-01', 0.25, 'Tiger Brokers'),
       (5, 8, '2024-01-01', 0.25, 'Tiger Brokers');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (12, 8, '2024-01-01', 0.30, 'Tiger Brokers'),
       (14, 8, '2024-01-01', 0.20, 'Tiger Brokers');

-- Invested Value
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 8, '9222-3333', 5000),
('2024-04-01', 8, '9222-3333', 3000);

-- Transaction Log
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 2, 8, 'Purchase', 50),
('2024-01-01 11:00:00', 5, 8, 'Purchase', 50),
('2024-01-01 11:00:00', 12, 8, 'Purchase', 50),
('2024-01-01 11:00:00', 14, 8, 'Purchase', 50),

('2024-04-01 11:00:00', 2, 8, 'TopUp', 50),
('2024-04-01 11:00:00', 5, 8, 'TopUp', 50),
('2024-04-01 11:00:00', 12, 8, 'TopUp', 50),
('2024-04-01 11:00:00', 14, 8, 'TopUp', 50);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 8, '9222-3333', 100),
('2024-02-29', 8, '9222-3333', 120),
('2024-03-31', 8, '9222-3333', 130),
('2024-04-30', 8, '9222-3333', 140),
('2024-05-31', 8, '9222-3333', 150),
('2024-06-30', 8, '9222-3333', 160);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 8 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 8 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 8;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 8 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 8 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 8;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 8 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 8 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 8;


-- PID = 9
-- New Investor (PID = 9)
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9333-4444', 'Marcus Lee', 'Male', '1987-03-15', 105000, 'DBS');

-- Risk Tolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Moderate', '9333-4444', 'B', 'C', 'B', 'B', 'C');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9333-4444', 460000.00, '2025-12-31', '2024-04-08'),
('Retirement planning', '9333-4444', 900000.00, '2045-06-30', '2024-04-08');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9333-4444'); -- PID = 9

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (1, 9, '2024-01-01', 0.20, 'Tiger Brokers'),
       (2, 9, '2024-01-01', 0.20, 'Tiger Brokers');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (11, 9, '2024-01-01', 0.30, 'Tiger Brokers'),
       (13, 9, '2024-01-01', 0.30, 'Tiger Brokers');

-- Invested Value
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 9, '9333-4444', 4000),
('2024-04-01', 9, '9333-4444', 4000);

-- Transaction Log
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 1, 9, 'Purchase', 50),
('2024-01-01 11:00:00', 2, 9, 'Purchase', 50),
('2024-01-01 11:00:00', 11, 9, 'Purchase', 50),
('2024-01-01 11:00:00', 13, 9, 'Purchase', 50),

('2024-04-01 11:00:00', 1, 9, 'TopUp', 50),
('2024-04-01 11:00:00', 2, 9, 'TopUp', 50),
('2024-04-01 11:00:00', 11, 9, 'TopUp', 50),
('2024-04-01 11:00:00', 13, 9, 'TopUp', 50);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 9, '9333-4444', 80),
('2024-02-29', 9, '9333-4444', 90),
('2024-03-31', 9, '9333-4444', 100),
('2024-04-30', 9, '9333-4444', 120),
('2024-05-31', 9, '9333-4444', 130),
('2024-06-30', 9, '9333-4444', 140);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 9 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 9 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 9;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 9 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 9 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 9;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 9 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 9 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 9;
