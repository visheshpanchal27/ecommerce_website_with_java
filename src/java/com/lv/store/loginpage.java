package com.lv.store;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;

@WebServlet(name = "loginpage", urlPatterns = {"/loginpage"})
public class loginpage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Get input parameters (username, email, and password)
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database credentials
        String dbUser = "root";
        String dbPassword = "1234";
        String dbUrl = "jdbc:mysql://localhost:3306/zxc"; // Replace with your actual database name

        Connection conn = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // SQL query to check both username and email with password
            String sql = "SELECT * FROM zx WHERE (gmail = ? OR username = ?) AND password = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, email);          // Match email
            preparedStatement.setString(2, username);       // Match username
            preparedStatement.setString(3, password);       // Match password

            // Execute the query
            var resultSet = preparedStatement.executeQuery();

            // If the result set contains a record, the user is authenticated
            if (resultSet.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", resultSet.getString("username")); // Store username in session
                session.setAttribute("email", resultSet.getString("gmail"));      // Store email in session
                response.sendRedirect("store.jsp"); // Redirect to the store page
            } else {
                // If no user is found, redirect back to login page with error
                response.sendRedirect("login.jsp?error=invalid");
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(loginpage.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().println("An error occurred. Please try again later.");
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                Logger.getLogger(loginpage.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
