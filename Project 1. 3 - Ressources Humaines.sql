/* Ressources Humaines */

SELECT * FROM employees;


SELECT  lastName, firstName, jobTitle, paymentDate, SUM(amount), DATE_FORMAT(paymentDate, '%M %Y') as month_year
FROM employees
LEFT JOIN customers ON employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE jobTitle LIKE '%Sales Rep%'
GROUP BY employeeNumber, lastName, firstName, jobTitle, salesRepEmployeeNumber, paymentDate, month_year
ORDER BY paymentDate


SELECT employeeNumber, lastName, firstName, jobTitle, salesRepEmployeeNumber, SUM(amount), YEAR(paymentDate) as annee
FROM employees
LEFT JOIN customers ON employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE YEAR(paymentDate) = 2023
GROUP BY employeeNumber, lastName, firstName, jobTitle, salesRepEmployeeNumber, annee
ORDER BY SUM(amount) DESC, salesRepEmployeeNumber DESC
LIMIT 2


SELECT DATE_SUB(MAX(paymentDate), INTERVAL 3 MONTH)  FROM payments


SELECT * FROM customers