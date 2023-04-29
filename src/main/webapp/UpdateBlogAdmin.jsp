<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="Adminheader.jsp"%>

<style >  @import url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');

    body {
      margin: 0;
      box-sizing: border-box;
    }
.login-form {
     display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #fff;
    padding-bottom: 10px;
    padding-top: 11px;
    padding-left: 100px;
    padding-right: 100px;
    border-radius: 10px;
    box-shadow: 0px 0px 20px rgb(0 0 0 / 20%);
    width: 50%;
    margin: 0 auto;
}

.login-form label, .login-form input {
  display: block;
  margin: 1px 0;
}

.login-form input[type="submit"] {
  background-color: #5edaf0;
  color: #000;
  padding: 10px 25px;
  border: none;
  border-radius: 5px;
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
  box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.4);
}
 
.intro {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 620px;
  background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 100%), url("https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
h2 {
     display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
    

    .bottom-links {
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 40px 0;
    }

    .bottom-links .links {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 0 40px;
    }

    .bottom-links .links span {
      font-size: 20px;
      color: #fff;
      text-transform: uppercase;
      margin: 10px 0;
    }

    .bottom-links .links a  {
      text-decoration: none;
      color: #a1a1a1;
      padding: 10px 20px;
    }</style>
<%@page import="java.sql.*"%>
<%@page import="com.asif.Connection.*"%>

<%
    String blogId = request.getParameter("blog_id");
    Connection con = ConnectionProvider.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM blog WHERE blog_id=?");
    ps.setString(1, blogId);
    ResultSet rs = ps.executeQuery();
    String title = "", content = "";
    if (rs.next()) {
        title = rs.getString("title");
        content = rs.getString("content");
    }
%>

  <title>Update Blog</title>
</head>
<body>
 <div class="intro">
       
        <div class="login-form">
    <h1>Update Blog</h1>
    <form action="UpdateBlogHandler.jsp" method="post">
        <input type="hidden" name="blog_id" value="<%=blogId%>">
        <label for="title">Title:</label>
        <input type="text" name="title" value="<%=title%>" required maxlength="70" placeholder="Enter the blog title"><br><br>
        <label for="content">Content:</label><br>
        <textarea name="content" rows="10" cols="70" placeholder="Enter the blog content"><%=content%> </textarea><br><br>
        <input type="submit" value="Update">
    </form>
    </div></div>
</body>
<%@ include file="Adminfooter.jsp"%>

</html> 