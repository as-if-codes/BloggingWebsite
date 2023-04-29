package com.asif.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date; 
public class PostBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bloggerId = request.getParameter("blogger_id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Create a new database connection
        String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
        String dbUser = "root";
        String dbPassword = "";
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            // Insert the blog post into the database
            String sql = "INSERT INTO blog (title, content, blogger_id) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, content);
            statement.setString(3, bloggerId);
            statement.executeUpdate();

             conn.close();

             response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Blog post added successfully!');");
            out.println("window.location.href='UserDashboard.jsp';");
            out.println("</script>");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}