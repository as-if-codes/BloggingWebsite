<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<head><%@ include file="Userheader.jsp"%>
</head>
<style>
body {
	margin: 0;
	box-sizing: border-box;
}

.tab {

	
}

.blog-table {
	border-collapse: collapse;
	width: 100%;
}

.blog-table th, .blog-table td {
	text-align: center;
	padding: 8px;
}

.blog-table tr:nth-child(even) {
	background-color: #f2f2f2
}

.blog-table th {
	background-color: #878787 color: white;
}

.page {
	height: 600px;
}

body {
	margin: 0;
	box-sizing: border-box;
}
</style>
<body>
	<div class=page>

		<div class=tab>
			<% 
com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
if (user != null) {
	
}
    int bloggerId = user.getId();

     String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
    String dbUser = "root";
    String dbPassword = "";
    Connection conn = null;
System.out.println("blogs fetched");
try {
    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

     String sql = "SELECT * FROM blog WHERE blogger_id=?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setInt(1, bloggerId);
    ResultSet resultSet = statement.executeQuery();
    out.println("<table class='blog-table'>"); // add class to table

 

if (!resultSet.isBeforeFirst()) {
   out.println("<h1>You Dont Have Any Blogs <h1>");
   out.println("</table>");
}
else {
   out.println("<tr>");
   out.println("<th style='text-align:center;'>Title</th>");
   out.println("<th style='text-align:center;'>Published On</th>");
   out.println("<th style='text-align:center;'>Read</th>");
   out.println("<th style='text-align:center;'>Update</th>");
   out.println("<th style='text-align:center;'>Delete</th>");

   out.println("</tr>");

   while (resultSet.next()) {
      String title = resultSet.getString("title");
      String date = resultSet.getString("publish_date");
      int blogId = resultSet.getInt("blog_id");

      %>
		 <tr>
<td><%= title %></td>
 <td><%= date %></td>
<td><a href="AdminBlogView.jsp?blog_id=<%= blogId %>">READ</a></td>
<td><a href="UpdateBlogAdmin.jsp?blog_id=<%= blogId %>">UPDATE</a></td>
<td><a href="deleteblog.jsp?blog_id=<%= blogId %>" onclick="return confirm('Are you sure you want to delete this blog?')">DELETE</a></td>
</tr>
	<%
   }
   out.println("</table>");
}

conn.close();
} catch (SQLException e) {
    e.printStackTrace();
}

%>
		</div>
	</div>

</body>
<%@ include file="Userfooter.jsp"%>
</html>
