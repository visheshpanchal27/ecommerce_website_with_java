package com.lv.store;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection parameters
        String dbURL = "jdbc:mysql://localhost:3306/zxc";
        String dbUser = "root"; // Change to your database username
        String dbPassword = "password"; // Change to your database password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String sql = "SELECT username, gmail, created_at FROM zx WHERE gmail = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet result = statement.executeQuery();

            if (result.next()) {
                String username = result.getString("username");
                String gmail = result.getString("gmail");
                String createdAt = result.getString("created_at");

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("gmail", gmail);
                session.setAttribute("created_at", createdAt);

                response.sendRedirect("account.jsp"); // Redirect to account page
            } else {
                response.sendRedirect("login.jsp?error=1"); // Redirect to login page with error
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
