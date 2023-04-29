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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (validateUser(email, password)) {
            User user = null;
            
			try {
				user = userDao.getUserByEmail(email);
			} catch (SQLException e) {
 				e.printStackTrace();
			}
			
            request.getSession().setAttribute("user", user);
            
            String type = user.getUserType();
            System.out.println(type);
            
            if(type.equalsIgnoreCase("admin") ){
 
                response.sendRedirect("AdminDashboard.jsp");

            }
         else  {
             System.out.println("211");

            response.sendRedirect("UserDashboard.jsp");
        }}
        
        else {
 
            response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		    out.println("<script type=\"text/javascript\">");  
		    out.println("alert('INVALID CREDENTIALS !!');"); 
		    out.println("window.location = './Login.jsp';"); 
		    out.println("</script>");
        }}
    

    private boolean validateUser(String email, String password) {
        User user = null;
        try {
            user = userDao.getUserByEmailAndPassword(email, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user != null;
    }
}
