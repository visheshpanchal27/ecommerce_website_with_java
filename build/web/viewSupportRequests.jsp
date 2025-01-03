<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Support Requests</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1>Support Requests</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Message</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/zxc";
                String dbUser = "your_username";
                String dbPassword = "your_password";

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish a connection
                    connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Execute the query to fetch all support requests
                    String sql = "SELECT * FROM support_requests";
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(sql);

                    // Display the results
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String username = resultSet.getString("username");
                        String email = resultSet.getString("email");
                        String message = resultSet.getString("message");
                        Timestamp createdAt = resultSet.getTimestamp("created_at");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= message %></td>
                <td><%= createdAt %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
                    if (statement != null) try { statement.close(); } catch (SQLException ignored) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
                }
            %>
        </tbody>
    </table>
</body>
</html>
