<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
</head>
<%@ include file="Adminheader.jsp"%>

<style>
.tab {
	height: 600px;
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
form {
  display: flex;
  align-items: center;
  justify-content: end;
  margin: 20px;
}

label {
  font-weight: bold;
  margin-right: 10px;
}

input[type="text"] {
  padding: 10px;
  border-radius: 5px;
   outline: none;
  font-size: 16px;
}


button[type="submit"] {
    background-color: #25dce1;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-left: 10px;
}

button[type="submit"]:hover {
  background-color: #35e5ea;
}

</style>
<body>

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
		System.out.println("All is well");
		%>

		<form action="SearchBlogsAdmin.jsp" method="get">
		  <label for="search">Search Blogs:</label>
		  <input type="text" id="search" name="search">
		  <button type="submit">Search</button>
		</form>
		<%
		
		try {
			conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

			String sql = "SELECT * FROM blog";
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			out.println("<table class='blog-table'>");

			out.println("<tr>");
			out.println("<th style='text-align:center;'>Title</th>");
			out.println("<th style='text-align:center;'>Category</th>");
			out.println("<th style='text-align:center;'>Published On</th>");
			out.println("<th style='text-align:center;'>Read</th>");
			out.println("<th style='text-align:center;'>Update</th>");
			out.println("<th style='text-align:center;'>Delete</th>");

			out.println("</tr>");
			while (resultSet.next()) {
				String title = resultSet.getString("title");
				String date = resultSet.getString("publish_date");
				String blogid = resultSet.getString("blog_id");
				String catg = resultSet.getString("category");
%>
			 <tr>
      <td><%= title %></td>
      <td><%= catg %></td>
      <td><%= date %></td>
      <td><a href="AdminBlogView.jsp?blog_id=<%= blogid %>">READ</a></td>
      <td><a href="UpdateBlogAdmin.jsp?blog_id=<%= blogid %>">UPDATE</a></td>
      <td><a href="deleteblog.jsp?blog_id=<%= blogid %>" onclick="return confirm('Are you sure you want to delete this blog?')">DELETE</a></td>
    </tr>
		<%	}
			out.println("</table>");

			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		%>
	</div>
</body>
<%@ include file="Adminfooter.jsp"%>
</html>