USE Banking;
-- 1. For each product, show the product name "Product" and the product type name "Type".
SELECT NAME AS "Product", PRODUCT_TYPE_CD AS "Type"
FROM PRODUCT;

-- 2. For each branch, list the branch name and city, plus last name and title of each employee who works in that branch.
SELECT NAME AS "Branch Name", CITY AS "City", LAST_NAME AS `Employee Last Name`, TITLE AS "Employee Title"
FROM BRANCH AS b
LEFT JOIN EMPLOYEE e ON b.BRANCH_ID = e.ASSIGNED_BRANCH_ID
GROUP BY e.EMP_ID
ORDER BY b.NAME, e.LAST_NAME;

-- 3. Show a list of each unique employee title.
SELECT DISTINCT(TITLE)
FROM EMPLOYEE;

-- 4. Show the last name and title of each employee, along with the last name and title of that employee's boss.
SELECT emp.LAST_NAME AS "Employee
LAST Name", emp.TITLE AS "Employee Title", boss.LAST_NAME AS "Boss LAST Name", boss.TITLE AS "Boss Title"
FROM EMPLOYEE emp LEFT JOIN EMPLOYEE boss ON emp.SUPERIOR_EMP_ID = boss.EMP_ID;

-- 5. For each account, show the name of the account's product, the available balance, and the customer's last name.
SELECT prod.NAME AS "Product Name", acc.AVAIL_BALANCE AS "Available Balance", iCust.LAST_NAME AS "Customer
LAST Name"
FROM ACCOUNT AS acc 
	LEFT JOIN PRODUCT AS prod ON acc.PRODUCT_CD = prod.PRODUCT_CD
	LEFT JOIN CUSTOMER AS cust ON acc.CUST_ID = cust.CUST_ID	
	 INNER JOIN INDIVIDUAL AS iCust ON iCust.CUST_ID = cust.CUST_ID;

-- 6. List all account transaction details for individual customers whose last name starts with 'T'.
SELECT tran.TXN_ID,tran.AMOUNT,tran.FUNDS_AVAIL_DATE,tran.TXN_DATE,tran.TXN_TYPE_CD,tran.ACCOUNT_ID,tran.EXECUTION_BRANCH_ID,
			tran.TELLER_EMP_ID, iCust.LAST_NAME AS "Custmore LAST Name"
FROM ACC_TRANSACTION AS tran
LEFT JOIN ACCOUNT AS acc ON tran.ACCOUNT_ID = acc.ACCOUNT_ID
LEFT JOIN INDIVIDUAL iCust ON acc.CUST_ID = iCust.CUST_ID
WHERE iCust.LAST_NAME LIKE 'T%';