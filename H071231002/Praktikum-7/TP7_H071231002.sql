#1
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice)
						FROM products);
						

#2
SELECT orderNumber, orderDate
FROM orders
WHERE customerNumber IN (SELECT customerNumber
							    FROM customers AS c
							    JOIN employees AS e 
								 ON c.salesRepEmployeeNumber = e.employeeNumber
							    JOIN offices AS ofc 
								 USING (officeCode)
							    WHERE ofc.city = 'Tokyo');


#3
SELECT c.customerName, o.orderNumber, o.shippedDate, o.requiredDate, GROUP_CONCAT(p.productName) AS 'products', SUM(od.quantityOrdered) total_quantity_ordered, CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName'
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (ordernumber)
JOIN products AS p
USING (productCode)
JOIN employees AS e
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE shippedDate = (SELECT shippedDate
							FROM orders
							WHERE shippedDate > requiredDate )
GROUP BY c.customerName;


#4
SELECT p.productName, p.productLine, SUM(od.quantityOrdered) AS 'total_quantity_ordered'
FROM products AS p
JOIN orderdetails AS od 
USING(productCode)
WHERE p.productLine IN (
    SELECT productLine
    FROM products AS p2
    JOIN orderdetails AS od2 
	 USING (productCode)
    GROUP BY p2.productLine
    HAVING SUM(od2.quantityOrdered) >= (
        SELECT MIN(total_quantity)
        FROM (
            SELECT SUM(od3.quantityOrdered) AS total_quantity
            FROM products p3
            JOIN orderdetails od3 USING (productCode)
            GROUP BY p3.productLine
            ORDER BY total_quantity DESC
            LIMIT 3
        ) AS top3
    )
)
GROUP BY p.productName, p.productLine
ORDER BY p.productLine, `total_quantity_ordered` DESC;