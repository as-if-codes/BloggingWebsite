<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.asif.Bean.User" %>

<%
com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
if (user != null) {
	String user_id  = request.getParameter("id");

String name = request.getParameter("name");
String city = request.getParameter("city");
String password = request.getParameter("password");
String number = request.getParameter("number");

    String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
    String dbUser = "root";
    String dbPassword = "";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String sql = "UPDATE users SET name=?, City=?, password=?,phone_number=? WHERE id=?";
        stmt = conn.prepareStatement(sql);

        stmt.setString(1, name);
        stmt.setString(2, city);
        stmt.setString(3, password);
        stmt.setString(4, number);
        stmt.setInt(5, user.getId());
 
        int updated = stmt.executeUpdate();

        if (updated > 0) {
        	  if ( user.getUserType().equalsIgnoreCase("admin"))
              {
        	 %>
        	     <script>
            alert("Profile Updated Successfully.");
            window.location.href = "<%=  request.getContextPath()%>/AdminProfile.jsp";

        </script>
<%}
        	  else  {
        		  %>
                  <script>
                      alert("Profile Updated successfully.");
                      window.location.href = "<%=request.getContextPath()%>/Profile.jsp";
                  </script>
      <%  	  
        } 
        	  }
        else {
        	%>
        	 <script>
             alert("Profile not Updated ! Please Try Again !!");
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

