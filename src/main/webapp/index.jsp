<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>letsblog</title>
</head>
<%@ include file="header.html" %>
   
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    body {
      margin: 0;
      box-sizing: border-box;
    }
 
 .button2 {
    scroll-padding-left: 10px;
    padding-left: 0px;
    padding-top: 50px;
}
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
    font-family: 'Sriracha';
    font-size: 50px;
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
    .button-container button {
  margin-right: 30px;
}
  .button-container {
    display: flex;
    justify-content: center;
    margin-top: 30px;
  }
  
  

 
  </style>
</head>

<body>
 
  <main>
    <div class="intro">
     <h1>The Bloggers Community</h1>
      <p> Welcome to our Blogging Website!
      Discover a world of unique and engaging stories,
       experiences and ideas. Our blogging website is the 
       perfect platform to share your thoughts and connect with 
        people. Whether you're interested in lifestyle, 
       technology, travel or food, our website has something for 
       everyone.</p>
       <p>Join our community and start exploring today ! </p>
      
	<div class="button-container">
      
<a href="Register.jsp"><button>Sign Up</button></a>
<a href="Login.jsp"><button>Login</button></a>
</div>
    </div>
 
   </main>
  <%@ include file="footer.html" %>
  
</body>

</html> 