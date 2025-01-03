<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Louis Vuitton Login</title>
    <link rel="stylesheet" type="text/css" href="Fcss/css.css">
</head>
<body>
    <div class="form-container">
        <form action="loginpage" method="post">
            <h2>Login</h2>

            <!-- Display error message if login fails -->
            <%
                String errorMessage = request.getParameter("error");
                if ("invalid".equals(errorMessage)) {
            %>
                <p class="error-message">Invalid username, email, or password. Please try again.</p>
            <%
                }
            %>

            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>

            <div class="input-group">
                <label for="email">Gmail Address</label>
                <input type="text" id="email" name="email" required placeholder="Gmail address">
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                <span class="toggle-password" onclick="togglePassword()">👁</span>
            </div>

            <button type="submit">Submit</button>
            <a href="createAccountPage.jsp" class="create-account-btn">Create Account</a>
        </form>
    </div>
</body>
</html>
