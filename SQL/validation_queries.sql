-- ============================================================
-- Bank Loan Analysis — SQL Validation Queries
-- Database: SQL Server (SSMS) | Table: dbo.Bank_loan_data
-- Purpose: Validate all Power BI DAX measures against raw SQL
-- ============================================================


-- ============================================================
-- PREVIEW DATA
-- ============================================================
SELECT TOP 5 * FROM dbo.Bank_loan_data;


-- ============================================================
-- 1. TOTAL LOAN APPLICATIONS
--    DAX: Total Loan Applications = COUNT(Bank_loan_data[id])
-- ============================================================
SELECT COUNT(id) AS Total_loan_Application 
FROM dbo.Bank_loan_data;


-- ============================================================
-- 2. MTD LOAN APPLICATIONS  (December 2021)
--    DAX: MTD Loan Applications = TOTALMTD(COUNT([id]), 'Date'[Date])
-- ============================================================
SELECT COUNT(id) AS MTD_Total_Loan_Applications 
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;


-- ============================================================
-- 3. PMTD LOAN APPLICATIONS  (November 2021)
--    Used to compute MoM % in DAX: MoM = DIVIDE([MTD] - [PMTD], [PMTD])
-- ============================================================
SELECT COUNT(id) AS PMTD_Total_Loan_Applications 
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- ============================================================
-- 4. TOTAL FUNDED AMOUNT
--    DAX: Total Funded Amount = SUM(Bank_loan_data[loan_amount])
-- ============================================================
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM dbo.Bank_loan_data;


-- ============================================================
-- 5. MTD TOTAL FUNDED AMOUNT  (December)
--    DAX: MTD Funded Amount = TOTALMTD(SUM([loan_amount]), 'Date'[Date])
-- ============================================================
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 12;


-- ============================================================
-- 6. PMTD TOTAL FUNDED AMOUNT  (November)
-- ============================================================
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 11;


-- ============================================================
-- 7. TOTAL AMOUNT RECEIVED
--    DAX: Total Amount Received = SUM(Bank_loan_data[total_payment])
-- ============================================================
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM dbo.Bank_loan_data;


-- ============================================================
-- 8. MTD TOTAL AMOUNT RECEIVED  (December)
--    DAX: MTD Amount Received = TOTALMTD(SUM([total_payment]), 'Date'[Date])
-- ============================================================
SELECT SUM(total_payment) AS MTD_Total_Amount_Collected
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 12;


-- ============================================================
-- 9. PMTD TOTAL AMOUNT RECEIVED  (November)
-- ============================================================
SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 11;


-- ============================================================
-- 10. AVERAGE INTEREST RATE
--     DAX: Avg Int Rate = AVERAGE(Bank_loan_data[int_rate])
--     Note: Multiplied by 100 in SQL to match % display in Power BI
-- ============================================================
SELECT AVG(int_rate) * 100 AS Average_Interest_Rate
FROM dbo.Bank_loan_data;


-- ============================================================
-- 11. MTD AVERAGE INTEREST RATE  (December)
-- ============================================================
SELECT AVG(int_rate) * 100 AS MTD_Average_Interest_Rate
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 12;


-- ============================================================
-- 12. PMTD AVERAGE INTEREST RATE  (November)
-- ============================================================
SELECT AVG(int_rate) * 100 AS PMTD_Average_Interest_Rate
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 11;


-- ============================================================
-- 13. AVERAGE DTI  (Debt-to-Income Ratio)
--     DAX: Avg DTI = AVERAGE(Bank_loan_data[dti])
-- ============================================================
SELECT AVG(dti) * 100 AS AVG_DTI 
FROM dbo.Bank_loan_data;


-- ============================================================
-- 14. MTD AVERAGE DTI  (December)
-- ============================================================
SELECT AVG(dti) * 100 AS MTD_AVG_DTI 
FROM dbo.Bank_loan_data 
WHERE MONTH(issue_date) = 12;


-- ============================================================
-- 15. PMTD AVERAGE DTI  (November)
-- ============================================================
SELECT AVG(dti) * 100 AS PMTD_AVG_DTI 
FROM dbo.Bank_loan_data 
WHERE MONTH(issue_date) = 11;


-- ============================================================
-- 16. GOOD LOAN PERCENTAGE
--     DAX: Good Loan % = DIVIDE(CALCULATE(COUNT([id]),
--          loan_status IN {"Fully Paid","Current"}), COUNT([id]))
-- ============================================================
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid'
               OR loan_status = 'Current' THEN id END) * 100.0) / COUNT(id) 
    AS Good_Loan_Percentage
