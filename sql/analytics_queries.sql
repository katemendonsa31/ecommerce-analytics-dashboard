-- Query 1: Monthly Sales Trends using a CTE (MySQL Syntax)
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(InvoiceDate, '%Y-%m') AS sales_month,
        SUM(TotalSales) AS total_revenue
    FROM sales
    GROUP BY DATE_FORMAT(InvoiceDate, '%Y-%m')
)
SELECT 
    sales_month, 
    total_revenue 
FROM MonthlySales
ORDER BY sales_month;
-- Query 2: Customer Lifetime Value (CLV) Running Total (MySQL Syntax)
SELECT 
    CustomerID,
    InvoiceDate,
    TotalSales,
    SUM(TotalSales) OVER(
        PARTITION BY CustomerID 
        ORDER BY InvoiceDate
    ) AS cumulative_spent_clv
FROM sales
WHERE CustomerID IS NOT NULL;
