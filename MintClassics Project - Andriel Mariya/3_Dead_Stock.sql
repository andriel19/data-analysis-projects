-- Query 3: Dead Stock Analysis
-- This query identifies products that have never been sold by finding
-- items in the products table that have no corresponding entry in the orderdetails table.
-- These "dead stock" items are prime candidates for liquidation.
SELECT
    p.productName,
    p.productLine,
    p.quantityInStock
FROM
    products p
LEFT JOIN
    orderdetails od ON p.productCode = od.productCode
WHERE
    od.orderNumber IS NULL
ORDER BY
    p.quantityInStock DESC;