SELECT user.*, COUNT(user_id) AS "Order Count" FROM user
JOIN orders 
USING(user_id)
WHERE DATEDIFF(CURDATE(), order_date) <= 30
GROUP BY user_id;

SELECT user.*, SUM(Order_Total) AS "Revenue Generated" FROM orders
LEFT JOIN  user
USING(user_id)
WHERE DATEDIFF(CURDATE(), order_date) <= 30
GROUP BY user_id
ORDER BY SUM(Order_Total) DESC
LIMIT 10;

SELECT p.product_Id, product_name, product_desc, COUNT(Product_Id) AS "Count" FROM product p
JOIN order_items
USING(Product_Id)
JOIN orders
USING(Order_Id)
WHERE DATEDIFF(CURDATE(), order_date) <= 60
GROUP BY Product_Id
ORDER BY COUNT(Product_Id) DESC
LIMIT 20; 

SELECT DISTINCT date_format(order_date,'%b') AS "Month",SUM(Order_Total) AS "Revenue Generated"
FROM orders
WHERE order_date > now() - INTERVAL 6 month 
GROUP BY date_format(order_date,'%b');

UPDATE product
SET Product_Availability = "Out Of Stock"
WHERE Product_Id NOT IN (
SELECT oi.Product_Id FROM order_items oi
JOIN orders
USING(ORDER_Id)
WHERE DATEDIFF(CURDATE(), order_date) <= 90
);

SELECT * FROM product;

SELECT Product_Id, Product_Name, Product_Price, Product_Desc, SubCategory_Name FROM product p
JOIN product_subcategory ps
USING(Product_Id)
JOIN subcategory sc
USING(SubCategory_Id)
WHERE SubCategory_Name LIKE "S%";

SELECT DISTINCT oi.Product_Id,Product_Name,Product_Price,Product_Desc, COUNT(Product_Id) AS "Count" FROM product
JOIN order_items oi
USING(Product_Id)
WHERE Order_Status = "Cancelled"
GROUP BY oi.Product_Id
ORDER BY COUNT(Product_Id) DESC
LIMIT 10;