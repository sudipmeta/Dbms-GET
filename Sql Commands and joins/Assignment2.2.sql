-- 1. Insert sample data in StoreFront tables by using SQL files.
insert into category(CategoryName) values("Electronics");
insert into category(CategoryName) values("Grocary");
insert into category(CategoryName) values("Body Care");

insert into SubCategory(SubCategoryName, CategoryID) values("Smart Phones", 1);
insert into SubCategory(SubCategoryName, CategoryID) values("Laptops", 1);
insert into SubCategory(SubCategoryName, CategoryID) values("Biscuits", 2);
insert into SubCategory(SubCategoryName, CategoryID) values("Chips", 2);
insert into SubCategory(SubCategoryName, CategoryID) values("Shampoos", 3);
insert into SubCategory(SubCategoryName, CategoryID) values("Deodrants", 3);

insert into Products(ProductName, Brand, Price, CategoryID) values("IPhone 11", "Apple", 30000, 1);
insert into Products(ProductName, Brand, Price, CategoryID) values("IPhone 14 Pro Max", "Apple", 140000, 1);
insert into Products(ProductName, Brand, Price, CategoryID) values("S22", "Samsung", 110000, 1);
insert into Products(ProductName, Brand, Price, CategoryID) values("Legion 5", "Lenovo", 80000, 1);
insert into Products(ProductName, Brand, Price, CategoryID) values("IdeaPad L340", "Lenovo", 60000, 1);
insert into Products(ProductName, Brand, Price, CategoryID) values("Black burbon", "Parle", 35, 2);
insert into Products(ProductName, Brand, Price, CategoryID) values("Parle-G", "Parle", 5, 2);
insert into Products(ProductName, Brand, Price, CategoryID) values("Classic Salted", "Lays", 10, 2);
insert into Products(ProductName, Brand, Price, CategoryID) values("Cream n Onion", "Lays", 10, 2);
insert into Products(ProductName, Brand, Price, CategoryID) values("Anti Dandruff", "Head n Shoulders", 35,1);
insert into Products(ProductName, Brand, Price, CategoryID) values("Hair Repair", "Dove", 40,2);
insert into Products(ProductName, Brand, Price, CategoryID) values("Calibar", "Danver", 20,1);
insert into Products(ProductName, Brand, Price, CategoryID) values("Imperial", "Fogg", 15,2);

insert into linkingTable(SubCategoryID, ProductID) values(1, 1);
insert into linkingTable(SubCategoryID, ProductID) values(1, 2);
insert into linkingTable(SubCategoryID, ProductID) values(1, 3);
insert into linkingTable(SubCategoryID, ProductID) values(2, 4);
insert into linkingTable(SubCategoryID, ProductID) values(2, 5);
insert into linkingTable(SubCategoryID, ProductID) values(3, 6);
insert into linkingTable(SubCategoryID, ProductID) values(3, 7);
insert into linkingTable(SubCategoryID, ProductID) values(4, 8);
insert into linkingTable(SubCategoryID, ProductID) values(4, 9);
insert into linkingTable(SubCategoryID, ProductID) values(7, 10);
insert into linkingTable(SubCategoryID, ProductID) values(7, 11);
insert into linkingTable(SubCategoryID, ProductID) values(8, 12);
insert into linkingTable(SubCategoryID, ProductID) values(8, 13);

insert into User(UserName, UserType) values("Partha", "Shopper");
insert into User(UserName, UserType) values("Sudip", "Shopper");
insert into User(UserName, UserType) values("Alin", "Admin");

insert into ShippingAddresses(ShippingAddress, UserID) values("Jaipur", 1);
insert into ShippingAddresses(ShippingAddress, UserID) values("Udaipur", 1);
insert into ShippingAddresses(ShippingAddress, UserID) values("Mumbai", 2);

insert into Orders(UserID, OrderDate, AddressID) values(1, "2022-09-01", 2);
insert into Orders(UserID, OrderDate, AddressID) values(1, "2022-10-01", 1);
insert into Orders(UserID, OrderDate, AddressID) values(2, "2022-09-20", 3);
insert into Orders(UserID, OrderDate, AddressID) values(2, "2022-10-20", 3);

insert into images(ProductID, imageURL) values(1, "image");
insert into images(ProductID, imageURL) values(2, NULL);
insert into images(ProductID, imageURL) values(3, "image");
insert into images(ProductID, imageURL) values(4, NULL);
insert into images(ProductID, imageURL) values(5, NULL);
insert into images(ProductID, imageURL) values(6, "image");
insert into images(ProductID, imageURL) values(7, "image");
insert into images(ProductID, imageURL) values(8, NULL);
insert into images(ProductID, imageURL) values(9, "image");

