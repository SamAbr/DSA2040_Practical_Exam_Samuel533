-- Roll-up: Sales aggregated by country and quarter
SELECT 
    sf.Country,
    td.Quarter,
    SUM(sf.TotalSales) AS TotalSales
FROM SalesFact sf
JOIN TimeDim td 
    ON sf.InvoiceDate = td.InvoiceDate
GROUP BY sf.Country, td.Quarter
ORDER BY sf.Country, td.Quarter;

-- Drill-down: Monthly sales for UK
SELECT 
    td.Year,
    td.Month,
    SUM(sf.TotalSales) AS TotalSales
FROM SalesFact sf
JOIN TimeDim td 
    ON sf.InvoiceDate = td.InvoiceDate
WHERE sf.Country = 'United Kingdom'
GROUP BY td.Year, td.Month
ORDER BY td.Year, td.Month;

-- Slice: Sales for Electronics category
-- ==========================================
-- STEP 1: Add a new Category column to SalesFact
-- ==========================================
-- This stores the product category (e.g., Electronics, Home, Clothing)
-- Directly inside the SalesFact table for simplicity in the slice query.
ALTER TABLE SalesFact ADD COLUMN Category TEXT;

-- ==========================================
-- STEP 2: Populate Category for Electronics
-- ==========================================
-- Here we classify products as 'Electronics' based on keywords in Description.
-- Adjust the keywords to match your dataset's actual product descriptions.
UPDATE SalesFact
SET Category = 'Electronics'
WHERE Description LIKE '%Laptop%'
   OR Description LIKE '%Headphone%'
   OR Description LIKE '%Smartphone%'
   OR Description LIKE '%Camera%'
   OR Description LIKE '%TV%';

-- Optionally, you can classify other products as 'Other'
UPDATE SalesFact
SET Category = 'Other'
WHERE Category IS NULL;

-- ==========================================
-- STEP 3: Slice Query — Total Sales for Electronics
-- ==========================================
-- This retrieves the total sales amount for only Electronics category products.
SELECT 
    SUM(TotalSales) AS TotalElectronicsSales
FROM SalesFact
WHERE Category = 'Electronics';
