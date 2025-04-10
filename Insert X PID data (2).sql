-- New Investor
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-2222', 'Marcus Chen', 'Male', '1988-03-15', 95000, 'Shopee');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Aggressive', '9000-2222', 'A', 'B', 'A', 'A', 'B');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Start a business', '9000-2222', 500000.00, '2025-06-30', '2024-04-07'),
('Fund children’s education', '9000-2222', 300000.00, '2025-01-01', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-2222'); -- PID = 10

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (6, 10, '2024-01-01', 0.30, 'Tiger Brokers'),
       (9, 10, '2024-01-01', 0.30, 'Tiger Brokers');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (13, 10, '2024-01-01', 0.25, 'Tiger Brokers'),
       (15, 10, '2024-01-01', 0.15, 'Tiger Brokers');

-- Invested Values
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 10, '9000-2222', 5000),
('2024-04-01', 10, '9000-2222', 7000),
('2024-07-01', 10, '9000-2222', 8000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 10:30:00', 6, 10, 'Purchase', 60),
('2024-01-01 10:30:00', 9, 10, 'Purchase', 60),
('2024-01-01 10:30:00', 13, 10, 'Purchase', 60),
('2024-01-01 10:30:00', 15, 10, 'Purchase', 60),
-- TopUp (April)
('2024-04-01 10:30:00', 6, 10, 'TopUp', 60),
('2024-04-01 10:30:00', 9, 10, 'TopUp', 60),
('2024-04-01 10:30:00', 13, 10, 'TopUp', 60),
('2024-04-01 10:30:00', 15, 10, 'TopUp', 60),
-- TopUp (July)
('2024-07-01 10:30:00', 6, 10, 'TopUp', 60),
('2024-07-01 10:30:00', 9, 10, 'TopUp', 60),
('2024-07-01 10:30:00', 13, 10, 'TopUp', 60),
('2024-07-01 10:30:00', 15, 10, 'TopUp', 60);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 10, '9000-2222', 200),
('2024-02-29', 10, '9000-2222', 300),
('2024-03-31', 10, '9000-2222', 400),
('2024-04-30', 10, '9000-2222', 500),
('2024-05-31', 10, '9000-2222', 600),
('2024-06-30', 10, '9000-2222', 700),
('2024-07-31', 10, '9000-2222', 800),
('2024-08-31', 10, '9000-2222', 900),
('2024-09-30', 10, '9000-2222', 800),
('2024-10-31', 10, '9000-2222', 600),
('2024-11-30', 10, '9000-2222', 400),
('2024-12-31', 10, '9000-2222', 200);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 10 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 10 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 10;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 10 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 10 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 10;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 10 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 10 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 10;

-- New Investor PID = 11
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-3333', 'Sarah Tan', 'Female', '1990-05-12', 88000, 'SingHealth');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Conservative', '9000-3333', 'C', 'B', 'C', 'B', 'C');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9000-3333', 600000.00, '2025-06-30', '2024-04-07'),
('Fund children’s education', '9000-3333', 200000.00, '2024-12-31', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-3333'); -- PID = 11

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (2, 11, '2024-01-01', 0.20, 'Moomoo'),
       (4, 11, '2024-01-01', 0.20, 'Moomoo');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (11, 11, '2024-01-01', 0.35, 'Moomoo'),
       (12, 11, '2024-01-01', 0.25, 'Moomoo');

-- Invested Values
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 11, '9000-3333', 6000),
('2024-04-01', 11, '9000-3333', 8000),
('2024-07-01', 11, '9000-3333', 10000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 09:30:00', 2, 11, 'Purchase', 55),
('2024-01-01 09:30:00', 4, 11, 'Purchase', 55),
('2024-01-01 09:30:00', 11, 11, 'Purchase', 55),
('2024-01-01 09:30:00', 12, 11, 'Purchase', 55),
-- TopUp (April)
('2024-04-01 09:30:00', 2, 11, 'TopUp', 55),
('2024-04-01 09:30:00', 4, 11, 'TopUp', 55),
('2024-04-01 09:30:00', 11, 11, 'TopUp', 55),
('2024-04-01 09:30:00', 12, 11, 'TopUp', 55),
-- TopUp (July)
('2024-07-01 09:30:00', 2, 11, 'TopUp', 55),
('2024-07-01 09:30:00', 4, 11, 'TopUp', 55),
('2024-07-01 09:30:00', 11, 11, 'TopUp', 55),
('2024-07-01 09:30:00', 12, 11, 'TopUp', 55);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 11, '9000-3333', 150),
('2024-02-29', 11, '9000-3333', 250),
('2024-03-31', 11, '9000-3333', 350),
('2024-04-30', 11, '9000-3333', 450),
('2024-05-31', 11, '9000-3333', 550),
('2024-06-30', 11, '9000-3333', 650),
('2024-07-31', 11, '9000-3333', 750),
('2024-08-31', 11, '9000-3333', 850),
('2024-09-30', 11, '9000-3333', 750),
('2024-10-31', 11, '9000-3333', 550),
('2024-11-30', 11, '9000-3333', 350),
('2024-12-31', 11, '9000-3333', 150);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 11 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 11 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 11;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 11 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 11 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 11;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 11 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 11 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 11;

