-- Query 1: Warehouse Inventory Analysis
-- This query calculates the total number of items in each warehouse
-- to identify the most underutilized facility.
SELECT * FROM mintclassics.warehouses;
USE mintclassics;
SELECT * FROM warehouses;
SELECT
    w.warehouseName,
    SUM(p.quantityInStock) AS totalItems
FROM
    products p
JOIN
    warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY
    w.warehouseName
ORDER BY
    totalItems DESC;