/* FINANCES */

SELECT * FROM payments ;
/* Finances */

/*Le chiffre d'affaires des commandes des deux derniers mois par pays*/


SELECT SUM(amount) as chiffreAffaire, country , DATE_FORMAT(paymentDate, '%M %Y') as month_year
FROM payments
LEFT JOIN customers ON payments.customerNumber = customers.customerNumber
WHERE paymentDate >= (SELECT DATE_SUB(MAX(paymentDate), INTERVAL 2 MONTH)  FROM payments) 
GROUP BY country, month_year
ORDER BY month_year DESC;

/*Commandes qui n'ont pas encore été payées*/ 

SELECT customers.customerNumber, customers.customerName, orders.orderNumber, payments.paymentDate
FROM customers
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
LEFT JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE payments.paymentDate IS NULL
GROUP BY  customers.customerNumber, orders.orderNumber, payments.paymentDate;