-- New Investor PID = 12
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-4444', 'David Lim', 'Male', '1985-08-20', 92000, 'GovTech');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Moderate', '9000-4444', 'B', 'B', 'C', 'B', 'B');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9000-4444', 450000.00, '2024-12-31', '2024-04-07'),
('Start a business', '9000-4444', 100000.00, '2025-03-31', '2024-04-07'),
('Travel to Europe', '9000-4444', 25000.00, '2024-09-30', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-4444'); -- PID = 12

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (3, 12, '2024-01-01', 0.25, 'Webull'),
       (7, 12, '2024-01-01', 0.25, 'Webull');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (11, 12, '2024-01-01', 0.30, 'Webull'),
       (14, 12, '2024-01-01', 0.20, 'Webull');

-- Invested Values
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 12, '9000-4444', 4500),
('2024-04-01', 12, '9000-4444', 6500),
('2024-07-01', 12, '9000-4444', 7500);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 10:00:00', 3, 12, 'Purchase', 45),
('2024-01-01 10:00:00', 7, 12, 'Purchase', 45),
('2024-01-01 10:00:00', 11, 12, 'Purchase', 45),
('2024-01-01 10:00:00', 14, 12, 'Purchase', 45),
-- TopUp (April)
('2024-04-01 10:00:00', 3, 12, 'TopUp', 45),
('2024-04-01 10:00:00', 7, 12, 'TopUp', 45),
('2024-04-01 10:00:00', 11, 12, 'TopUp', 45),
('2024-04-01 10:00:00', 14, 12, 'TopUp', 45),
-- TopUp (July)
('2024-07-01 10:00:00', 3, 12, 'TopUp', 45),
('2024-07-01 10:00:00', 7, 12, 'TopUp', 45),
('2024-07-01 10:00:00', 11, 12, 'TopUp', 45),
('2024-07-01 10:00:00', 14, 12, 'TopUp', 45);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 12, '9000-4444', 180),
('2024-02-29', 12, '9000-4444', 280),
('2024-03-31', 12, '9000-4444', 380),
('2024-04-30', 12, '9000-4444', 480),
('2024-05-31', 12, '9000-4444', 580),
('2024-06-30', 12, '9000-4444', 680),
('2024-07-31', 12, '9000-4444', 780),
('2024-08-31', 12, '9000-4444', 880),
('2024-09-30', 12, '9000-4444', 780),
('2024-10-31', 12, '9000-4444', 580),
('2024-11-30', 12, '9000-4444', 380),
('2024-12-31', 12, '9000-4444', 180);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 12 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 12 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 12;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 12 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 12 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 12;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 12 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 12 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 12;

-- New Investor PID = 13
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-5555', 'Michael Wong', 'Male', '1993-11-25', 78000, 'GovTech');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Aggressive', '9000-5555', 'A', 'A', 'B', 'A', 'B');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Retirement planning', '9000-5555', 1200000.00, '2025-12-31', '2024-04-07'),
('Start a business', '9000-5555', 120000.00, '2025-06-30', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-5555'); -- PID = 13

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (1, 13, '2024-01-01', 0.35, 'Tiger Brokers'),
       (5, 13, '2024-01-01', 0.35, 'Tiger Brokers');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (13, 13, '2024-01-01', 0.30, 'Tiger Brokers');

-- Invested Values (irregular intervals)
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 13, '9000-5555', 10000),
('2024-03-15', 13, '9000-5555', 15000),
('2024-05-20', 13, '9000-5555', 18000),
('2024-09-10', 13, '9000-5555', 20000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 14:15:00', 1, 13, 'Purchase', 65),
('2024-01-01 14:15:00', 5, 13, 'Purchase', 65),
('2024-01-01 14:15:00', 13, 13, 'Purchase', 65),
-- March top-up
('2024-03-15 11:45:00', 1, 13, 'TopUp', 65),
('2024-03-15 11:45:00', 5, 13, 'TopUp', 65),
('2024-03-15 11:45:00', 13, 13, 'TopUp', 65),
-- May top-up
('2024-05-20 15:30:00', 1, 13, 'TopUp', 65),
('2024-05-20 15:30:00', 5, 13, 'TopUp', 65),
('2024-05-20 15:30:00', 13, 13, 'TopUp', 65),
-- September top-up
('2024-09-10 10:15:00', 1, 13, 'TopUp', 65),
('2024-09-10 10:15:00', 5, 13, 'TopUp', 65),
('2024-09-10 10:15:00', 13, 13, 'TopUp', 65);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 13, '9000-5555', 300),
('2024-02-29', 13, '9000-5555', 500),
('2024-03-31', 13, '9000-5555', 700),
('2024-04-30', 13, '9000-5555', 900),
('2024-05-31', 13, '9000-5555', 1100),
('2024-06-30', 13, '9000-5555', 1300),
('2024-07-31', 13, '9000-5555', 1500),
('2024-08-31', 13, '9000-5555', 1700),
('2024-09-30', 13, '9000-5555', 1500),
('2024-10-31', 13, '9000-5555', 1200),
('2024-11-30', 13, '9000-5555', 900),
('2024-12-31', 13, '9000-5555', 600);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 13 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 13 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 13;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 13 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 13 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 13;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 13 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 13 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 13;

