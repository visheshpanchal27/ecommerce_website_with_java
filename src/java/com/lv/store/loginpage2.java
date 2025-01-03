package com.lv.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "loginpage2", urlPatterns = {"/loginpage2"})
public class loginpage2 extends HttpServlet {

    // Method to process both GET and POST requests
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Get user inputs from the request
            String userName = request.getParameter("c");
            String gmail = request.getParameter("e");  // Assuming Gmail is sent in 'e' parameter
            String password = request.getParameter("d");

            // Database connection details
            String dbUser = "root";
            String dbPassword = "1234";
            String dbURL = "jdbc:mysql://localhost:3306/zxc";  // Use 'asd' database

            // Establish the database connection
            Connection conn = null;
            PreparedStatement preparedStatement = null;

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                out.print("Connected to database<br>");

                // Connect to the database
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                out.print("Connection successful<br>");

                // SQL query to insert user details
                String sql = "INSERT INTO zx(username, gmail, password) VALUES (?, ?, ?)";

                // Prepare the statement to execute the query
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, userName);  // Set the username
                preparedStatement.setString(2, gmail);     // Set the gmail
                preparedStatement.setString(3, password);  // Set the password (consider hashing/encryption in production)

                // Execute the query and check if the user is added
                int result = preparedStatement.executeUpdate();
                if (result > 0) {
                    // Registration successful, redirect to store.jsp
                    response.sendRedirect("login.jsp");  // Redirect to store page after successful registration
                } else {
                    response.getWriter().println("Registration failed. Please try again.");
                }

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(loginpage2.class.getName()).log(Level.SEVERE, null, ex);
                // Print error message for debugging
                out.println("Error occurred during registration: " + ex.getMessage());
            } finally {
                try {
                    if (preparedStatement != null) preparedStatement.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    Logger.getLogger(loginpage2.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }
    }

    // Handling the GET request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handling the POST request
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "User Registration Servlet";
    }
}
