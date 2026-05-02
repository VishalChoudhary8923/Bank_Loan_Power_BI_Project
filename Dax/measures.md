# DAX Measures — Bank Loan Analysis

All measures belong to the `Bank_loan_data` table in Power BI.  
**Data period:** January 2021 – December 2021  
**MTD reference month:** December 2021 | **PMTD reference month:** November 2021

---

## 1. Core KPI Measures

### Total Loan Applications
```dax
Total Loan Applications = COUNT(Bank_loan_data[id])
```
**Purpose:** Total count of all loan applications in the dataset.

---

### Total Funded Amount
```dax
Total Funded Amount = SUM(Bank_loan_data[loan_amount])
```
**Purpose:** Sum of all loan amounts disbursed to borrowers.

---

### Total Amount Received
```dax
Total Amount Received = SUM(Bank_loan_data[total_payment])
```
**Purpose:** Total repayments collected from all borrowers.

---

### Avg Interest Rate
```dax
Avg Int Rate = AVERAGE(Bank_loan_data[int_rate])
```
**Purpose:** Average interest rate across the entire loan portfolio.

---

### Avg DTI
```dax
Avg DTI = AVERAGE(Bank_loan_data[dti])
```
**Purpose:** Average Debt-to-Income ratio — measures overall borrower financial health.

---

## 2. MTD Measures (Month-to-Date)

### MTD Loan Applications
```dax
MTD Loan Applications = 
TOTALMTD(COUNT(Bank_loan_data[id]), 'Date'[Date])
```

### MTD Funded Amount
```dax
MTD Funded Amount = 
TOTALMTD(SUM(Bank_loan_data[loan_amount]), 'Date'[Date])
```

### MTD Amount Received
```dax
MTD Amount Received = 
TOTALMTD(SUM(Bank_loan_data[total_payment]), 'Date'[Date])
```

### MTD Avg Int Rate
```dax
MTD Avg Int Rate = 
TOTALMTD(AVERAGE(Bank_loan_data[int_rate]), 'Date'[Date])
```

### MTD DTI
```dax
MTD DTI = 
TOTALMTD(AVERAGE(Bank_loan_data[dti]), 'Date'[Date])
```

---

## 3. MoM Measures (Month-over-Month %)

> **Formula:** MoM % = (MTD − PMTD) / PMTD  
> PMTD = Prior Month-to-Date, calculated using `DATEADD` with -1 month offset.

### MoM Loan Applications
```dax
MoM Loan Applications = 
DIVIDE(
    [MTD Loan Applications] - CALCULATE([MTD Loan Applications], DATEADD('Date'[Date], -1, MONTH)),
    CALCULATE([MTD Loan Applications], DATEADD('Date'[Date], -1, MONTH)),
    0
)
```

### MoM Funded Amount
```dax
MoM Funded Amount = 
DIVIDE(
    [MTD Funded Amount] - CALCULATE([MTD Funded Amount], DATEADD('Date'[Date], -1, MONTH)),
    CALCULATE([MTD Funded Amount], DATEADD('Date'[Date], -1, MONTH)),
    0
)
```

### MoM Amount Received
```dax
MoM Amount Received = 
DIVIDE(
    [MTD Amount Received] - CALCULATE([MTD Amount Received], DATEADD('Date'[Date], -1, MONTH)),
    CALCULATE([MTD Amount Received], DATEADD('Date'[Date], -1, MONTH)),
    0
)
```

### MoM Avg Int Rate
```dax
MoM Avg Int Rate = 
DIVIDE(
    [MTD Avg Int Rate] - CALCULATE([MTD Avg Int Rate], DATEADD('Date'[Date], -1, MONTH)),
    CALCULATE([MTD Avg Int Rate], DATEADD('Date'[Date], -1, MONTH)),
    0
)
```

### MoM Avg DTI
```dax
MoM Avg DTI = 
DIVIDE(
    [MTD DTI] - CALCULATE([MTD DTI], DATEADD('Date'[Date], -1, MONTH)),
    CALCULATE([MTD DTI], DATEADD('Date'[Date], -1, MONTH)),
    0
)
```

---

## 4. Good Loan Measures

> **Definition:** Good Loans = `loan_status` is `Fully Paid` OR `Current`

### Good Loan %
```dax
Good Loan % = 
DIVIDE(
    CALCULATE(COUNT(Bank_loan_data[id]),
        Bank_loan_data[loan_status] IN {"Fully Paid", "Current"}),
    COUNT(Bank_loan_data[id]),
    0
)
```

### Good Loan Applications
```dax
Good Loan Applications = 
CALCULATE(COUNT(Bank_loan_data[id]),
    Bank_loan_data[loan_status] IN {"Fully Paid", "Current"})
```

### Good Loan Funded Amount
```dax
Good Loan Funded Amount = 
CALCULATE(SUM(Bank_loan_data[loan_amount]),
    Bank_loan_data[loan_status] IN {"Fully Paid", "Current"})
```

### Good Loan Received Amount
```dax
Good Loan Received Amount = 
CALCULATE(SUM(Bank_loan_data[total_payment]),
    Bank_loan_data[loan_status] IN {"Fully Paid", "Current"})
```

---

## 5. Bad Loan Measures

> **Definition:** Bad Loans = `loan_status` is `Charged Off`

### Bad Loan %
```dax
Bad Loan % = 
DIVIDE(
    CALCULATE(COUNT(Bank_loan_data[id]),
        Bank_loan_data[loan_status] = "Charged Off"),
    COUNT(Bank_loan_data[id]),
    0
)
```

### Bad Loan Applications
```dax
Bad Loan Applications = 
CALCULATE(COUNT(Bank_loan_data[id]),
    Bank_loan_data[loan_status] = "Charged Off")
```

### Bad Loan Funded Amount
```dax
Bad Loan Funded Amount = 
CALCULATE(SUM(Bank_loan_data[loan_amount]),
    Bank_loan_data[loan_status] = "Charged Off")
```

### Bad Loan Received Amount
```dax
Bad Loan Received Amount = 
CALCULATE(SUM(Bank_loan_data[total_payment]),
    Bank_loan_data[loan_status] = "Charged Off")
```
