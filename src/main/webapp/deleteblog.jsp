<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
        com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
        if (user != null) {
         }
    %>
    
 
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
    String dbUser = "root";
    String dbPassword = "";
    Connection conn = null;
    PreparedStatement stmt = null;
    int blogId = Integer.parseInt(request.getParameter("blog_id"));

    try {
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        String sql = "DELETE FROM blog WHERE blog_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, blogId);
        int deleted = stmt.executeUpdate();
        
        if (deleted > 0) {
            if ( user.getUserType().equalsIgnoreCase("admin"))
            {
%>
                <script>
                    alert("Blog deleted successfully.");
                    window.location.href = "<%=request.getContextPath()%>/AllBlogsManage.jsp";
                </script>
<%

            } 
          
            else {
%>
                <script>
                    alert("Blog deleted successfully.");
                    window.location.href = "<%=request.getContextPath()%>/ViewYourBlogs.jsp";
                </script>
<%
            }
        } else {
%>
            <script>
            <script>
                alert("Failed to delete blog. Please try again.");
                window.location.href = "<%=request.getContextPath()%>/ViewYourBlogs.jsp";
            </script>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>