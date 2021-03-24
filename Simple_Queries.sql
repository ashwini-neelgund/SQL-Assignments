SELECT productName AS "Name", productLine AS "Product Line", buyPrice AS "Buy Price" 
FROM products 
ORDER BY buyPrice DESC;

SELECT contactFirstName AS "First Name", contactLastName AS "Last Name", city AS "City" 
FROM customers 
WHERE country="Germany" 
ORDER BY contactLastName;

SELECT status 
FROM orders 
GROUP BY STATUS 
ORDER BY status;

SELECT * 
FROM payments 
WHERE paymentDate >= "2005-01-01" 
ORDER BY paymentDate;

SELECT lastName AS "Last Name", firstName AS "First Name", email AS "Email", jobTitle AS "Job Title" 
FROM employees AS emp INNER JOIN offices AS ofc 
WHERE emp.officeCode = ofc.officeCode AND ofc.city = "San Francisco";

SELECT productName AS "Name", productLine AS "Product Line", productScale AS "Scale", productVendor AS "Vendor" 
from products 
where productLine="Classic Cars" OR productLine="Vintage Cars"
ORDER BY productLine DESC, productName;