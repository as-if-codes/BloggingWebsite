package com.asif.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.asif.Bean.User;
import com.asif.UserDao.UserDao;


/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private UserDao userDao;

	    public void init() {
	        userDao = new UserDao();
	    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	 


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */ 

		    protected void doPost(HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {
		     System.out.println("hi asif");
		    	 
		    	        String name = request.getParameter("name");
		    	        String email = request.getParameter("email");
		    	        String password = request.getParameter("password");
		    	        String phoneNumber =  (request.getParameter("phone_number"));
		    	        String city = request.getParameter("city");
		    	        String userType = "blogger";

		    	        User user = new User(0, name, email, password, phoneNumber, city, userType);
		    	        UserDao userDao = new UserDao();
		    	        try {
							int i =userDao.registerUser(user);
							if(i==1) {
							    System.out.println("inside if block");
							    response.setContentType("text/html");  
							    PrintWriter out = response.getWriter();  
							    out.println("<script type=\"text/javascript\">");  
							    out.println("alert('Registration Successful !!');"); 
							    
							    out.println("window.location = './Login.jsp';"); 


							    out.println("</script>");
							//    request.getRequestDispatcher("/Login.jsp").forward(request, response);
							}
						 
						} catch (SQLException e) {
 							e.printStackTrace();
 							 response.setContentType("text/html");  
							    PrintWriter out = response.getWriter();  
							    out.println("<script type=\"text/javascript\">");  
							    out.println("alert('Something went wrong  !!');"); 
							    
							    out.println("window.location = './Register.jsp';"); 


							    out.println("</script>");
 							
						}
			   }

	
}