-- New Investor PID = 14
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-6666', 'Rachel Ng', 'Female', '1987-09-18', 82000, 'UOB');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Moderate', '9000-6666', 'B', 'C', 'B', 'B', 'A');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Buy a house', '9000-6666', 550000.00, '2025-03-31', '2024-04-07'),
('Travel to Europe', '9000-6666', 30000.00, '2024-12-31', '2024-04-07'),
('Retirement planning', '9000-6666', 900000.00, '2025-12-31', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-6666'); -- PID = 14

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (8, 14, '2024-01-01', 0.30, 'Moomoo'),
       (10, 14, '2024-01-01', 0.30, 'Moomoo');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (12, 14, '2024-01-01', 0.40, 'Moomoo');

-- Invested Values (irregular intervals)
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 14, '9000-6666', 8000),
('2024-02-28', 14, '9000-6666', 12000),
('2024-06-15', 14, '9000-6666', 15000),
('2024-08-20', 14, '9000-6666', 18000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 13:45:00', 8, 14, 'Purchase', 70),
('2024-01-01 13:45:00', 10, 14, 'Purchase', 70),
('2024-01-01 13:45:00', 12, 14, 'Purchase', 70),
-- February top-up
('2024-02-28 11:30:00', 8, 14, 'TopUp', 70),
('2024-02-28 11:30:00', 10, 14, 'TopUp', 70),
('2024-02-28 11:30:00', 12, 14, 'TopUp', 70),
-- June top-up
('2024-06-15 14:20:00', 8, 14, 'TopUp', 70),
('2024-06-15 14:20:00', 10, 14, 'TopUp', 70),
('2024-06-15 14:20:00', 12, 14, 'TopUp', 70),
-- August top-up
('2024-08-20 10:45:00', 8, 14, 'TopUp', 70),
('2024-08-20 10:45:00', 10, 14, 'TopUp', 70),
('2024-08-20 10:45:00', 12, 14, 'TopUp', 70);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 14, '9000-6666', 250),
('2024-02-29', 14, '9000-6666', 400),
('2024-03-31', 14, '9000-6666', 550),
('2024-04-30', 14, '9000-6666', 700),
('2024-05-31', 14, '9000-6666', 850),
('2024-06-30', 14, '9000-6666', 1000),
('2024-07-31', 14, '9000-6666', 1150),
('2024-08-31', 14, '9000-6666', 1300),
('2024-09-30', 14, '9000-6666', 1150),
('2024-10-31', 14, '9000-6666', 900),
('2024-11-30', 14, '9000-6666', 650),
('2024-12-31', 14, '9000-6666', 400);

-- Update Portfolio statements (same structure as before)
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 14 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 14 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 14;

UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 14 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 14 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 14;

UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 14 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 14 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 14;

-- New Investor PID = 15
INSERT INTO Investor (Phone, Name, Gender, DoB, Annual_Income, Company) VALUES
('9000-7777', 'Jennifer Lee', 'Female', '1989-12-03', 76000, 'Standard Chartered');

-- RiskTolerance
INSERT INTO RiskTolerance (Risk_Level, Phone, Q1, Q2, Q3, Q4, Q5) VALUES
('Conservative', '9000-7777', 'C', 'C', 'B', 'C', 'B');

-- Financial Goals
INSERT INTO FinancialGoal (Goal, Phone, Amount, Timeline, Created_Date) VALUES
('Start a business', '9000-7777', 150000.00, '2024-12-31', '2024-04-07'),
('Buy a house', '9000-7777', 480000.00, '2025-09-30', '2024-04-07'),
('Travel to Europe', '9000-7777', 35000.00, '2024-09-30', '2024-04-07');

