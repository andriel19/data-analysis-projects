-- Query 2: Overstocked Products Analysis
-- This query identifies the top 10 most overstocked products by calculating
-- a stock-to-sales ratio (quantity in stock / total quantity sold).
-- A high ratio indicates a product is a good candidate for inventory reduction.
-- Finds the top 10 most overstocked products
SELECT
    p.productName,
    p.quantityInStock,
    SUM(od.quantityOrdered) AS totalSold,
    (p.quantityInStock / SUM(od.quantityOrdered)) AS stockToSalesRatio
FROM
    products p
JOIN
    orderdetails od ON p.productCode = od.productCode
GROUP BY
    p.productCode
ORDER BY
    stockToSalesRatio DESC
LIMIT 10;