# Calculated Columns — Bank Loan Analysis

Calculated columns add row-level labels to the `Bank_loan_data` table.

---

## Good v Bad Loan

```dax
Good v Bad Loan = 
IF(
    Bank_loan_data[loan_status] IN {"Fully Paid", "Current"},
    "Good Loan",
    "Bad Loan"
)
```

**Purpose:** Tags every loan row as `Good Loan` or `Bad Loan` for use as a slicer and visual filter across all three dashboard pages.

**Classification logic:**

| loan_status | Classification |
|-------------|---------------|
| Fully Paid  | Good Loan ✅  |
| Current     | Good Loan ✅  |
| Charged Off | Bad Loan ❌   |

**Used in:** Summary page Good/Bad Loan KPI cards and percentage visuals.

---

## Notes

- This column is a **display/filter helper** — the Good Loan % and Bad Loan % measures filter on `loan_status` directly using `CALCULATE` for accuracy.
- Adding this as a calculated column (rather than a measure) allows it to be used as a **slicer** on the Details page.
