SELECT cust.customerName AS "Customer Name", CONCAT(emp.lastName, " ", emp.firstName) AS "Sales Rep"                                   
FROM customers as cust LEFT JOIN employees AS emp ON cust.salesRepEmployeeNumber = emp.employeeNumber 
ORDER BY cust.customerName;

SELECT prod.productName AS "Product Name", SUM(od.quantityOrdered) AS "Total # Ordered", (od.quantityOrdered * od.priceEach) AS `Total Sale`
FROM products AS prod left JOIN orderdetails as od ON prod.productCode = od.productCode                                                     
GROUP BY prod.productCode                                                                                                                   
ORDER BY `Total Sales` DESC;

SELECT o.`status` AS "Order Status", SUM(od.quantityOrdered) AS "# Orders"     
from orders AS o LEFT JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
GROUP BY o.`status`                                                            
ORDER BY o.`status`;  

SELECT prod.productLine AS "Product Line", SUM(od.quantityOrdered) AS `# Sold`         
FROM products AS prod 
	LEFT JOIN orderdetails AS od ON prod.productCode = od.productCode 
	LEFT JOIN orders AS o on od.orderNumber = o.orderNumber                                 
WHERE o.`status` != "Cancelled"                                                         
GROUP BY prod.productLine                                                               
ORDER BY `# Sold` DESC;

SELECT CONCAT(emp.lastName, " ", emp.firstName) AS "Sales Rep",                         
		 COUNT(cust.customerNumber) AS "# Orders",                                        
		(SELECT SUM(od.quantityOrdered * od.priceEach)                                    
			FROM customers AS c left join orders AS o ON c.customerNumber= o.customerNumber
			LEFT JOIN orderdetails AS od ON o.orderNumber = od.orderNumber                 
			WHERE c.customerNumber = cust.customerNumber) AS `Total Sales`                 
FROM employees AS emp                                                                   
	LEFT JOIN customers AS cust ON emp.employeeNumber = cust.salesRepEmployeeNumber	    
WHERE emp.jobTitle = "Sales Rep"                                                        
GROUP BY emp.employeeNumber                                                             
ORDER BY `Total Sales` DESC; 

SELECT MONTHNAME(o.orderDate) AS `Month`, YEAR(o.orderDate) AS `Year`, FORMAT(SUM(odtls.quantityOrdered * odtls.priceEach),2) AS "Payments Received"
FROM orders o
	LEFT JOIN orderdetails odtls ON o.orderNumber = odtls.orderNumber
GROUP BY `Year`,`Month`
ORDER BY YEAR(o.orderDate), MONTH(o.orderDate);                                                                                                                                                    
	                                                                                                                                                                                                                                                                                                                                                  