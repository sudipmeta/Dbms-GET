USE storeFront;

CREATE VIEW order_info AS
SELECT product_id, product_name, product_price, user_name, user_mail, order_date, order_status
FROM order_items
JOIN product
USING(product_Id)
JOIN orders
USING(order_id)
JOIN user
USING(user_Id)
WHERE DATEDIFF(CURDATE(), order_date) <= 60
GROUP BY order_date;

SELECT * FROM order_info;

SELECT product_id, product_name, product_price, order_date, order_status FROM order_info
WHERE order_status = "Shipped";

SELECT product_id, product_name, COUNT(product_id) AS count FROM order_info
GROUP BY product_id
ORDER BY count DESC
LIMIT 5;