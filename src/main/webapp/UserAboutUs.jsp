<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="Userheader.jsp" %>

<title>letsblog</title>
</head>
    <%
        com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
     %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');

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
      background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 100%), url("https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80");
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
    font-size: 40px;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    color: darkgrey;
}
  </style>
</head>

<body>
  <div class="intro">
		<h2>About Us</h2>
		
		 
	<main>
		<p>Welcome to letsBlog.com, a platform where you can find interesting and informative blog posts on a variety of topics. Our aim is to provide valuable content to our readers and to create a community of people who love to learn and share their knowledge.</p>
		
		
		<p>We value your feedback and suggestions, so please feel free to contact us if you have any comments or questions. We hope you enjoy our blog and look forward to hearing from you!</p>
	
    <p>Thank You For Visiting.</p>

  </main>
  </div>
        <%@ include file="Userfooter.jsp" %>
  
</body>

</html> 