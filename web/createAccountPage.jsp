<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Account</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/Fcss/createpage.css">
</head>
<body>
    <div class="form-container">
        <h2>Create Account</h2>
        <form action="loginpage2" method="post">
            <label for="username">User Name</label>
            <input type="text" id="username" name="c" placeholder="Enter your UserName" required>

            <label for="gmail">Gmail</label>
            <input type="email" id="gmail" name="e" placeholder="Enter your Gmail" required>

            <div class="password-field">
                <label for="password">Password</label>
                <input type="password" id="password" name="d" placeholder="Enter your password" required>
                <span class="toggle-password" onclick="togglePassword()">👁</span>
            </div>

            <br>
            <button type="submit">Submit</button>
        </form>
    </div>

    <script>
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.querySelector('.toggle-password');

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.textContent = '🙈'; // Change icon to indicate the password is visible
            } else {
                passwordField.type = 'password';
                toggleIcon.textContent = '👁'; // Change icon to indicate the password is hidden
            }
        }
    </script>
</body>
</html>
