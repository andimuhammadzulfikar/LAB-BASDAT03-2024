#nomor 1
SELECT productcode AS 'Kode Produk', productname AS 'Nama Produk', quantityinstock AS 'Jumlah Stok' 
FROM products WHERE quantityinstock BETWEEN 5000 AND 6000;

#nomor 2
SELECT ordernumber AS 'Nomor Pesanan', orderdate AS 'Tanggal Pesanan', `status`, customernumber AS 'Nomor Pelanggan'
FROM orders WHERE `status` != 'Shipped'
ORDER BY customernumber;

#nomor 3
SELECT employeenumber AS 'Nomor Karyawan', firstName, lastName, email, jobtitle AS 'Jabatan'
FROM employees WHERE jobtitle = 'Sales Rep'
ORDER BY firstname LIMIT 10;

#nomor 4
SELECT productcode AS 'Kode Produk', productname AS 'Nama Product', productline AS 'Lini Produk', buyprice AS 'Harga Beli'
FROM products
ORDER BY buyprice DESC
LIMIT 10 OFFSET 5;
LIMIT 5,10

#nomor 5
SELECT DISTINCT country, city
FROM customers
ORDER BY country, city;