FROM dbo.Bank_loan_data;


-- ============================================================
-- 17. GOOD LOAN APPLICATIONS
-- ============================================================
SELECT COUNT(CASE WHEN loan_status = 'Fully Paid' 
                   OR loan_status = 'Current' THEN id END) 
    AS Good_Loan_Applications
FROM dbo.Bank_loan_data;


-- ============================================================
-- 18. GOOD LOAN FUNDED AMOUNT
-- ============================================================
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM dbo.Bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- ============================================================
-- 19. GOOD LOAN AMOUNT RECEIVED
-- ============================================================
SELECT SUM(total_payment) AS Good_Loan_Amount_Received
FROM dbo.Bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- ============================================================
-- 20. BAD LOAN PERCENTAGE
--     DAX: Bad Loan % = DIVIDE(CALCULATE(COUNT([id]),
--          loan_status = "Charged Off"), COUNT([id]))
-- ============================================================
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0 / COUNT(id)) 
    AS Bad_Loan_Percentage
FROM dbo.Bank_loan_data;


-- ============================================================
-- 21. BAD LOAN APPLICATIONS
-- ============================================================
SELECT COUNT(id) AS Bad_Loan_Applications 
FROM dbo.Bank_loan_data
WHERE loan_status = 'Charged Off';


-- ============================================================
-- 22. BAD LOAN FUNDED AMOUNT
-- ============================================================
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount 
FROM dbo.Bank_loan_data 
WHERE loan_status = 'Charged Off';


-- ============================================================
-- 23. BAD LOAN AMOUNT RECEIVED
-- ============================================================
SELECT SUM(total_payment) AS Bad_Loan_Amount_Received
FROM dbo.Bank_loan_data 
WHERE loan_status = 'Charged Off';


-- ============================================================
-- 24. LOAN STATUS SUMMARY
--     Validates the loan status breakdown table on Overview page
-- ============================================================
SELECT 
    loan_status,
    COUNT(id)            AS Loan_Count,
    SUM(total_payment)   AS Total_Amount_Received,
    SUM(loan_amount)     AS Total_Funded_Amount,
    AVG(int_rate * 100)  AS Interest_Rate,
    AVG(dti * 100)       AS DTI
FROM dbo.Bank_loan_data
GROUP BY loan_status;


-- ============================================================
-- 25. MTD LOAN STATUS BREAKDOWN  (December)
-- ============================================================
SELECT 
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount)   AS MTD_Total_Funded_Amount
FROM dbo.Bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;


-- ============================================================
-- 26. MONTHLY TREND  (Overview Page line/bar chart)
-- ============================================================
SELECT 
    MONTH(issue_date)           AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(id)                   AS Total_Loan_Application,
    SUM(loan_amount)            AS Total_Funded_Amount,
    SUM(total_payment)          AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);


-- ============================================================
-- 27. BY STATE  (Filled map visual)
-- ============================================================
SELECT 
    address_state,
    COUNT(id)          AS Total_Loan_Application,
    SUM(loan_amount)   AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM dbo.Bank_loan_data
GROUP BY address_state
ORDER BY address_state;


-- ============================================================
-- 28. BY TERM  (Donut chart)
-- ============================================================
SELECT
    term,
    COUNT(id)          AS Total_Loan_Application,
    SUM(loan_amount)   AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM dbo.Bank_loan_data
GROUP BY term
ORDER BY term;


-- ============================================================
-- 29. BY EMPLOYEE LENGTH  (Bar chart)
-- ============================================================
SELECT 
    emp_length,
    COUNT(id)          AS Total_Loan_Application,
    SUM(loan_amount)   AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM dbo.Bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;


-- ============================================================
-- 30. BY PURPOSE  (Bar chart)
-- ============================================================
SELECT 
    purpose,
    COUNT(id)          AS Total_Loan_Application,
    SUM(loan_amount)   AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM dbo.Bank_loan_data
GROUP BY purpose
ORDER BY purpose;


-- ============================================================
-- 31. BY HOME OWNERSHIP  (Tree map)
-- ============================================================
SELECT 
    home_ownership,
    COUNT(id)          AS Total_Loan_Application,
    SUM(loan_amount)   AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM dbo.Bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;
