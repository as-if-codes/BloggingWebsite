<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
</head>
<%@ include file="Adminheader.jsp"%>

<style>
.blog-table {
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
</style>
<body>

	<div class=blog-table>
		<%
	 
 
		String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
		String dbUser = "root";
		String dbPassword = "";
		Connection conn = null;
 		try {
			conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

			String sql = "SELECT * FROM feedback";
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();
			out.println("<table class='feedback'>");

			out.println("<tr>");
			out.println("<th style='text-align:center;'>Id</th>");
			out.println("<th style='text-align:center;'>Name</th>");
			out.println("<th style='text-align:center;'>Phone Number</th>");
			out.println("<th style='text-align:center;'>Email</th>");

			out.println("<th style='text-align:center;'>Subject</th>");
			out.println("<th style='text-align:center;'>Message</th>");


			out.println("</tr>");
			while (resultSet.next()) {
				String id = resultSet.getString("fb_id");
				String name = resultSet.getString("name");
				String email = resultSet.getString("email");
				String pnumber = resultSet.getString("phone");
				String subject = resultSet.getString("subject");
				String message = resultSet.getString("message");
				out.println("<tr>");
				out.println("<td>" + id + "</td>");
				out.println("<td>" + name + "</td>");
				out.println("<td>" + pnumber + "</td>");
				out.println("<td>" + email + "</td>");

				out.println("<td>" + subject + "</td>");
				out.println("<td>" + message + "</td>");

				 
				out.println("</tr>");
			}
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