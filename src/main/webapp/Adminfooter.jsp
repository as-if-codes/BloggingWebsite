<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>letsblog</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');

body {
	margin: 0;
	box-sizing: border-box;
}

 
.footer {
    height: 200px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #000000;
    padding: 20px 90px;
    
}


.footer .copy {
    font-size: larger;
    color: #fff;
    font-family: math;
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

.bottom-links .links a {
	text-decoration: none;
	color: #a1a1a1;
	padding: 10px 20px;
}
</style>
<body>
<footer class="footer">
	<div class="copy">&copy; ASIF SAYYED</div>
	<div class="bottom-links">
		<div class="links">
			<span>More</span> <a href="./AdminDashboard.jsp">Home</a> 
			 <a href="./AdminProfile.jsp">Profile</a> 
			 			<a href="./index.jsp">LogOut</a> 
			 
			 
		</div>
		<div class="links">
					<span>Social Links</span> 
		
			<a href="https://github.com/as-if-codes"><i class="fab fa-github"></i></a>
			<a href="https://www.linkedin.com/in/asif-sayyedsd"><i class="fab fa-linkedin"></i></a> 
			<a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
			
		</div>
	</div>
</footer>
</body>

</html>