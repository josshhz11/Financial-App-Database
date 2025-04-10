-- query 1 (works)
-- 1. Find investors who are making on average a loss across all their portfolios in 2024.
SELECT i.Phone, i.Name, AVG(ugl.Amount) AS Avg_Loss
FROM Investor i
JOIN Portfolio p ON i.Phone = p.Phone
JOIN UnrealisedGainLoss ugl ON p.PID = ugl.PID
WHERE YEAR(ugl.Date) = 2024
GROUP BY i.Phone, i.Name
HAVING AVG(ugl.Amount) < 0;

-- query 2 (works)
-- 2. Find investors who are seeing an annualized return of more than 10% from their portfolios in 2024.
SELECT DISTINCT i.Phone, i.Name
FROM Investor i
JOIN Portfolio p ON i.Phone = p.Phone
WHERE p.Annualised_Returns > 0.10;

-- query 3 (works)
-- 3. Find the monthly average unrealized gain/loss of portfolios for each month in 2024.
SELECT 
    YEAR(Date) AS Year, 
    MONTH(Date) AS Month, 
    AVG(Amount) AS Avg_Unrealized_Gain_Loss
FROM UnrealisedGainLoss
WHERE YEAR(Date) = 2024
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

-- query 4 (works)
-- 4. What is the top three most popular first financial goals for investors in 2024?
SELECT fg.Goal, COUNT(*) AS Goal_Count
FROM FinancialGoal fg
JOIN Investor i ON fg.Phone = i.Phone
WHERE YEAR(fg.Created_Date) = 2024
GROUP BY fg.Goal
ORDER BY Goal_Count DESC
LIMIT 3;

-- query 5
-- 5. Find investors who consistently top up their investment at the beginning of every month (dollar-cost
-- averaging) in 2024 for at least one of their portfolios.
SELECT I.Name, P.PID
FROM Investor I
JOIN Portfolio P ON I.Phone = P.Phone
WHERE P.PID IN (
    SELECT PID
    FROM TransactionLog
    WHERE DateTime BETWEEN '2024-01-01' AND '2024-12-31'
      AND DAY(DateTime) BETWEEN 1 AND 3
      AND Type = 'TopUp'
    GROUP BY PID
    HAVING COUNT(DISTINCT MONTH(DateTime)) = 12
);

-- query 6 (i think works)? need test again
-- 6. Find the most popular financial goals for investors working in the same company and whose age is
-- between 30 to 40 years old
SELECT i.Company, fg.Goal, COUNT(*) AS Goal_Count
FROM Investor i
JOIN FinancialGoal fg ON i.Phone = fg.Phone
WHERE TIMESTAMPDIFF(YEAR, i.DoB, CURDATE()) BETWEEN 30 AND 40
GROUP BY i.Company, fg.Goal
HAVING COUNT(*) >= 2
ORDER BY Goal_Count DESC;




-- i think this is wrong, because right now my data i dont have people of the same age range, and same company, that have the same financial goal. but its returning all the financial goals
SELECT i.Company, fg.Goal, COUNT(*) AS Goal_Count
FROM Investor i
JOIN FinancialGoal fg ON i.Phone = fg.Phone
WHERE TIMESTAMPDIFF(YEAR, i.DoB, CURDATE()) BETWEEN 30 AND 40
GROUP BY i.Company, fg.Goal
ORDER BY Goal_Count DESC;

-- query 7
-- 7. Are male investors in their 20s making more money from their investments than their female
-- counterparts in 2024?
SELECT i.Gender, AVG(ugl.Amount) AS Avg_Unrealized_Gain_Loss
FROM Investor i
JOIN Portfolio p ON i.Phone = p.Phone
JOIN UnrealisedGainLoss ugl ON p.PID = ugl.PID
WHERE YEAR(ugl.Date) = 2024 
  AND TIMESTAMPDIFF(YEAR, i.DoB, CURDATE()) BETWEEN 20 AND 29
  AND i.Gender IN ('Male', 'Female')
GROUP BY i.Gender;


-- query 8
-- 8. Get the age of all the investors
SELECT 
    Name,
    Phone,
    DoB,
    TIMESTAMPDIFF(YEAR, DoB, CURDATE()) AS Age
FROM Investor;
