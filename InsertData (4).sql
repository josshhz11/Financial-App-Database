-- Investor Data
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9170-9018', 'Kieran', 'Male', '2002-05-02', 100000, 'Shopee');

-- Asset Data
INSERT INTO Asset (Name, Price) VALUES
('Apple Inc. (AAPL)', 150),
('Microsoft (MSFT)', 250),
('Amazon (AMZN)', 300),
('Tesla (TSLA)', 700),
('Google (GOOGL)', 2800),
('Facebook (FB)', 350),
('Mastercard (MA)', 350),
('NVIDIA (NVDA)', 800),
('Intel (INTC)', 50),
('AMD (AMD)', 100),
('Vanguard Total Stock Market ETF (VTI)', 200),
('Vanguard Total Bond Market ETF (BND)', 100),
('Vanguard Total International Stock ETF (VXUS)', 150),
('Vanguard Total International Bond ETF (BNDX)', 120),
('Vanguard S&P 500 ETF (VOO)', 350),
('1-Year Treasury Note', 500),
('5-Year Treasury Note', 200),
('10-Year Treasury Note', 100);

-- Stock, Bond and Fund Data
-- Stock details.
INSERT INTO Stock (Asset_ID, PE_Ratio, EPS, EBITDA) VALUES
(1, 15.0, 5.0, 20.0),
(2, 20.0, 6.0, 25.0),    
(3, 25.0, 7.0, 30.0),
(4, 30.0, 8.0, 35.0),
(5, 35.0, 9.0, 40.0),
(6, 40.0, 10.0, 45.0),
(7, 45.0, 11.0, 50.0),
(8, 50.0, 12.0, 55.0),
(9, 55.0, 13.0, 60.0),
(10,60.0,14.0,65.0);

-- Fund details.
INSERT INTO Fund (Asset_ID, Expense_Ratio, Dividend_Yield) VALUES
(11, 0.10, 1.5),
(12, 0.15, 2.0),
(13, 0.20, 2.5),
(14, 0.25, 3.0);

-- Bond details.
INSERT INTO Bond (Asset_ID, Interest_Rate, Maturity_Date) VALUES
(15, 2.5, '2030-01-01'), 
(16, 3.0, '2035-01-01'),
(17, 3.5, '2040-01-01'),
(18, 4.0, '2045-01-01');

-- RiskTolerance Data
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Aggressive', '9170-9018', 'A', 'B', 'C', 'D', 'E');

-- Financial Goal Data
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9170-9018', 500000.00, '2024-12-31', '2024-04-07'),
('Fund children’s education', '9170-9018', 150000.00, '2024-06-30', '2024-04-07'),
('Start a business', '9170-9018', 80000.00, '2024-03-02', '2024-04-07'),
('Retirement planning', '9170-9018', 1000000.00, '2024-12-31', '2024-04-07'),
('Travel to Europe', '9170-9018', 20000.00, '2024-06-01', '2024-04-07');

-- Portfolio Data
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0,  '9170-9018');  -- PID = 1

INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (4, 1, '2024-01-01', 0.12, 'Webull');
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (1, 1, '2024-01-01', 0.18, 'Webull');
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (7, 1, '2024-01-01', 0.2, 'Webull');
INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (13, 1, '2024-01-01', 0.1, 'Webull');
INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (11, 1, '2024-01-01', 0.40, 'Webull');

INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 1, '9170-9018', 4000),
('2024-03-15', 1, '9170-9018', 5000),
('2024-06-15', 1, '9170-9018', 6000);

INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
('2024-01-01 11:00:00', 4, 1, 'Purchase', 50),
('2024-01-01 11:00:00', 1, 1, 'Purchase', 50),
('2024-01-01 11:00:00', 7, 1, 'Purchase', 50),
('2024-01-01 11:00:00', 13, 1, 'Purchase', 50),
('2024-01-01 11:00:00', 11, 1, 'Purchase', 50),
('2024-03-15 11:00:00', 4, 1, 'TopUp', 50),
('2024-03-15 11:00:00', 1, 1, 'TopUp', 50),
('2024-03-15 11:00:00', 7, 1, 'TopUp', 50),
('2024-03-15 11:00:00', 13, 1, 'TopUp', 50),
('2024-03-15 11:00:00', 11, 1, 'TopUp', 50),
('2024-06-15 11:00:00', 4, 1, 'TopUp', 50),
('2024-06-15 11:00:00', 1, 1, 'TopUp', 50),
('2024-06-15 11:00:00', 7, 1, 'TopUp', 50),
('2024-06-15 11:00:00', 13, 1, 'TopUp', 50),
('2024-06-15 11:00:00', 11, 1, 'TopUp', 50);

INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 1, '9170-9018', -100),
('2024-02-29', 1, '9170-9018', -200),
('2024-03-31', 1, '9170-9018', -500),
('2024-04-30', 1, '9170-9018', -200),
('2024-05-31', 1, '9170-9018', 0),
('2024-06-30', 1, '9170-9018', -600),
('2024-07-31', 1, '9170-9018', -700),
('2024-08-31', 1, '9170-9018', -600),
('2024-09-30', 1, '9170-9018', -400),
('2024-10-31', 1, '9170-9018', -200),
('2024-11-30', 1, '9170-9018', -200),
('2024-12-31', 1, '9170-9018', -1000);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 1 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 1 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 1;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 1 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 1 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 1;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 1 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 1 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 1;
