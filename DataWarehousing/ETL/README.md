# Retail Data Warehouse ETL Pipeline

## Task 2: ETL Process Implementation

This task implements a complete ETL pipeline for retail sales data, strictly following the specified requirements while incorporating practical improvements for real-world data handling.  It processes the data `retail_online.csv` from  https://archive.ics.uci.edu/dataset/352/online+retail.
     
## Pipeline Components

### 1. Extraction
- Reads CSV with proper encoding (ISO-8859-1)
- Handles data types:
  - String fields: InvoiceNo, StockCode, Description, CustomerID, Country
  - Numeric fields: Quantity, UnitPrice
  - Date field: InvoiceDate (converted to datetime)
- Preserves all original columns
- Logs extraction metrics

### 2. Transformation
**Core Operations**:
1. Calculates `TotalSales = Quantity * UnitPrice`
2. Removes invalid records:
   - Quantity ≤ 0
   - UnitPrice ≤ 0
3. Filters for last year of data (using dataset's own date range)
4. Creates dimensional tables:
   - **CustomerDim**: Aggregates by CustomerID (country, total purchases, transaction count)
   - **TimeDim**: Extracts date components (day, month, quarter, year)

**Date Handling**:
- Uses `max(InvoiceDate) - 365 days` as cutoff
- Maintains same 1-year window concept as original requirement
- More robust for real datasets with varying date ranges

#### Clarification on "Last Year" Filter Requirement

The exam instructions specify filtering sales to the last year, assuming the current date is **August 12, 2025**.  
If applied directly to the **Online Retail** dataset, which contains only transactions from **December 2010 to December 2011**, this filter would result in **zero rows** being selected.

To fulfill the spirit of the requirement while working within the dataset’s constraints, we adapted the logic to:
- Use the **latest available transaction date in the dataset** as the reference “current” date.
- Subtract 365 days from this to define the cutoff for “last year.”

This approach keeps the requirement’s intent (most recent year of data) but ensures meaningful output for fact and dimension tables during the exam demonstration.


### 3. Loading
**Database Schema**:
```sql
CREATE TABLE CustomerDim (
    CustomerID TEXT PRIMARY KEY,
    Country TEXT,
    TotalPurchases REAL,
    TransactionCount INTEGER
);

CREATE TABLE TimeDim (
    DateKey TEXT PRIMARY KEY,
    Date DATE,
    Day INTEGER,
    Month INTEGER,
    Quarter INTEGER,
    Year INTEGER
);

CREATE TABLE SalesFact (
    InvoiceNo TEXT,
    StockCode TEXT,
    Description TEXT,
    Quantity REAL,
    UnitPrice REAL,
    TotalSales REAL,
    CustomerID TEXT,
    InvoiceDate DATETIME,
    DateKey TEXT,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDim(CustomerID),
    FOREIGN KEY (DateKey) REFERENCES TimeDim(DateKey)
);
