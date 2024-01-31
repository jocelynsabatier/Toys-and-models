/* LOGISTIQUE */


SELECT  SUM(quantityOrdered) as totalSales, SUM(quantityInStock), productLine
FROM products
LEFT JOIN orderdetails ON products.productCode = orderdetails.productCode
GROUP BY productLine
ORDER BY totalSales DESC
LIMIT 5

SELECT * FROM products 