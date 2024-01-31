/* VENTES */

/* Le nombre de produits vendus par catégorie et par mois */


SELECT productLine, SUM(quantityOrdered) as quantityTotale , MONTH(orderDate) as mois, YEAR(orderDate) as annee
FROM products
LEFT JOIN orderdetails ON products.productCode = orderdetails.productCode
LEFT JOIN orders on orderdetails.orderNumber = orders.orderNumber
GROUP BY productLine, mois, annee
ORDER BY productLine, mois, annee ASC;