insert into Inventory(ProductID, Quantity) values(1, 10);
insert into Inventory(ProductID, Quantity) values(2, 20);
insert into Inventory(ProductID, Quantity) values(3, 30);
insert into Inventory(ProductID, Quantity) values(4, 44);
insert into Inventory(ProductID, Quantity) values(5, 0);
insert into Inventory(ProductID, Quantity) values(6, 1);
insert into Inventory(ProductID, Quantity) values(7, 77);
insert into Inventory(ProductID, Quantity) values(8, 2);
insert into Inventory(ProductID, Quantity) values(9, 0);

insert into orderItems(ProductID, orderID, orderStatus) values(1, 1, "Shipped");
insert into orderItems(ProductID, orderID, orderStatus) values(2, 1, "Shipped");
insert into orderItems(ProductID, orderID, orderStatus) values(3, 1, "Deliverd");
insert into orderItems(ProductID, orderID, orderStatus) values(4, 1, "Cancalled");
insert into orderItems(ProductID, orderID, orderStatus) values(5, 2, "Cancalled");
insert into orderItems(ProductID, orderID, orderStatus) values(7, 2, "Delivered");

alter table orderitems add Product_Name varchar(255);
update orderitems set Product_Name = (select productname from products where productid = 1) where ProductID = 1;
update orderitems set Product_Name = (select productname from products where productid = 2) where ProductID = 2;
update orderitems set Product_Name = (select productname from products where productid = 3) where ProductID = 3;
update orderitems set Product_Name = (select productname from products where productid = 4) where ProductID = 4;
update orderitems set Product_Name = (select productname from products where productid = 5) where ProductID = 5;
update orderitems set Product_Name = (select productname from products where productid = 7) where ProductID = 7;
-- update orderitems set Product_Name = ( select productname from products where orderitems.productid=products.productid ) 
-- where exists ( select 1 from orderitems where orderitems.productid=products.productid );

alter table orderitems add Price int;
update orderitems set Price = (select Price from products where productid = 1) where ProductID = 1;
update orderitems set Price = (select Price from products where productid = 2) where ProductID = 2;
update orderitems set Price = (select Price from products where productid = 3) where ProductID = 3;
update orderitems set Price = (select Price from products where productid = 4) where ProductID = 4;
update orderitems set Price = (select Price from products where productid = 5) where ProductID = 5;
update orderitems set Price = (select Price from products where productid = 7) where ProductID = 7;
-- update orderitems set Price = ( select price from products where orderitems.productid=products.productid ) 
-- where exists ( select 1 from orderitems where orderitems.productid=products.productid );

alter table orders add orderValue int;
update orders set ordervalue = ( select sum(price) from orderitems where orders.OrderID=orderitems.OrderID ) 
where exists ( select 1 from orderitems where orders.OrderID=orderitems.OrderID );

alter table orderitems add column userID int;
update orderitems set userID = (select userID from orders where orderID = 1) where orderID = 1;
update orderitems set userID = (select userID from orders where orderID = 2) where orderID = 2;
-- update orderitems set userID = ( select userID from orders where orderitems.OrderID=orders.OrderID ) 
-- where exists ( select 1 from orderitems where orderitems.OrderID=orders.OrderID );

-- 2. Display Id, Title, Category Title, Price of the products which are Active and recently added products should be at top.
select products.*, Category.CategoryName from products join Category using (CategoryID) order by ProductID desc;

-- 3. Display the list of products which dont have any images.
select images.*, products.ProductName from images join products using (productid) where imageurl is null;

-- 4. Display all Id, Title and Parent Category Title for all the Categories listed, sorted by Parent Category Title and then Category Title. 
select SubCategory.*, Category.CategoryName from SubCategory join Category using (CategoryID) order by Category.CategoryName, SubCategory.SubCategoryName;

-- 5. Display Id, Title, Parent Category Title of all the leaf Categories (categories which are not parent of any other category)
select SubCategory.*, Category.CategoryName from SubCategory join Category using (CategoryID);

-- 6. Display Product Title, Price & Description which falls into particular category Title (i.e. â€œMobileâ€)
select products.*, Category.CategoryName from products join Category using (CategoryID) where category.categoryName = "Grocary" order by ProductID;
select products.*, Category.CategoryName from products join Category using (CategoryID) where category.categoryName = "Electronics" order by ProductID;

-- 7. Display the list of Products whose Quantity on hand (Inventory) is under 50.
select products.productname from inventory join products using (productid) where quantity <= 50;

