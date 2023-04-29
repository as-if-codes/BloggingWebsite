 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<head>
  <%@ include file="Userheader.jsp" %>
</head>

<style>
  .tab {
    height: 600px;
  }

  .blog-table {
    border-collapse: collapse;
    width: 100%;
  }

  .blog-table th,
  .blog-table td {
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
  <div class="tab">
    <% 
      com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
      if (user != null) {

      }
      int bloggerId = user.getId();

      String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
      String dbUser = "root";
      String dbPassword = "";
      Connection conn = null;

      try {
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String search = request.getParameter("search");
        String sql = "SELECT * FROM blog WHERE title LIKE ? OR content LIKE ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, "%" + search + "%");
        statement.setString(2, "%" + search + "%");

        ResultSet resultSet = statement.executeQuery();
        %>

        <form action="SearchBlogs.jsp" method="get">
          <label for="search">Search Blogs:</label>
          <input type="text" value="<%=search %>" name="search">
          <button type="submit">Search</button>
        </form>
        <%
        out.println("<table class='blog-table'>"); 

        out.println("<tr>");
        out.println("<th style='text-align:center;'>Title</th>");
        out.println("<th style='text-align:center;'>Category</th>");
        out.println("<th style='text-align:center;'>Published On</th>");
        out.println("<th style='text-align:center;'>Read</th>");  
        out.println("</tr>");

        while (resultSet.next()) {
          String title = resultSet.getString("title");
          String date = resultSet.getString("publish_date");
          String blogid = resultSet.getString("blog_id");
          String catg = resultSet.getString("category");

          out.println("<tr>"); 
          out.println("<td>" + title + "</td>");
          out.println("<td>" + catg + "</td>");
          out.println("<td>" + date + "</td>");
          out.println("<td><a href='BlogView.jsp?blog_id=" + blogid + "'>" + "Read" + "</a></td>");
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

<%@ include file="Userfooter.jsp" %>
</html>
 