-- Portfolio
INSERT INTO Portfolio (Market_Value, Fee, Inception_Date, Annualised_Returns, Phone) VALUES
(0, 0, '2024-01-01', 0, '9000-7777'); -- PID = 15

-- Stock & Fund allocation
INSERT INTO StockInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (4, 15, '2024-01-01', 0.20, 'Webull'),
       (6, 15, '2024-01-01', 0.20, 'Webull');

INSERT INTO FundInPortfolio (Asset_ID, PID, Start_Date, Allocation_Ratio, Post_Trade_Company)
VALUES (11, 15, '2024-01-01', 0.35, 'Webull'),
       (14, 15, '2024-01-01', 0.25, 'Webull');

-- Invested Values (irregular intervals)
INSERT INTO InvestedValue (Date, PID, Phone, Amount) VALUES
('2024-01-01', 15, '9000-7777', 7000),
('2024-02-15', 15, '9000-7777', 9000),
('2024-05-10', 15, '9000-7777', 12000),
('2024-08-05', 15, '9000-7777', 15000),
('2024-11-20', 15, '9000-7777', 17000);

-- TransactionLog
INSERT INTO TransactionLog (DateTime, Asset_ID, PID, Type, Fee) VALUES
-- Initial purchase
('2024-01-01 15:20:00', 4, 15, 'Purchase', 50),
('2024-01-01 15:20:00', 6, 15, 'Purchase', 50),
('2024-01-01 15:20:00', 11, 15, 'Purchase', 50),
('2024-01-01 15:20:00', 14, 15, 'Purchase', 50),
-- February top-up
('2024-02-15 10:45:00', 4, 15, 'TopUp', 50),
('2024-02-15 10:45:00', 6, 15, 'TopUp', 50),
('2024-02-15 10:45:00', 11, 15, 'TopUp', 50),
('2024-02-15 10:45:00', 14, 15, 'TopUp', 50),
-- May top-up
('2024-05-10 14:30:00', 4, 15, 'TopUp', 50),
('2024-05-10 14:30:00', 6, 15, 'TopUp', 50),
('2024-05-10 14:30:00', 11, 15, 'TopUp', 50),
('2024-05-10 14:30:00', 14, 15, 'TopUp', 50),
-- August top-up
('2024-08-05 11:15:00', 4, 15, 'TopUp', 50),
('2024-08-05 11:15:00', 6, 15, 'TopUp', 50),
('2024-08-05 11:15:00', 11, 15, 'TopUp', 50),
('2024-08-05 11:15:00', 14, 15, 'TopUp', 50),
-- November top-up
('2024-11-20 13:40:00', 4, 15, 'TopUp', 50),
('2024-11-20 13:40:00', 6, 15, 'TopUp', 50),
('2024-11-20 13:40:00', 11, 15, 'TopUp', 50),
('2024-11-20 13:40:00', 14, 15, 'TopUp', 50);

-- Unrealised Gain/Loss
INSERT INTO UnrealisedGainLoss (Date, PID, Phone, Amount) VALUES
('2024-01-31', 15, '9000-7777', 220),
('2024-02-29', 15, '9000-7777', 350),
('2024-03-31', 15, '9000-7777', 480),
('2024-04-30', 15, '9000-7777', 610),
('2024-05-31', 15, '9000-7777', 740),
('2024-06-30', 15, '9000-7777', 870),
('2024-07-31', 15, '9000-7777', 1000),
('2024-08-31', 15, '9000-7777', 1130),
('2024-09-30', 15, '9000-7777', 1000),
('2024-10-31', 15, '9000-7777', 870),
('2024-11-30', 15, '9000-7777', 740),
('2024-12-31', 15, '9000-7777', 610);

-- Update Portfolio: Annualised_Returns
UPDATE Portfolio
SET Annualised_Returns = (
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 15 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    /
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 15 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
)
WHERE PID = 15;

-- Update Portfolio: Market_Value
UPDATE Portfolio
SET Market_Value = (
    (SELECT Amount
     FROM InvestedValue
     WHERE PID = 15 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
     ORDER BY Date DESC
     LIMIT 1)
    +
    (SELECT SUM(Amount)
     FROM UnrealisedGainLoss
     WHERE PID = 15 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
)
WHERE PID = 15;

-- Update Portfolio: Fee
UPDATE Portfolio
SET Fee = (
    (
        (SELECT Amount
         FROM InvestedValue
         WHERE PID = 15 AND Date BETWEEN '2024-01-01' AND '2024-12-31'
         ORDER BY Date DESC
         LIMIT 1)
        +
        (SELECT SUM(Amount)
         FROM UnrealisedGainLoss
         WHERE PID = 15 AND Date BETWEEN '2024-01-01' AND '2024-12-31')
    ) * 0.0088
)
WHERE PID = 15;