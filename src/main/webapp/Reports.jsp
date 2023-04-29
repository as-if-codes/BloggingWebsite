<%@ page import="java.sql.*" %>
<%@ include file="Adminheader.jsp"%>
</head>
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

.blog-table tr:nth-child(even){background-color: #f2f2f2}

.blog-table th {
  background-color: #878787
  color: white;
}
</style>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String sql = "SELECT users.name, COUNT(*) AS num_blogs FROM blog JOIN users ON blog.blogger_id = users.id GROUP BY users.id";
        
        
        PreparedStatement statement = conn.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        out.println("<div class='tab'>");

        out.println("<table class='blog-table'>");
        out.println("<tr>");
        out.println("<th>User Name</th>");
        out.println("<th>Number of Blogs</th>");
        out.println("</tr>");

        while (resultSet.next()) {
            String userId = resultSet.getString("users.name");
            int numBlogs = resultSet.getInt("num_blogs");

            out.println("<tr>");
            out.println("<td>" + userId + "</td>");
            out.println("<td>" + numBlogs + "</td>");
            out.println("</tr>");
        }

        out.println("</table>");
 

        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%></div>

<%@ include file="Adminfooter.jsp"%>
