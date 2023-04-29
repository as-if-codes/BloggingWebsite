<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<%@ include file="Adminheader.jsp" %>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Blog</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Sriracha&display=swap');

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
  margin: 10px 0;
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
    }
  </style>
</head>

          <body>
    
<%
        com.asif.Bean.User user = (com.asif.Bean.User) session.getAttribute("user");
        if (user != null) {
        	
        }
    %>  
  <main>
    <div class="intro">
       
        <div class="login-form">
     
          <form method="post" action="SubmitBlogServlet" enctype="multipart/form-data">
  <h1>Write a blog post</h1>

  <label for="title">Title:</label>
  <input type="text" name="title" id="title" required maxlength="70">
  
  <input type="hidden" name="type" value="<%= user.getUserType() %>">

  <input type="hidden" name="blogger_id" value="<%= user.getId() %>">
 <label for="category">Category:</label>
<select name="category" id="category" required>
  <option value="Arts and Entertainment">Arts and Entertainment</option>
  <option value="Business and Finance">Business and Finance</option>
  <option value="Education">Education</option>
  <option value="Health and Fitness">Health and Fitness</option>
  <option value="Lifestyle">Lifestyle</option>
  <option value="News and Politics">News and Politics</option>
  <option value="Science and Technology">Science and Technology</option>
  <option value="Sports">Sports</option>
  <option value="other">other</option>
</select>
 
  <label for="content">Content:</label>
<textarea name="content" id="content" required style="width: 504px; height: 170px;"
 placeholder="Enter your blog content here...
Add <br> for new line"></textarea>
  
  
  
  <input type="submit" value="Submit">
</form>
          </div>
          </div>
            </main>
          
    
        <%@ include file="Adminfooter.jsp" %>
    
</body>
</html>