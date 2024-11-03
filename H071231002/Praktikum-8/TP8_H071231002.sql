#1
(SELECT productName, SUM(od.quantityOrdered * od.priceEach) AS 'TotalRevenue', ('Pendapatan Tertinggi') AS 'Pendapatan'
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
JOIN orders AS o
USING (orderNumber)
WHERE MONTH(o.orderDate) = 9
GROUP BY productCode
ORDER BY `TotalRevenue` DESC
LIMIT 5)

UNION

(SELECT productName, SUM(od.quantityOrdered * od.priceEach) AS 'TotalRevenue', ('Pendapatan Pendek (kayak kamu)') AS 'Pendapatan'
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
JOIN orders AS o
USING (orderNumber)
WHERE MONTH(o.orderDate) = 9
GROUP BY productCode
ORDER BY `TotalRevenue` ASC
LIMIT 5)



#2
SELECT productName 
FROM products
WHERE productCode NOT IN (
    SELECT od.productCode 
    FROM orderdetails od
    JOIN orders o ON od.orderNumber = o.orderNumber
    WHERE o.customerNumber IN (
        SELECT c.customerNumber 
        FROM customers c
        JOIN orders o ON c.customerNumber = o.customerNumber
        GROUP BY c.customerNumber
        HAVING COUNT(o.orderNumber) > 10
        
        INTERSECT
        
        SELECT c.customerNumber 
        FROM customers c
        JOIN orders o ON c.customerNumber = o.customerNumber
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        JOIN products p ON od.productCode = p.productCode
        WHERE p.buyPrice > (SELECT AVG(buyPrice) FROM products)
    )
);





#3
(SELECT customerName, pr.productLine AS 'productLine' 
FROM customers
JOIN payments AS p
USING (customernumber)
JOIN orders
USING (customerNumber)
JOIN orderdetails
USING (orderNumber)
JOIN products AS pr
USING (productCode)
GROUP BY customername
HAVING SUM(p.amount) > (SELECT 2 * AVG(amount) FROM payments))

INTERSECT

(SELECT customerName, p.productLine AS 'productLine'
FROM (SELECT c.customername, c.customerNumber, SUM(od.priceEach) AS 'totalPembelian'
		FROM customers as c
		JOIN orders AS o
		USING (customernumber)
		JOIN orderdetails AS od
		USING (ordernumber)
		GROUP BY c.customernumber
		) AS totalPemb
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE p.productline IN ('Planes', 'Trans') AND `totalPembelian` > 20000);





#4
(SELECT o.orderDate AS 'Tanggal', c.customerNumber AS 'CustomerNumber', ('Membayar Pesanan dan Memesan Barang') AS 'riwayat'
FROM orders o
JOIN customers c 
USING (customerNumber)
JOIN payments p 
ON o.orderDate = p.paymentDate
HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)

UNION

(SELECT orderDate, customerNumber, ('Memesan Barang') AS 'riwayat'
FROM orders
WHERE MONTH(orderDate) = 9 AND YEAR(orderDate) = 2003 
AND orderDate NOT IN (SELECT o.orderDate AS 'Tanggal'
								FROM orders AS o
								JOIN customers AS c 
								USING (customerNumber)
								JOIN payments AS p 
								ON o.orderDate = p.paymentDate
								HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003)
)									
						
UNION 

(SELECT paymentDate, customerNumber, ('Membayar Pesanan') AS 'riwayat'
FROM payments
WHERE MONTH(paymentDate) = 09 AND YEAR(paymentDate) = 2003
AND paymentDate NOT IN (SELECT p.paymentDate AS 'Tanggal'
									FROM orders o
									JOIN customers c USING (customerNumber)
									JOIN payments p ON o.orderDate = p.paymentDate
									HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003)
)

ORDER BY `Tanggal`;






#5
(SELECT productCode
FROM products
JOIN orderdetails AS od
USING (productCode)
WHERE od.priceEach > (SELECT AVG(od.priceEach)
								FROM orderdetails AS od
								JOIN orders AS o
								WHERE o.orderDate BETWEEN '2004-01-01' AND '2004-03-31')
AND od.quantityOrdered > 48
AND LEFT (productVendor, 1) IN ('a', 'i', 'u', 'e', 'o'))

EXCEPT

(SELECT productCode
FROM products
JOIN orderdetails
USING (productCode)
JOIN orders
USING (orderNumber)
JOIN customers AS c
USING (customerNumber)
WHERE c.country IN ('Japan', 'Germany', 'Italy'));