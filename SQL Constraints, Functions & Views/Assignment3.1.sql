CREATE DATABASE StoreFront; 
USE StoreFront;

CREATE TABLE Category(
Category_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Category_Name VARCHAR(50) NOT NULL
);

CREATE TABLE SubCategory(
SubCategory_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
SubCategory_Name VARCHAR(50) NOT NULL,
Category_Id INT(11) NOT NULL,
FOREIGN KEY(Category_Id) REFERENCES Category(Category_Id)
);

CREATE TABLE Product(
Product_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Product_Name VARCHAR(50) NOT NULL,
Product_Price INT(11) NOT NULL,
Product_Date Date NOT NULL,
Product_Desc VARCHAR(500) NOT NULL,
Product_Quantity INT(20) NOT NULL,
Product_Availability VARCHAR(100) NOT NULL
);

CREATE TABLE product_subcategory(
Product_Id INT(11) NOT NULL,
SubCategory_Id INT(11) NOT NULL,
CONSTRAINT FK_P_ID FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id),
CONSTRAINT FK_S_ID FOREIGN KEY (SubCategory_Id) REFERENCES subcategory(SubCategory_Id)
);

CREATE TABLE User(
User_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
User_Name VARCHAR(50) NOT NULL,
User_mail VARCHAR(100) NOT NULL,
User_Status VARCHAR(50) NOT NULL
);

CREATE TABLE Address(
Address_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Address_Details VARCHAR(100) NOT NULL,
User_Id INT(11) NOT NULL,
FOREIGN KEY(User_Id) REFERENCES User(User_Id)
);

CREATE TABLE Orders(
Order_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Order_Date Date NOT NULL,
Order_Total INT(10) NOT NULL,
User_Id INT(11) NOT NULL,
FOREIGN KEY(User_Id) REFERENCES User(User_Id)
);

CREATE TABLE Order_Items(
Item_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Order_Status VARCHAR(50) NOT NULL,
Product_Id INT(11) NOT NULL,
Order_Id INT(11) NOT NULL,
CONSTRAINT FK_O_ID FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)
);

CREATE TABLE Images(
Image_Id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Product_Id INT(11) NOT NULL
);

SHOW TABLES;

INSERT INTO Category(Category_Id, Category_Name)
VALUES(1, "Electronics"),
(2, "Clothing"),
(3, "Food"),
(4, "Beverages"),
(5, "Medicine"),
(6, "Furniture");

INSERT INTO SubCategory(SubCategory_Id, SubCategory_Name, Category_Id)
VALUES(1, "Laptops", 1),
(2, "Smart Phones", 1),
(3, "Tablets", 1),
(4, "Shirts", 2),
(5, "Pants", 2),
(6, "Footwear", 2),
(7, "Sports Wear", 2),
(8, "Vegetables", 3),
(9, "Fruits", 3),
(10, "Juice", 4),
(11, "Cold Drinks", 4);

INSERT INTO Product(Product_Id, Product_Name, Product_Price, Product_Date, Product_Desc, Product_Quantity, Product_Availability)
VALUES(1, "Dell Latitude", 60000, "2022-10-02", "Laptop from Dell", 85, "In Stock"),
(2, "Microsoft Surface Go", 580000, "2022-10-01", "Laptop from Dell", 734, "In Stock"),
(3, "Samsung Galaxy S10", 65000, "2022-10-21", "SmartPhone from Samsung", 57, "In Stock"),
(4, "IPhone 13", 80000, "2022-10-12", "SmartPhone from Apple", 34, "In Stock"),
(5, "IPad", 50000, "2022-10-11", "Tablet from Apple",31, "In Stock"),
(6, "Casual Shirt", 199, "2022-10-07", "A casual shirt with 100% cotton",122, "In Stock"),
(7, "Chinos", 190, "2022-10-02", "Stylish pants", 12, "In Stock"),
(8, "Sneakers", 4000, "2022-05-04", "Comfortable and fashionable sneakers", 54, "In Stock"),
(9, "Broccoli", 50, "2022-09-14", "Fresh Broccolies", 45, "In Stock"),
(10, "Apple", 90, "2022-06-04", "Fresh Apples from the valleys of Kashmir", 76, "In Stock"),
(11, "Apple Juice", 150, "2022-08-30", "Fresh Apple Juice", 100, "In Stock"),
(12, "Pepsi", 40, "2022-07-04", "Refreshing drink", 546, "In Stock"),
(13, "Football Cleats", 180, "2022-10-01", "Made to play", 98, "In Stock");

