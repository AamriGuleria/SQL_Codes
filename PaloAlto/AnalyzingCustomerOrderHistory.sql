SELECT t.customer_id, t.first_name, t.last_name, COUNT(p.order_id) AS total_orders
FROM customers t
JOIN order_history p
ON t.customer_id = p.customer_id
WHERE p.order_date > CURRENT_DATE - INTERVAL '1 year'
GROUP BY t.customer_id, t.first_name, t.last_name;
