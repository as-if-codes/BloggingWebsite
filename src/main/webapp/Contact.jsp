<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
         <%@ include file="header.html" %>
 
<title>letsblog</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<style>
.contact-parent {
	background: #fff;
	display: flex;
	margin: 80px 0;
}

.contact-child {
	display: flex;
	flex: 1;
	box-shadow: 0px 0px 10px -2px rgba(0, 0, 0, 0.75);
}

.child1 {
	background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
		url("https://cdn.pixabay.com/photo/2019/06/28/00/17/architecture-4303279_1280.jpg");
	background-size: cover;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	color: #fff;
	padding: 100px 0;
}

.child1 p {
	padding-left: 20%;
	font-size: 20px;
	text-shadow: 0px 0px 2px #000;
}

.child1 p span {
	font-size: 16px;
	color: #9df2fd;
}

.child2 {
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
}

.inside-contact {
	width: 90%;
	margin: 0 auto;
}

.inside-contact h2 {
	text-transform: uppercase;
	text-align: center;
	margin-top: 50px;
}

.inside-contact h3 {
	text-align: center;
	font-size: 16px;
	color: #0085e2;
}

@media screen and (max-width:991px) {
	.contact-parent {
		display: block;
		width: 100%;
	}
	.child1 {
		display: none;
	}
	.child2 {
		background-image: linear-gradient(rgba(255, 255, 255, 0.7),
			rgba(255, 255, 255, 0.7)),
			url("https://cdn.pixabay.com/photo/2019/06/28/00/17/architecture-4303279_1280.jpg");
		background-size: cover;
	}
	.inside-contact input, .inside-contact textarea {
		background-color: #fff;
	}
}

.inside-contact input[type=submit] {
	background-color: #000;
	color: #fff;
	transition: 0.2s;
	border: 2px solid #000;
	margin: 30px 0;
}
h2 {
    text-align: center;
 }

</style>

<div class="container">
	<div class="contact-parent">
		<div class="contact-child child1">
							<h2>Contact Us</h2>
		
			<p>
				<i class="fas fa-map-marker-alt"></i> Address <br /> <span>
					<br /> Ahmednagar
				</span>
			</p>
			<p>
				<i class="fas fa-phone-alt"></i> Let's Talk <br /> <span>
					+917796380785</span>
			</p>
			<p>
				<i class=" far fa-envelope"></i> Asif Sayyed <br /> <span>asifsayyed0502@gmail.com</span>
			</p>
		</div>
		<div class="contact-child child2">
			<form method="post" action="feedback.jsp">

				<div class="inside-contact">
					<h2>Feedback Form</h2>

					<p>Name *</p>
					<input type="text" name="name" Required="required">
					<p>Email *</p>
					<input type="email" name="email" required>
					<p>Phone *</p>
					<input type="tel" name="phone_number" pattern="[0-9]{10}" required>
					<p>Subject </p>
					<input type="text" name="Subject">
					<p>Message *</p>
					<textarea name="message" rows="5" cols="20" Required="required"></textarea>

					<input type="submit" id="btn_send" value="SEND">
				</div>
			</form>
		</div>
	</div>

</div>
<%@ include file="footer.html"%>

 </head></html>