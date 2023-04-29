<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
 String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone_number");
String subject = request.getParameter("Subject");
String message = request.getParameter("message");

 String url = "jdbc:mysql://localhost:3306/blogging_website_db";
String username = "root";
String password = "";
String driver = "com.mysql.cj.jdbc.Driver";
Class.forName(driver);
Connection conn = DriverManager.getConnection(url, username, password);

 String sql = "INSERT INTO feedback (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)";
PreparedStatement statement = conn.prepareStatement(sql);
statement.setString(1, name);
statement.setString(2, email);
statement.setString(3, phone);
statement.setString(4, subject);
statement.setString(5, message);

 int rowsInserted = statement.executeUpdate();

 statement.close();
conn.close();

if (rowsInserted > 0) {
    %>
    <script>
        alert("Feedback Submitted Successfully.");
        setTimeout(function() { 
            window.location.href = '<%= request.getHeader("Referer") %>' 
        }, 1000);
    </script>
    <%
} else {
    %>
    <script>
        alert("Something Went Wrong.");
        setTimeout(function() { 
            window.location.href = '<%= request.getHeader("Referer") %>' 
        }, 1000);
    </script>
    <%
}
%>