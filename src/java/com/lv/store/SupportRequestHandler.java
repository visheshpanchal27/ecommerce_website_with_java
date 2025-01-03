package com.lv.store;

import java.sql.*;

public class SupportRequestHandler {
    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/zxc"; // Database name
    private static final String DB_USER = "root"; // Replace with your MySQL username
    private static final String DB_PASSWORD = "password"; // Replace with your MySQL password

    public static boolean saveSupportRequest(String name, String email, String message) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Connect to the database
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert the support request
            String sql = "INSERT INTO support_requests (username, email, message) VALUES (?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, message);

            // Execute the query
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if there is a database error
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