INSERT INTO product_subcategory(product_Id, subcategory_Id)
VALUES(1,1),
(2,1),
(2,3),
(3,2),
(4,2),
(5,3),
(6,4),
(7,5),
(8,6),
(8,7),
(9,8),
(10,9),
(11,10),
(11,11),
(12,11),
(13,6),
(13,7);

INSERT INTO USER(User_Id, User_Name, User_mail, User_Status)
VALUES(1,"Ajay", "ajay@gmail.com","Shopper"),
(2, "Aryan", "aryan@gmail.com","Admin"),
(3,"Naresh", "naresh@yahoo.com","Shopper"),
(4,"Mukul", "mukul@hotmail.com","Shopper"),
(5,"Udit", "udit@gmail.com","Shopper"),
(6,"Kriti", "kriti@gmail.com","Shopper"),
(7,"Naman", "naman@gmail.com","Shopper"),
(8,"Ankita", "anikta@gmail.com", "Shopper");

INSERT INTO ORDERS(Order_Id, Order_Date, Order_Total, User_Id)
VALUES(1, "2022-11-02", 118000, 1),
(2, "2022-11-01", 4000, 4),
(3, "2022-10-31", 54000, 3),
(4, "2022-08-21", 130, 5),
(5, "2022-08-05", 190, 6),
(6, "2022-10-09", 289, 4),
(7, "2022-10-11", 220, 8),
(8, "2022-09-11", 60040, 3),
(9, "2022-09-21", 40, 8);

INSERT INTO ORDER_items(Item_Id, Order_Status,Product_Id , Order_Id)
VALUES(1, "Shipped", 1, 1),
(2, "Shipped", 2, 1),
(3, "Cancelled", 8, 2),
(4, "Shipped", 5, 3),
(5, "Shipped", 8, 3),
(6, "Delivered", 10, 4),
(7, "Delivered", 12, 4),
(8, "Shipped", 11, 5),
(9, "Shipped", 12, 5),
(10, "Shipped", 6, 6),
(11, "Shipped", 7, 6),
(12, "Delivered", 12, 7),
(13, "Delivered", 13, 7),
(14, "Cancelled", 1, 8),
(15, "Cancelled", 12, 8),
(16, "Cancelled", 12, 9);

INSERT INTO Images(Image_Id, Product_Id)
VALUES(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4),
(7, 6),
(8, 7),
(9, 10);

SELECT p.product_Id, p.product_name, result.category_count 
FROM
product p 
JOIN (
SELECT product_Id,count(subcategory_Id) as category_count
FROM product_subcategory 
GROUP BY product_Id) AS result 
ON p.product_Id = result.product_Id AND 
result.category_count > 1;
        
SELECT "0-100" AS 'Range in Rs.', COUNT(*) AS 'Count' FROM product
WHERE Product_Price BETWEEN 0 AND 100
UNION
SELECT "101-500", COUNT(*) FROM product
WHERE Product_Price BETWEEN 101 AND 500
UNION
SELECT "Above 500", COUNT(*) FROM product
WHERE Product_Price > 500;

SELECT DISTINCT SubCategory_Id, SubCategory_Name, count(Product_Id) 
FROM product_subcategory 
JOIN SubCategory
USING(SubCategory_Id)
GROUP BY SubCategory_Id;