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
	background-color: #f2f2f2;
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

.profile-info {
	text-align: center;
	color: #4d4d4d;
	font: menu;
	font-family: monospace;
}

.button-container {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

button {
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
 	 String password = user.getPassword();
  		String city = user.getCity();
 		String  email= user.getEmail();
 		
 	int id=	user.getId();
 	String Number = user.getPhoneNumber();
 		String type = user.getUserType();
 		 	%>>
			<h2>User Profile</h2>
			<form method="POST" action="Updater.jsp">
				<p>
					ID: <input type="text" name="id" value="<%= id %>" readonly>
				</p>
				<p>
					Name: <input type="text" name="name" value="<%= name %>">
				</p>
				<p>
					City: <input type="text" name="city" value="<%= city %>">
				</p>
				<p>
					Password: <input type="password" name="password" value="<%= password %>">
				</p>
				<p>
					Phone Number: <input type="text" name="number" pattern="[0-9]{10}"
						value="<%= Number %>">
				</p>

				<input type="submit" value="Update Profile">
 
		</form>
	</div>
	</div>

	<%@ include file="Userfooter.jsp"%>

</body>
</html>