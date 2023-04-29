<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="Userheader.jsp"%>

<%
        com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
        if (user != null) {
    %>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<head>
 <style>
body {
	font-family: Arial, sans-serif;
	background-color: #ffe2fe;
}

.container {
	margin: auto;
	width: 80%;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 5px #ccc;
	margin-top: 50px;
	margin-bottom: 50px;
}

h1, h2 {
	text-align: center;
	color: #4d4d4d;
	font-family: cursive;
}

p {
    font-size: x-large;
    color: dimgray;
}
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #f5f5f5;
}

.profile-pic {
	display: block;
	margin: auto;
	width: 200px;
	height: 200px;
	object-fit: cover;
	border-radius: 50%;
	margin-bottom: 20px;
	box-shadow: 0px 0px 5px #ccc;
}

.profile-info {
    text-align: center;
    color: #4d4d4d;
    font: menu;
    font-family: monospace;
}

.label {
	font-weight: bold;
}

.value {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="profile-info"
			<% }
 		String name = user.getName();
 	 
  		String city = user.getCity();
 		String  email= user.getEmail();
 		
 	int id=	user.getId();
 	String Number = user.getPhoneNumber();
 		String type = user.getUserType();
 		 	%>>
			<h2>User Profile</h2>
			<p>
				ID:
				<%= id %></p>
			<p>
				Name:
				<%= name %> <%="[" +type + "]"%></p>
				<p>
				
				</p>
			<p>
				City:
				<%= city %></p>
			<p>
				Email:
				<%= email %></p>
			
			<p>
				Phone Number:
				<%= Number %></p>
		<p>
		<div class="button-container">

				<form method="POST" action="UpdateU.jsp">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="submit" value="Update Profile">
				</form>
   
 				</div>
	</div>
	</div>
</body>
        <%@ include file="Userfooter.jsp" %>

</html>