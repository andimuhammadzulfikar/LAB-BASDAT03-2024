#1
SELECT c.customerName, CONCAT(e.firstName,' ',e.lastName) AS 'salesRep', (c.creditLimit - SUM(p.amount)) AS 'remainingCredit'
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS p
USING (customerNumber)
GROUP BY c.customerName
HAVING `remainingCredit` > 0;


#2
SELECT p.productName AS 'Nama Produk', GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName) AS 'Nama Customer', COUNT(DISTINCT c.customerName) AS 'Jumlah Customer', SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
GROUP BY p.productName;


#3
SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName', COUNT(c.customerName) AS 'totalCustomers'
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY `employeeName`
ORDER BY `totalCustomers` DESC;


#4
SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'Nama Karyawan', p.productName AS 'Nama Produk', SUM(od.quantityOrdered) AS 'Jumlah Pesanan'
FROM products AS p
JOIN orderdetails AS od
USING(productcode)
JOIN orders AS o
USING(ordernumber)
JOIN customers AS c
USING(customernumber)
RIGHT JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS ofc
USING(officecode)
WHERE ofc.country = 'Australia'
GROUP BY `Nama Karyawan`, p.productName
ORDER BY `Jumlah Pesanan` DESC;


#5
SELECT c.customerName AS 'Nama Pelanggan', GROUP_CONCAT(DISTINCT p.productName) AS 'Nama Produk', COUNT(o.`status`)  AS 'Banyak Jenis Produk'
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE o.shippedDate IS NULL
GROUP BY c.customerName;