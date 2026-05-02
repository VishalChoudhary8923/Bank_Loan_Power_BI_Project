# 📊 Bank Loan Portfolio — Insights & Analysis Report

**Project:** Bank Loan Analysis | Power BI Dashboard  
**Data Period:** January 2021 – December 2021  
**Dataset:** 38,576 loan applications | Source: `dbo.Bank_loan_data`  
**Tools Used:** Power BI Desktop, DAX, SQL Server (SSMS)

---

## 📋 Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Portfolio Overview](#2-portfolio-overview)
3. [Loan Quality Analysis — Good vs Bad Loans](#3-loan-quality-analysis--good-vs-bad-loans)
4. [Monthly Growth Trends](#4-monthly-growth-trends)
5. [Loan Purpose Analysis](#5-loan-purpose-analysis)
6. [Borrower Profile Analysis](#6-borrower-profile-analysis)
7. [Geographic Distribution](#7-geographic-distribution)
8. [Loan Term Analysis](#8-loan-term-analysis)
9. [Interest Rate & DTI Analysis](#9-interest-rate--dti-analysis)
10. [Risk Indicators & Red Flags](#10-risk-indicators--red-flags)
11. [Key Takeaways & Recommendations](#11-key-takeaways--recommendations)

---

## 1. Executive Summary

The bank disbursed **$435.8M** across **38,576 loan applications** in 2021, recovering **$473.1M** in total repayments — a **net positive cash position of $37.3M** over the funded amount. Portfolio health is strong with **86.2% of loans classified as Good** (Fully Paid or Current). However, **5,333 Charged Off loans totalling $65.5M** in funded capital represent a meaningful credit risk that warrants attention. The portfolio grew consistently throughout the year, with December 2021 recording the highest monthly volume (4,314 applications, MoM +6.9%).

---

## 2. Portfolio Overview

| Metric | Full Year 2021 | MTD Dec 2021 | MoM Change |
|--------|---------------|-------------|------------|
| Loan Applications | 38,576 | 4,314 | **+6.9%** |
| Total Funded Amount | $435,757,075 | $53,981,425 | **+13.04%** |
| Total Amount Received | $473,070,933 | $58,074,380 | **+15.84%** |
| Avg Interest Rate | 12.05% | 12.36% | **+3.5%** |
| Avg DTI | 13.33% | 13.67% | **+2.7%** |

**Key Observation:** Total Amount Received ($473.1M) exceeds Total Funded Amount ($435.8M) by **$37.3M**, indicating the bank is collecting more than it lent out — driven by interest income on Fully Paid and Current loans. However, the Charged Off segment has only returned $37.3M against $65.5M funded, representing a **$28.2M shortfall (43% loss rate on bad loans)**.

---

## 3. Loan Quality Analysis — Good vs Bad Loans

### Good Loans (`Fully Paid` + `Current`)

| Metric | Value |
|--------|-------|
| Good Loan % | **86.2%** |
| Good Loan Applications | 33,243 |
| Good Loan Funded Amount | $370,224,850 |
| Good Loan Amount Received | $435,786,170 |
| **Return on Funded** | **+17.7%** |

Good loans returned **$65.6M more than funded** — reflecting healthy interest income collection from performing borrowers.

### Bad Loans (`Charged Off`)

| Metric | Value |
|--------|-------|
| Bad Loan % | **13.8%** |
| Bad Loan Applications | 5,333 |
| Bad Loan Funded Amount | $65,532,225 |
| Bad Loan Amount Received | $37,284,763 |
| **Capital at Loss** | **$28,247,462 (43.1% loss rate)** |

### Loan Status Breakdown

| Loan Status | Applications | Funded Amount | Amount Received | Avg Int Rate | Avg DTI |
|-------------|-------------|--------------|----------------|-------------|---------|
| Fully Paid | 32,145 | $351,358,350 | $411,586,256 | 11.64% | 13.17% |
| Current | 1,098 | $18,866,500 | $24,199,914 | 15.10% | 14.72% |
| Charged Off | 5,333 | $65,532,225 | $37,284,763 | 13.88% | 14.00% |

**Key Observations:**

- **Current loans** carry the highest average interest rate (15.10%) and highest DTI (14.72%), suggesting these are relatively newer, higher-risk borrowers still in repayment — worth monitoring for potential default migration.
- **Charged Off loans** have a 13.88% average interest rate vs 11.64% for Fully Paid — confirming that higher interest rates correlate with higher default risk in this portfolio.
- The **43.1% capital loss rate** on Charged Off loans is significant. For every $1 lent to a defaulting borrower, the bank recovered only $0.57.

---

## 4. Monthly Growth Trends

| Month | Applications | Funded Amount | Amount Received |
|-------|-------------|--------------|----------------|
| January | 2,332 | $25,031,650 | $27,578,836 |
| February | 2,279 | $24,647,825 | $27,717,745 |
| March | 2,627 | $28,875,700 | $32,264,400 |
| April | 2,755 | $29,800,800 | $32,495,533 |
| May | 2,911 | $31,738,350 | $33,750,523 |
| June | 3,184 | $34,161,475 | $36,164,533 |
| July | 3,366 | $35,813,900 | $38,827,220 |
| August | 3,441 | $38,149,600 | $42,682,218 |
| September | 3,536 | $40,907,725 | $43,983,948 |
| October | 3,796 | $44,893,800 | $49,399,567 |
| November | 4,035 | $47,754,825 | $50,132,030 |
| December | 4,314 | $53,981,425 | $58,074,380 |

**Key Observations:**

- The portfolio shows **consistent, uninterrupted month-over-month growth** in all three metrics across the entire year — no seasonal dips.
- Applications grew from **2,332 in January to 4,314 in December — an 85% increase** over 12 months.
- Funded amount nearly **doubled** from $25.0M (January) to $54.0M (December).
- Amount received consistently **exceeds funded amount every month**, confirming interest collections are strong.
- The steepest acceleration occurred in **Q4 (Oct–Dec)**, with applications jumping from 3,796 to 4,314 — suggesting either a seasonal lending push or growing market demand.

---

## 5. Loan Purpose Analysis

| Purpose | Applications | Funded Amount | Amount Received |
|---------|-------------|--------------|----------------|
| Debt Consolidation | **18,214** | $232,459,675 | $253,801,871 |
| Credit Card | 4,998 | $58,885,175 | $65,214,084 |
| Home Improvement | 2,876 | $33,350,775 | $36,380,930 |
| Other | 3,824 | $31,155,750 | $33,289,676 |
| Major Purchase | 2,110 | $17,251,600 | $18,676,927 |
| Small Business | 1,776 | $24,123,100 | $23,814,817 |
| Wedding | 928 | $9,225,800 | $10,266,856 |
| Medical | 667 | $5,533,225 | $5,851,372 |
| Car | 1,497 | $10,223,575 | $11,324,914 |
| Moving | 559 | $3,748,125 | $3,999,899 |
| Vacation | 352 | $1,967,950 | $2,116,738 |
| House | 366 | $4,824,925 | $5,185,538 |
| Educational | 315 | $2,161,650 | $2,248,380 |
| Renewable Energy | 94 | $845,750 | $898,931 |

**Key Observations:**

- **Debt Consolidation dominates** — 47.2% of all applications (18,214) and 53.4% of total funded amount ($232.5M). This signals a significant portion of borrowers are refinancing existing debt, which could indicate financial stress in the broader customer base.
- **Small Business loans** are the only category where Amount Received ($23.8M) is slightly **below** Funded Amount ($24.1M) — a potential early indicator of stress or longer repayment cycles in this segment.
- **Credit Card refinancing** (4,998 loans, $58.9M) is the second largest category, reinforcing the theme of consumers managing high-cost revolving debt.
- **Productive asset loans** (home improvement, house, renewable energy) represent a relatively small share — the portfolio is more consumer/debt-driven than asset-building.

---

## 6. Borrower Profile Analysis

### By Employment Length

| Employment Length | Applications | Funded Amount | Amount Received |
|------------------|-------------|--------------|----------------|
| 10+ years | **8,870** | $116,115,950 | $125,871,616 |
| < 1 year | 4,575 | $44,210,625 | $47,545,011 |
| 2 years | 4,382 | $44,967,975 | $49,206,961 |
| 3 years | 4,088 | $43,937,850 | $47,551,832 |
| 1 year | 3,229 | $32,883,125 | $35,498,348 |
| 4 years | 3,428 | $37,600,375 | $40,964,850 |
| 5 years | 3,273 | $36,973,625 | $40,397,571 |
| 6 years | 2,228 | $25,612,650 | $27,908,658 |
| 7 years | 1,772 | $20,811,725 | $22,584,136 |
| 8 years | 1,476 | $17,558,950 | $19,025,777 |
| 9 years | 1,255 | $15,084,225 | $16,516,173 |

**Key Observations:**

- Borrowers with **10+ years of employment are the largest segment** (8,870 applications, $116.1M funded) — these are likely the most creditworthy and stable borrowers.
- **< 1 year employment** borrowers are the second largest group (4,575), which is notable from a risk perspective — early-career or job-switching borrowers represent meaningful exposure.
- There is a clear **inverted-U pattern**: volume peaks at 10+ years and < 1 year, with mid-tenure (6–9 years) showing lower application counts — suggesting the bank's customer base skews toward either very established or newer professionals.

### By Home Ownership

| Home Ownership | Applications | Funded Amount | Amount Received |
|---------------|-------------|--------------|----------------|
| RENT | **18,439** | $185,768,475 | $201,823,056 |
| MORTGAGE | 17,198 | $219,329,150 | $238,474,438 |
| OWN | 2,838 | $29,597,675 | $31,729,129 |
| OTHER | 98 | $1,044,975 | $1,025,257 |
| NONE | 3 | $16,800 | $19,053 |

**Key Observations:**

- **Renters (47.8%) and Mortgage holders (44.6%)** together account for 92.4% of applications — very little exposure to outright homeowners (7.4%).
- **Mortgage holders** have a higher average loan amount ($12,753 avg) vs renters ($10,076 avg) — suggesting mortgage borrowers take larger loans, possibly for debt consolidation against their home equity.
- The **OTHER category** (98 loans) shows Amount Received ($1.025M) slightly below Funded ($1.045M) — a minor concern worth monitoring.

---

## 7. Geographic Distribution

**Top 10 States by Loan Applications:**

| State | Applications | Funded Amount | Amount Received |
|-------|-------------|--------------|----------------|
| California (CA) | **6,894** | $78,484,125 | $83,901,234 |
| New York (NY) | 3,701 | $42,077,050 | $46,108,181 |
| Florida (FL) | 2,773 | $30,046,125 | $31,601,905 |
| Texas (TX) | 2,664 | $31,236,650 | $34,392,715 |
| New Jersey (NJ) | 1,822 | $21,657,475 | $23,425,159 |
| Illinois (IL) | 1,486 | $17,124,225 | $18,875,941 |
| Pennsylvania (PA) | 1,482 | $15,826,525 | $17,462,908 |
| Georgia (GA) | 1,355 | $15,480,325 | $16,728,040 |
| Virginia (VA) | 1,375 | $15,982,650 | $17,711,443 |
| Ohio (OH) | 1,188 | $12,991,375 | $14,330,148 |

**Key Observations:**

- **California alone accounts for 17.9%** of all applications (6,894) and 18.0% of funded amount ($78.5M) — heavy geographic concentration risk.
- The **top 4 states** (CA, NY, FL, TX) represent 41.7% of total applications, indicating the portfolio is concentrated in large, high-cost urban states.
- **Lowest volume states** include ME (3), NE (5), ID (6), IA (5) — near-zero presence in rural Midwestern and New England states.
- All 50 states are represented, but the distribution is heavily skewed toward coastal and Sun Belt states.

---

## 8. Loan Term Analysis

| Term | Applications | Funded Amount | Amount Received | Share |
|------|-------------|--------------|----------------|-------|
| 36 months | 28,237 | $273,041,225 | $294,709,458 | **73.2%** |
| 60 months | 10,339 | $162,715,850 | $178,361,475 | **26.8%** |

**Key Observations:**

- **73.2% of borrowers prefer 36-month (3-year) terms** — shorter repayment horizon, indicating borrowers want to clear debt faster or qualify for lower total interest.
- **60-month loans** carry a higher average funded amount ($15,737 avg) vs 36-month loans ($9,669 avg) — longer-term loans are used for larger borrowings, likely debt consolidation or home improvement.
- 60-month loans represent **37.4% of total funded amount** despite being only 26.8% of applications — they punch above their weight in capital deployed, which means credit risk on this segment is disproportionately higher.

---

## 9. Interest Rate & DTI Analysis

| Metric | Full Year | MTD Dec | PMTD Nov | MoM Change |
|--------|----------|---------|---------|-----------|
| Avg Interest Rate | 12.05% | 12.36% | 11.94% | +3.5% |
| Avg DTI | 13.33% | 13.67% | 13.30% | +2.7% |

**By Loan Status:**

| Status | Avg Int Rate | Avg DTI |
|--------|-------------|---------|
| Fully Paid | 11.64% | 13.17% |
| Current | **15.10%** | **14.72%** |
| Charged Off | 13.88% | 14.00% |

**Key Observations:**

- **A clear risk gradient exists**: Fully Paid loans (lowest risk) carry the lowest average interest rate (11.64%), while Current loans (actively repaying, unknown outcome) carry the highest (15.10%).
- **Charged Off borrowers had an avg DTI of 14.00%** vs 13.17% for Fully Paid — not a dramatic difference, suggesting DTI alone is not the sole predictor of default in this portfolio.
- **Rising MTD interest rate (+3.5% MoM)** in December 2021 suggests the bank may have been tightening lending standards or approving higher-risk borrowers at higher rates toward year-end.
- **Rising MTD DTI (+2.7% MoM)** in December 2021 indicates December borrowers were relatively more leveraged — worth watching if this trend continues into 2022.

---

## 10. Risk Indicators & Red Flags

| # | Risk Factor | Data Point | Severity |
|---|-------------|-----------|----------|
| 1 | High Charged Off capital loss | $28.2M unrecovered (43.1% loss rate) | 🔴 High |
| 2 | Geographic concentration | CA = 17.9% of portfolio | 🟡 Medium |
| 3 | Debt consolidation dominance | 47.2% of loans for debt refinancing | 🟡 Medium |
| 4 | Rising Dec DTI | MTD DTI 13.67% vs 13.30% prior month | 🟡 Medium |
| 5 | Small Business loans underperforming | Amount received < funded | 🟡 Medium |
| 6 | < 1 year employment = 2nd largest segment | 4,575 loans, $44.2M funded | 🟡 Medium |
| 7 | 60-month loans = 37.4% of capital | Longer tenor = higher default exposure | 🟡 Medium |
| 8 | Current loans at 15.10% avg rate | Highest rate = highest risk in-flight | 🟠 Watch |

---

## 11. Key Takeaways & Recommendations

### ✅ Strengths
- **Strong portfolio health** — 86.2% Good Loan rate is well above typical industry benchmarks (~75–80% for consumer lending).
- **Consistent growth** — 85% increase in monthly applications from Jan to Dec 2021 with no month showing a decline.
- **Net positive cash position** — $473.1M received vs $435.8M funded; the portfolio is generating real interest income.
- **Full validation** — All 23 KPIs match SQL ground truth, confirming data integrity.

### ⚠️ Areas to Watch
- **Charged Off recovery rate is only 57 cents on the dollar** — the bank should review underwriting standards for the segments most likely to default (higher DTI, higher interest rate bands, < 1 year employment).
- **Debt consolidation at 47% is a concentration risk** — if broader consumer financial stress increases, defaults in this segment could spike.
- **California exposure (17.9%)** — any regional economic shock would have outsized impact. Geographic diversification should be a strategic priority.
- **December uptick in both interest rates and DTI** — if this is the start of a trend, 2022 vintage loans may carry higher inherent risk.

### 💡 Analytical Next Steps
- Segment default rates by **Grade (A–E)** to quantify which credit tiers drive Charged Off volume.
- Build a **vintage analysis** (cohort by issue month) to understand if newer loans default at higher rates.
- Model **DTI × Employment Length interactions** as a combined risk score for future loan approval decisions.
- Track the **Current loan cohort (1,098 loans, $18.9M)** closely — their final status (Fully Paid vs Charged Off) will materially shift the Good/Bad ratio.

---

*Report generated from Power BI Bank Loan Dashboard | Data: January–December 2021 | All KPIs validated against SQL Server*
