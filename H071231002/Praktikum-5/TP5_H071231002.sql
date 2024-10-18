#1
SELECT DISTINCT c.customerName AS 'namaKustomer', p.productName AS 'namaProduk', p.productDescription AS 'txetDescription'
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Titanic%';


#2
SELECT c.customerName, p.productName, o.`status`, o.shippedDate
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productName LIKE '%Ferrari%'
AND o.`status` = 'Shipped'
AND o.shippedDate BETWEEN '2003-10-01' AND '2004-09-31'
ORDER BY o.shippedDate DESC;


#3
SELECT s.firstName AS 'Supervisor', k.firstName AS 'Karyawan '
FROM employees AS s
JOIN employees AS k
ON s.employeeNumber = k.reportsTo
WHERE s.firstName = 'Gerard'


#4
##(a)
SELECT c.customerName, p.paymentDate, e.firstname AS 'employeeName', p.amount
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
INNER JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%'

##(b)
SELECT c.customerName, p.paymentDate, e.firstname AS 'employeeName', p.amount
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
INNER JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%'
ORDER BY p.amount DESC
LIMIT 1;


##(c)
SELECT c.customerName, p.productName
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
INNER JOIN payments AS pay
ON c.customerNumber = pay.customerNumber
WHERE c.customerNumber = 321
AND pay.paymentDate LIKE '_____11%';
