CREATE DATABASE storefront;

USE storefront;

create table Category(
    CategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CategoryName varchar(255)
);

create table SubCategory(
    SubCategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubCategoryName varchar(255),
    CategoryID int,
    FOREIGN KEY (CategoryID) REFERENCES category(CategoryID)
);

create table Products(
    ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductName varchar(255),
    Brand varchar(255),
    Price int,
    CategoryID int,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

create table linkingTable(
    SubCategoryID int NOT NULL,
    ProductID int NOT NULL,
    FOREIGN KEY (SubCategoryID) REFERENCES SubCategory(SubCategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

create table User(
    UserID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserName varchar(255),
    UserType varchar(255)
);

create table ShippingAddresses(
    AddressID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ShippingAddress varchar(255),
    UserID int,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

create table Orders(
    OrderID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserID int,
    OrderDate varchar(255),
    AddressID int,
    ordervalue int,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (AddressID) REFERENCES ShippingAddresses(AddressID)
);

create table images(
    ImageID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductID int,
    imageURL varchar(255),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

create table Inventory(
    ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Quantity int,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

create table orderItems(
    ProductID int NOT NULL PRIMARY KEY,
    orderID int NOT NULL,
    orderStatus varchar(255),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

FOREIGN key check = 0;
drop table products;
create table Products(
    ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductName varchar(255),
    Brand varchar(255),
    Price int,
    CategoryID int,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

    

