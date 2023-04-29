<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ include file="Adminheader.jsp"%>
<meta charset="ISO-8859-1">
 
<style>
  body {
    font-family: Arial, sans-serif;
  }
  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  h1 {
    font-size: 36px;
    text-align: center;
    margin-bottom: 30px;
  }
  p {
    line-height: 1.6;
    font-size: 18px;
  }
  .date {
    font-size: 14px;
    color: #666;
    margin-top: 10px;
  }
</style>

</head>
<body>
<div class="container">
  <% 
   String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
  String dbUser = "root";
  String dbPassword = "";
  Connection conn = null;

  try {
	    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

 	    String blogId = request.getParameter("blog_id");

 	    String sql = "SELECT b.title, b.content, b.category, b.publish_date, u.name " +
	                 "FROM blog b " +
	                 "JOIN users u ON b.blogger_id = u.id " +
	                 "WHERE b.blog_id = ?";
	    PreparedStatement statement = conn.prepareStatement(sql);
	    statement.setString(1, blogId);
	    ResultSet resultSet = statement.executeQuery();

	    if (resultSet.next()) {
	        String title = resultSet.getString("title");
	        title = title.toUpperCase();
	        String category = resultSet.getString("category");
	        String content = resultSet.getString("content");
	        String publishDate = resultSet.getString("publish_date");
	        String authorName = resultSet.getString("name");
	        out.println("<h1>" + title + "</h1>");
	        out.println("<h7><b><i>Category: " + category + "</i></b></h7>");
 	        out.println("<p>" + content + "</p>");

            
          out.println("<p class='date'>Published on " + publishDate + "</p>");
		  out.println("<p>By " + authorName + "</p>");

	    } else {
	        out.println("<p>Blog not found.</p>");
	    }

	    conn.close();
  } catch (SQLException e) {
      e.printStackTrace();
  }
  %>
</div>
 <%@ include file="Adminfooter.jsp" %>

</body>       
</html>
