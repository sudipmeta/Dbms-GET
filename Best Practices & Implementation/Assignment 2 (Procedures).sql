-- Assignment 2

DELIMITER $$

-- Create a Stored procedure to retrieve average sales of each product in a month. Month and year will be input parameter to function

CREATE PROCEDURE avgSale(Month VARCHAR(3), y INT)
BEGIN
SELECT oi.Product_Id, Product_name, COUNT(oi.Product_Id)/30 FROM order_items oi
JOIN product
USING(Product_Id)
JOIN orders
USING(Order_Id)
WHERE date_format(order_date,'%b') = MONTH AND YEAR(Order_date) = y
GROUP BY oi.Product_Id;
END$$

DELIMITER ;

-- Calling avgSale Procedure

CALL avgSale("Nov",2022);

DELIMITER $$

-- Create a stored procedure to retrieve table having order detail with status for a given period. Start date and end date will be input parameter. Put validation on input dates like start date is less than end date. If start date is greater than end date take first date of month as start date.

CREATE PROCEDURE orderInDate(start_date DATE, end_date DATE)
BEGIN

IF start_date > end_date THEN
SELECT oi.Product_Id, Product_name, order_status FROM order_items oi
JOIN product p
USING(Product_Id)
JOIN orders o
USING(Order_Id)
WHERE o.order_Date BETWEEN start_date-DAY(start_date)+1 AND end_date;

ELSE 
SELECT oi.Product_Id, Product_name, order_status FROM order_items oi
JOIN product p
USING(Product_Id)
JOIN orders o
USING(Order_Id)
WHERE o.order_Date BETWEEN start_date AND end_date;

END IF;

END$$

DELIMITER ;

-- Calling orderInDate Procedure

CALL orderInDate("2022-10-22","2022-10-21");