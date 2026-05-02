# ✅ DAX vs SQL Validation Report

**Project:** Bank Loan Analysis — Power BI Dashboard  
**Database:** SQL Server | Table: `dbo.Bank_loan_data`  
**SQL Tool:** SQL Server Management Studio (SSMS)  
**MTD Period:** December 2021 | **PMTD Period:** November 2021  
**Total Queries Run:** 31  
**Validation Status:** ✅ All KPIs Match — 100% Accuracy Confirmed

---

## Methodology

Every DAX measure displayed in Power BI was verified by running an equivalent SQL query in **SSMS** directly against `dbo.Bank_loan_data`.

**MoM % Verification Formula:**
```
MoM % = (MTD Value − PMTD Value) / PMTD Value × 100
```
- MTD = `WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021`
- PMTD = `WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021`

---

## Section 1 — Core KPI Validation

| # | KPI | Power BI (DAX) | SSMS (SQL) | Match? |
|---|-----|---------------|-----------|--------|
| 1 | Total Loan Applications | 38,576 | 38,576 | ✅ |
| 2 | MTD Loan Applications (Dec 2021) | 4,314 | 4,314 | ✅ |
| 3 | PMTD Loan Applications (Nov 2021) | 4,035 | 4,035 | ✅ |
| 4 | Total Funded Amount | $435,757,075 | $435,757,075 | ✅ |
| 5 | MTD Funded Amount (Dec 2021) | $53,981,425 | $53,981,425 | ✅ |
| 6 | PMTD Funded Amount (Nov 2021) | $47,754,825 | $47,754,825 | ✅ |
| 7 | Total Amount Received | $473,070,933 | $473,070,933 | ✅ |
| 8 | MTD Amount Received (Dec 2021) | $58,074,380 | $58,074,380 | ✅ |
| 9 | PMTD Amount Received (Nov 2021) | $50,132,030 | $50,132,030 | ✅ |
| 10 | Avg Interest Rate | 12.05% | 12.0488% | ✅ |
| 11 | MTD Avg Interest Rate (Dec 2021) | 12.36% | 12.3560% | ✅ |
| 12 | PMTD Avg Interest Rate (Nov 2021) | 11.94% | 11.9417% | ✅ |
| 13 | Avg DTI | 13.33% | 13.3274% | ✅ |
| 14 | MTD Avg DTI (Dec 2021) | 13.67% | 13.6655% | ✅ |
| 15 | PMTD Avg DTI (Nov 2021) | 13.30% | 13.3027% | ✅ |

**MoM % — Manually Verified from SQL:**

| KPI | MTD | PMTD | MoM % | Power BI | Match? |
|-----|-----|------|-------|----------|--------|
| Loan Applications | 4,314 | 4,035 | +6.91% | 6.9% | ✅ |
| Funded Amount | $53,981,425 | $47,754,825 | +13.04% | 13.04% | ✅ |
| Amount Received | $58,074,380 | $50,132,030 | +15.84% | 15.84% | ✅ |
| Avg Interest Rate | 12.356% | 11.942% | +3.47% | 3.5% | ✅ |
| Avg DTI | 13.666% | 13.303% | +2.73% | 2.7% | ✅ |

---

## Section 2 — Good Loan KPI Validation

> Good Loans = `loan_status IN ('Fully Paid', 'Current')`

| # | KPI | Power BI (DAX) | SSMS (SQL) | Match? |
|---|-----|---------------|-----------|--------|
| 16 | Good Loan % | 86.2% | 86.1753% | ✅ |
| 17 | Good Loan Applications | 33,243 | 33,243 | ✅ |
| 18 | Good Loan Funded Amount | $370,224,850 | $370,224,850 | ✅ |
| 19 | Good Loan Amount Received | $435,786,170 | $435,786,170 | ✅ |

---

## Section 3 — Bad Loan KPI Validation

> Bad Loans = `loan_status = 'Charged Off'`

| # | KPI | Power BI (DAX) | SSMS (SQL) | Match? |
|---|-----|---------------|-----------|--------|
| 20 | Bad Loan % | 13.8% | 13.8247% | ✅ |
| 21 | Bad Loan Applications | 5,333 | 5,333 | ✅ |
| 22 | Bad Loan Funded Amount | $65,532,225 | $65,532,225 | ✅ |
| 23 | Bad Loan Amount Received | $37,284,763 | $37,284,763 | ✅ |

---

## Section 4 — Overview Page Visual Validation

| # | Visual | SQL Query Used | Match? |
|---|--------|---------------|--------|
| 24 | Loan Status Summary Table | `GROUP BY loan_status` with COUNT, SUM, AVG | ✅ |
| 25 | MTD Loan Status Breakdown | `GROUP BY loan_status WHERE MONTH=12` | ✅ |
| 26 | Monthly Trend (Line Chart) | `GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)` | ✅ |
| 27 | By State (Filled Map) | `GROUP BY address_state ORDER BY address_state` (50 states) | ✅ |
| 28 | By Term (Donut Chart) | `GROUP BY term` — 36 months: 28,237 \| 60 months: 10,339 | ✅ |
| 29 | By Employee Length (Bar Chart) | `GROUP BY emp_length` — 11 bands including 10+ years: 8,870 | ✅ |
| 30 | By Purpose (Bar Chart) | `GROUP BY purpose` — 14 categories, Debt consolidation: 18,214 | ✅ |
| 31 | By Home Ownership (Tree Map) | `GROUP BY home_ownership` — RENT: 18,439 \| MORTGAGE: 17,198 | ✅ |

---

## Technical Notes

| # | Note |
|---|------|
| 1 | **`int_rate` and `dti` multiplied by 100** in SQL (`AVG(int_rate) * 100`) to match Power BI's percentage display format |
| 2 | **PMTD in SQL** uses `WHERE MONTH = 11` to replicate DAX `CALCULATE([MTD], DATEADD('Date'[Date], -1, MONTH))` |
| 3 | **Good Loan Funded Amount** — validated using `WHERE loan_status IN ('Fully Paid', 'Current')` |
| 4 | **Case sensitivity** — SQL Server default collation is case-insensitive, so `'Fully Paid'` matches correctly with DAX `"Fully Paid"` |
| 5 | **Date table** — Power BI DAX uses a linked Date table on `issue_date` for TOTALMTD/DATEADD functions; SQL replicates this using `MONTH()` and `YEAR()` filters |

---

## Conclusion

All **31 SQL queries** across **23 DAX measures** and **8 Overview visuals** were validated.  
Power BI DAX results match SSMS SQL outputs — confirming the dashboard is **accurate and production-ready**.

> 📋 Raw SQL values: [`SQL/results/kpi_validation_results.csv`](../SQL/results/kpi_validation_results.csv)  
> 🔍 All SQL queries: [`SQL/validation_queries.sql`](../SQL/validation_queries.sql)
