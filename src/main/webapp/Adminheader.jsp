 
<!DOCTYPE html>
<html>
 <head>
 <title>letsblog</title>
</head>
    <style>
 body {
      margin: 0;
      box-sizing: border-box;
    }
  .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #f5f5f5;
    }

    .header .logo {
      font-size: 25px;
      font-family: 'Sriracha', cursive;
      color: #000;
      text-decoration: none;
      margin-left: 30px;
    }

    .nav-items {
      display: flex;
      justify-content: space-around;
      align-items: center;
      background-color: #f5f5f5;
      margin-right: 20px;
    }

    .nav-items a {
    font-family: cursive;
    text-decoration: none;
    color: #000;
    padding: 35px 20px;
}
    </style>
<body>
    
    <header class="header">
    <a href="#" class="logo">letsBlog</a>
    <nav class="nav-items">
      <a href="./AdminDashboard.jsp">Home</a>
       <a href="./AdminProfile.jsp">Profile</a>
                <a href="./ViewAdminBlogs.jsp">Your Blogs</a>
          <a href="./Reports.jsp">Report</a>
       
                <a href="./getfeedback.jsp">Feedback</a>
      
    </nav>
  </header>
    
    </body>
</html>