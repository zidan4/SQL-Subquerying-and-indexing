-- Indexes for performance
CREATE INDEX idx_orders_user_date ON orders(user_id, order_date);

-- Active users in last 30 days
SELECT u.username, COUNT(o.order_id) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY u.user_id
HAVING COUNT(o.order_id) > 2;
