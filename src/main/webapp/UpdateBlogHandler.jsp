 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
     com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
    if (user != null) {
         int blogId = Integer.parseInt(request.getParameter("blog_id"));
        
         String title = request.getParameter("title");
        String content = request.getParameter("content");
        
         String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
        String dbUser = "root";
        String dbPassword = "";
        
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            
             String sql = "UPDATE blog SET title=?, content=? WHERE blog_id=?";
            stmt = conn.prepareStatement(sql);
            
             stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, blogId);
            
             int updated = stmt.executeUpdate();
            
            if (updated > 0) {
            	  if ( user.getUserType().equalsIgnoreCase("admin"))
                  {
            	 %>
            	     <script>
                alert("Blog Updated Successfully.");
                window.location.href = "<%=  request.getContextPath()%>/AllBlogsManage.jsp";

            </script>
<%}
            	  else  {
            		  %>
                      <script>
                          alert("Blog Updated successfully.");
                          window.location.href = "<%=request.getContextPath()%>/ViewYourBlogs.jsp";
                      </script>
          <%  	  
            } 
            	  }
            else {
            	%>
            	 <script>
                 alert("Blog not Updated ! Please Try Again !!");
                 window.location.href = "<%=request.getContextPath()%>/Login.jsp";
             </script>
            	<%
            	
            	
                 out.println("Failed to update blog post. Please try again.");
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
    } 
      %>