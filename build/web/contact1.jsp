<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.lv.store.SupportRequestHandler" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Louis Vuitton Shopping Store - Customer Support</title>
    <link rel="stylesheet" type="text/css" href="Fcss/support.css">
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="header-content">
            <h1>Louis Vuitton Shopping Store - Customer Support</h1>
        </div>
    </header>

    <!-- Main Content Section -->
    <div class="container">
        <!-- Display error or success messages -->
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");

            if ("emptyFields".equals(error)) {
        %>
            <p style="color: red;">All fields are required. Please fill out the form completely.</p>
        <%
            } else if ("database".equals(error)) {
        %>
            <p style="color: red;">An error occurred while processing your request. Please try again later.</p>
        <%
            } else if ("true".equals(success)) {
        %>
            <p style="color: green;">Your support request has been submitted successfully!</p>
        <%
            }
        %>

        <p>If you have any questions or need assistance, please fill out the form below:</p>
        
        <!-- Form to submit contact details -->
        <form action="contact.jsp" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="a" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="b" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="c" rows="4" required></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>

        <%
            // Handle form submission
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                // Retrieve form data
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String message = request.getParameter("message");

                // Basic validation
                if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || message == null || message.trim().isEmpty()) {
                    response.sendRedirect("contact.jsp?error=emptyFields");
                    return;
                }

                // Process the data (save to a database)
                boolean successResult = SupportRequestHandler.saveSupportRequest(name, email, message);

                // Redirect based on success or failure
                if (successResult) {
                    response.sendRedirect("contact.jsp?success=true");
                } else {
                    response.sendRedirect("contact.jsp?error=database");
                }
            }
        %>
    </div>
</body>
</html>
