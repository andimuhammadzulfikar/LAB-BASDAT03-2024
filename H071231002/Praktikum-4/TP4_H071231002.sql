#1
SELECT customerNumber, customerName, country
FROM customers
WHERE (country = 'USA' AND creditlimit BETWEEN 50000 AND 100000)
OR (country != 'USA' AND creditlimit BETWEEN 100000 AND 200000)
ORDER BY creditlimit DESC;


#2
SELECT productCode, productName, quantityInStock, buyPrice
FROM products
WHERE quantityinstock BETWEEN 1000 AND 2000 
AND buyprice < 50 OR buyprice > 150
AND productline NOT LIKE '%Vintage%';


#3
SELECT productCode, productName, MSRP
FROM products
WHERE productline LIKE '%Classic%' AND buyprice > 50;


#4
SELECT orderNumber, orderDate, `status`, customerNumber
FROM orders
WHERE ordernumber > 10250
AND `status` != 'Shipped' AND `status` != 'Cancelled'
AND orderdate BETWEEN '2004-01-01' AND '2005-12-31';


#5
SELECT *, (0.95*priceeach*quantityordered) AS 'discountedTotalPrice'
FROM orderdetails
WHERE quantityordered > 50 AND priceeach > 100
AND productcode NOT LIKE 'S18%'
ORDER BY discountedtotalprice DESC;
