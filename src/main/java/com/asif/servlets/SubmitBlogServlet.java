package com.asif.servlets;

import jakarta.servlet.ServletException;

 
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException; 

 @MultipartConfig(maxFileSize = 16177215) // 16 MB
public class SubmitBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bloggerId = request.getParameter("blogger_id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");
        String admin = request.getParameter("type");
        System.out.println(category);
    //    Part filePart = request.getPart("image");
      //  String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
         //InputStream fileContent = filePart.getInputStream();
          
     //    String imagePath = "C:/eclipse/AllJavaProjects/BlogSite/src/main/blogimages/" + fileName;
       // Files.copy(fileContent, new File(imagePath).toPath());
        

         String jdbcUrl = "jdbc:mysql://localhost:3306/blogging_website_db";
        String dbUser = "root";
        String dbPassword = "";
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
             String sql = "INSERT INTO blog (title, content, blogger_id , category) VALUES (?, ?, ?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, content);
            
        //     statement.setBinaryStream(3, filePart.getInputStream()); 
            statement.setString(3, bloggerId);
            statement.setString(4, category);

             statement.executeUpdate();

            conn.close();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
          
            if(admin.equalsIgnoreCase("admin"))
            { 
            	out.println("<script type=\"text/javascript\">");
               out.println("alert('Blog post added successfully!');");
                out.println("window.location.href='ViewAdminBlogs.jsp';");
                out.println("</script>");

            }
            else
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Blog post added successfully!');");
            out.println("window.location.href='ViewYourBlogs.jsp';");
            out.println("</script>");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
