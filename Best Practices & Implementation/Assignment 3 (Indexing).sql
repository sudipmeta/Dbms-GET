-- Assignment 3

-- Identify the columns require indexing in order, product, category tables and create indexes

CREATE INDEX product_Id_index ON  product(product_id);
CREATE INDEX order_index ON orders(order_id,user_id);
CREATE INDEX category_index ON subcategory(subcategory_id,category_id);