
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="Userheader.jsp"%>


<meta charset="UTF-8">

<title>User Profile</title>
</head>

<body>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');

body {
	margin: 0;
	box-sizing: border-box;
}

/* CSS for main element */
.intro {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 520px;
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%,
		rgba(0, 0, 0, 0.5) 100%), url(./asif1.jpg);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

.intro h1 {
	font-family: sans-serif;
	font-size: 60px;
	color: #fff;
	font-weight: bold;
	text-transform: uppercase;
	margin: 0;
}

.intro p {
	font-size: 25px;
	color: #eef1f0;
	margin: 20px 100px;
}

.intro button {
	background-color: #5edaf0;
	color: #000;
	margin-top: 110px;
	padding: 10px 25px;
	border: none;
	border-radius: 5px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.4)
}

h2 {
	display: block;
	font-size: 30px;
	font-weight: bold;
	color: #d5dddc;
	margin-top: -0px;
}

input[type="submit"] {
	background-color: #5edaf0;
	color: #000;
	margin-top: 120px;
	padding: 10px 25px;
	border: none;
	border-radius: 5px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.4);
}
  .button-container {
    display: flex;
    justify-content: center;
    margin-top: 30px;
  }
  
  form {
    margin: 0 10px;
  }
</style>
</head>

<body>

	<div class="intro">

<%
        com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
        if (user != null) {
    %>
		<h2>
			Welcome
			<%= user.getName() %></h2>

	<div class="button-container">
  <form action="CreateBlog.jsp">
    <input type="submit" value="Write Blog" />
  </form>
  <form action="AllBlogs.jsp">
    <input type="submit" value="Browse" />
  </form>
		<%
		
        } else {
    %>
    
		<p>Sorry, Something Went Wrong</p>
		<%
        }
    %>

	
</div>


	</div>

 
         <%@ include file="Userfooter.jsp" %>

</body>

</html>