-- Display Recent 50 Orders placed (Id, Order Date, Order Total).
select * from orders order by OrderDate desc limit 50;

-- Display 10 most expensive Orders.
select * from orders order by orderValue desc limit 10;

-- Display all the Orders which are placed more than 10 days old and one or more items from those orders are still not shipped.
select distinct orders.* from orders join orderItems using(orderID) 
where datediff(CURDATE(), orderDate) >= 10 and orderStatus <> "Shipped" or orderStatus <> "Delivered";

-- Display list of shoppers which haven't ordered anything since last month.
select distinct user.* from user where not exists(select 1 from orders where user.userid = orders.userid 
and datediff(curdate(), orderdate) <= 30) and usertype = "Shopper";

-- Display list of shopper along with orders placed by them in last 15 days.
select user.userName, orders.* from orders join user using (userid) where datediff(CURDATE(), orderDate) <= 15;

-- Display list of order items which are in â€œshippedâ€ state for particular Order Id (i.e.: 1020))
select orderitems.* from orderitems join orders using (orderID) where orderStatus = "Shipped" and orderID = 1;

-- Display list of order items along with order placed date which fall between Rs 20 to Rs 50 price.
select * from orderitems where price >= 20 and price <= 50;