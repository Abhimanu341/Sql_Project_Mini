/* A) 30‑day sales snapshot */
/* A) 30‑day sales snapshot */
SELECT DATE(order_date) AS day,
       COUNT(*)         AS orders,
       SUM(quantity)    AS units,
       SUM(quantity*unit_price) AS revenue
FROM orders o
JOIN order_items i USING (order_id)
WHERE order_date >= CURRENT_DATE - 30
GROUP BY DATE(order_date);


/* B) Best‑selling category this month */
SELECT c.category_name,
       SUM(i.quantity) AS units_sold
FROM order_items i
JOIN products p   USING(product_id)
JOIN categories c USING(category_id)
JOIN orders    o  USING(order_id)
WHERE DATE_TRUNC('month',order_date)=DATE_TRUNC('month',CURRENT_DATE)
GROUP BY c.category_name
ORDER BY units_sold DESC
LIMIT 1;

/* C) Customers who spent ≥ ₹5 000 total */
SELECT customer_id,
       SUM(quantity*unit_price) AS spend
FROM orders o
JOIN order_items i USING(order_id)
GROUP BY customer_id
HAVING SUM(quantity*unit_price) >= 5000;

/* D) View with simple profit calc */
CREATE OR REPLACE VIEW v_profit AS
SELECT p.product_id,
       SUM(i.quantity*unit_price) - SUM(i.quantity*unit_cost) AS profit
FROM products p
JOIN order_items i USING(product_id)
GROUP BY p.product_id;

/* E) Customers who purchased at least one item from every category */
SELECT o.customer_id
FROM   orders o
JOIN   order_items i USING (order_id)
JOIN   products     p USING (product_id)
GROUP  BY o.customer_id
HAVING COUNT(DISTINCT p.category_id) = (SELECT COUNT(*) FROM categories);

/* F) Products with zero sales */
SELECT p.product_id,
       p.product_name
FROM   products p
LEFT   JOIN order_items i ON i.product_id = p.product_id
WHERE  i.order_item_id IS NULL;


