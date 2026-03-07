-- SQL Queries for QA - OpenCart Database Validation
-- Author: Luis Elizondo

-- 1. VERIFY USER REGISTRATION
SELECT customer_id, firstname, lastname, email, status, date_added
FROM oc_customer
WHERE email = 'testuser@example.com';

-- 2. VERIFY USER STATUS IS ACTIVE
SELECT email, status,
CASE WHEN status = 1 THEN 'Active' ELSE 'Inactive' END AS account_status
FROM oc_customer
WHERE email = 'testuser@example.com';

-- 3. CHECK ORDER EXISTS AFTER CHECKOUT
SELECT o.order_id, o.firstname, o.email, o.total, os.name AS order_status, o.date_added
FROM oc_order o
JOIN oc_order_status os ON o.order_status_id = os.order_status_id
WHERE o.email = 'testuser@example.com'
ORDER BY o.date_added DESC LIMIT 5;

-- 4. VALIDATE ORDER TOTAL MATCHES SUM OF PRODUCTS
SELECT op.order_id,
SUM(op.price * op.quantity) AS calculated_total,
o.total AS stored_total,
(o.total - SUM(op.price * op.quantity)) AS difference
FROM oc_order_product op
JOIN oc_order o ON op.order_id = o.order_id
WHERE op.order_id = 1
GROUP BY op.order_id, o.total;

-- 5. CHECK PRODUCT INVENTORY IS NOT NEGATIVE
SELECT product_id, model, quantity, status
FROM oc_product
WHERE quantity < 0;

-- 6. LIST ALL PRODUCTS WITH ZERO STOCK
SELECT p.product_id, pd.name, p.quantity, p.status
FROM oc_product p
JOIN oc_product_description pd ON p.product_id = pd.product_id
WHERE p.quantity = 0 AND pd.language_id = 1
ORDER BY pd.name;

-- 7. VERIFY PRODUCT PRICES ARE CONSISTENT
SELECT p.product_id, pd.name, p.price
FROM oc_product p
JOIN oc_product_description pd ON p.product_id = pd.product_id
WHERE (p.price = 0 OR p.price IS NULL)
AND p.status = 1 AND pd.language_id = 1;

-- 8. COUNT ORDERS BY STATUS
SELECT os.name AS status_name, COUNT(o.order_id) AS order_count
FROM oc_order o
JOIN oc_order_status os ON o.order_status_id = os.order_status_id
GROUP BY os.name
ORDER BY order_count DESC;

-- 9. FIND DUPLICATE EMAIL REGISTRATIONS
SELECT email, COUNT(*) AS occurrences
FROM oc_customer
GROUP BY email
HAVING COUNT(*) > 1;

-- 10. VERIFY RECENTLY ADDED USERS
SELECT customer_id, firstname, lastname, email, date_added
FROM oc_customer
WHERE date_added >= NOW() - INTERVAL 24 HOUR
ORDER BY date_added DESC;