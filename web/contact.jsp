<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Louis Vuitton Shopping Store - Contact</title>
    <link rel="stylesheet" type="text/css" href="Fcss/support.css">
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="header-content">
            <h1>Louis Vuitton Shopping Store - Contact Us</h1>
        </div>
    </header>
    <div class="container">
        <p>If you have any questions or need assistance, please fill out the form below:</p>
        <!-- Updated form -->
        <form action="store.jsp" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" required></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
3
