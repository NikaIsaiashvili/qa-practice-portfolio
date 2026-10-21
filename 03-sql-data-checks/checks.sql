-- SQL data checks for schema-and-data.sql (SQLite).
-- Checks 1-9 and 11-12 return the rows that break a rule; an empty result means the rule holds.
-- Check 10 is a summary report, not a rule check.

-- 1. Orders whose customer does not exist (referential integrity)
SELECT o.order_id, o.customer_id
FROM orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- 2. Payments for orders that do not exist (referential integrity)
SELECT p.payment_id, p.order_id, p.amount
FROM payments p
LEFT JOIN orders o ON o.order_id = p.order_id
WHERE o.order_id IS NULL;

-- 3. Orders whose total_amount differs from the sum of their items (LEFT JOIN, GROUP BY, HAVING, aggregate)
--    LEFT JOIN + COALESCE so that an order with no items at all is also reported (its items total is 0).
SELECT o.order_id,
       o.total_amount,
       COALESCE(ROUND(SUM(i.quantity * i.unit_price), 2), 0) AS items_total
FROM orders o
LEFT JOIN order_items i ON i.order_id = o.order_id
GROUP BY o.order_id, o.total_amount
HAVING COALESCE(ROUND(SUM(i.quantity * i.unit_price), 2), 0) <> o.total_amount;

-- 4. Orders paid more than once (duplicate detection)
SELECT order_id, COUNT(*) AS payment_count, SUM(amount) AS total_paid
FROM payments
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 5a. Order statuses outside the allowed values
SELECT order_id, status
FROM orders
WHERE status NOT IN ('NEW', 'PAID', 'SHIPPED', 'CANCELLED');

-- 5b. Payment methods outside the allowed values
SELECT payment_id, method
FROM payments
WHERE method NOT IN ('CARD', 'TRANSFER');

-- 6. Items with invalid quantity or price
SELECT item_id, order_id, product, quantity, unit_price
FROM order_items
WHERE quantity < 1 OR unit_price <= 0;

-- 7. Orders dated in the future (compared with a fixed audit date so the result is repeatable)
SELECT order_id, order_date
FROM orders
WHERE order_date > '2026-10-21';

-- 8a. Customers with a missing or badly formatted email (NULL validation)
--     The LIKE pattern is a simple check: it finds a missing "@" or domain dot, but it does not reject spaces
--     or every invalid format.
SELECT customer_id, full_name, email
FROM customers
WHERE email IS NULL
   OR email NOT LIKE '%_@_%._%';

-- 8b. Email addresses used by more than one customer (duplicate detection)
SELECT email, COUNT(*) AS customers, GROUP_CONCAT(customer_id) AS customer_ids
FROM customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1;

-- 9. Orders marked PAID that have no payment
SELECT o.order_id, o.status
FROM orders o
LEFT JOIN payments p ON p.order_id = o.order_id
WHERE o.status = 'PAID' AND p.payment_id IS NULL;

-- 10. Report: orders and revenue by customer country
--     Orders with an unknown customer are excluded by the JOIN; all statuses, including CANCELLED, are counted.
SELECT c.country,
       COUNT(o.order_id) AS orders,
       ROUND(SUM(o.total_amount), 2) AS revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY revenue DESC;

-- 11. CANCELLED orders that still have a payment (possible missing refund)
SELECT o.order_id, o.status, p.payment_id, p.amount
FROM orders o
JOIN payments p ON p.order_id = o.order_id
WHERE o.status = 'CANCELLED';

-- 12. Orders where the total paid differs from the order total (JOIN, GROUP BY, HAVING)
SELECT o.order_id, o.total_amount, SUM(p.amount) AS total_paid
FROM orders o
JOIN payments p ON p.order_id = o.order_id
GROUP BY o.order_id, o.total_amount
HAVING SUM(p.amount) <> o.total_amount;
