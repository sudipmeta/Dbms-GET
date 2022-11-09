import java.sql.*;

public class Assignment{
	public static void main(String[] arg) throws SQLException {
	   	 String host = "jdbc:mysql://localhost:3306/";
	   	 String dbName = "storefront";
	   	 String mysqlURL = host + dbName;
	   	 String userId = "root";
	   	 String password = "mysql";
	   	 try {
	   		 Class.forName("com.mysql.cj.jdbc.Driver");
	   	 } catch (ClassNotFoundException cnfe) {
	   		 System.out.println("Error loading driver: " + cnfe);
	   	 }
	   	Connection connection = DriverManager.getConnection(mysqlURL, userId,password);
	   	
//	     Assignment - 1:
//	   	Given the id of a user, fetch all orders (Id, Order Date, Order Total) of that user which are in shipped state. Orders should be sorted by order date column in chronological order.
	   	
	   	String query1 = "SELECT order_id,order_date, order_total FROM user u\r\n"
	  	 		+ "JOIN orders o\r\n"
	  	 		+ "USING(user_id)\r\n"
	  	 		+ "JOIN order_items oi\r\n"
	  	 		+ "USING(order_id)\r\n"
	  	 		+ "WHERE Order_Status = \"Shipped\"\r\n"
	  	 		+ "GROUP BY o.order_id\r\n"
	  	 		+ "ORDER BY o.order_date\r\n";
	   	
	   	Statement st = connection.createStatement();
	  	ResultSet rs=st.executeQuery(query1);
	  	System.out.println("Order_id \t Order_date\t\torder_total\n");
	  	while(rs.next()) {
	  		int orderId=rs.getInt("order_id");
	  		String orderDate=rs.getString("order_date");		
	  		int totalCost=rs.getInt("order_total");	

	  		System.out.println(orderId+" \t\t "+orderDate+"\t\t"+totalCost);
	  	 }
	  	
	  	String query2 = "INSERT INTO images(Image_Id, Product_Id,image)\r\n"
	  			+ "VALUES(1,1,'\\\\image1\\\\'),\r\n"
	  			+ "(2,1,'\\\\image2\\\\'),\r\n"
	  			+ "(3,1,'\\\\image3\\\\'),\r\n"
	  			+ "(4,1,'\\\\image4\\\\'),\r\n"
	  			+ "(5,1,'\\\\image5\\\\')";
	  	
//	    Assignment - 2:
//	  	Insert five or more images of a product using batch insert technique

	  	st.execute(query2);
	  	
	  	String query3 = "SELECT * FROM images";
	  	rs = st.executeQuery(query3);

	  	
	  	System.out.println("\nImage_id \t\t Product_date \t\t Image\n");
	  	 while(rs.next()) {
	  		int id=rs.getInt("image_id");
	  		String productId=rs.getString("product_id");		
	  		String image=rs.getString("image");	

	  		 System.out.println(id+" \t\t\t "+productId+"\t\t\t"+image);
	  	 }
	  	 
	  	System.out.println();
	  	
//	  	Assignment - 3:
//	  	Delete all those products which were not ordered by any Shopper in last 1 year. Return the number of products deleted
	  	 
	  	String query4 = "SELECT COUNT(*) AS COUNT FROM product p\r\n"
	  			+ "WHERE product_id NOT IN (SELECT oi.product_id FROM order_items oi JOIN orders o Using(order_id)\r\n"
	  			+ "WHERE DATEDIFF(CURDATE(), ORDER_date) <= 365)\r\n";

	  	rs = st.executeQuery(query4);
	  	
	  	while(rs.next()) {
	  		int count = rs.getInt("COUNT");
		  	System.out.println("Count: " + count);
	  	 }
	  	
	  	st.execute("SET FOREIGN_KEY_CHECKS = 0");
	  	
	  	String query5 = "DELETE FROM product WHERE product_id NOT IN (SELECT product_id FROM order_items JOIN orders USING (order_id) WHERE \r\n"
	  			+ "datediff(now(), order_date) <= 365);";
	  	
	  	st.execute(query5);
	  	
//	  	Assignment - 4:
//	  	Select and display the category title of all top parent categories sorted alphabetically and the count of their child categories
	  	
	  	String query6 = "SELECT category_name, COUNT(Category_Id) AS \"Count\" FROM category\r\n"
	  			+ "JOIN subcategory\r\n"
	  			+ "USING(Category_Id)\r\n"
	  			+ "GROUP BY Category_Id\r\n"
	  			+ "UNION\r\n"
	  			+ "SELECT category_name, 0 FROM category\r\n"
	  			+ "WHERE category_ID NOT IN (SELECT category_ID FROM category\r\n"
	  			+ "JOIN subcategory\r\n"
	  			+ "USING(Category_Id))\r\n"
	  			+ "ORDER BY Category_Name;\r\n";
	  	
	  	rs = st.executeQuery(query6);
	  	
	  	System.out.println("\nName \t\t Count\n");
	  	while(rs.next()) {
	  		String name=rs.getString("category_name");
	  		int count =rs.getInt("Count");		

	  		 System.out.println(name +" \t\t "+ count);
	  	 }
	  	
	  	st.close();
	  	connection.close();

	}
}