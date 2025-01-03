<!DOCTYPE html>
<html>
<head>
    <title>User Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;  /* Maintain text alignment in the container */
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .top-bar a {
            text-decoration: none;
            color: #007BFF;
            transition: color 0.3s;
        }
        .top-bar a:hover {
            color: #0056b3;
        }
        h1 {
            color: #333;
        }
        p {
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="top-bar">
            <a href="store.jsp">Home</a>
            <% if (session != null && session.getAttribute("username") != null) { %>
                <a href="logout.jsp">Logout</a>
            <% } %>
        </div>

        <h1>Welcome, User</h1>
        <% 
            if (session != null) {
                String username = (String) session.getAttribute("username");
                String email = (String) session.getAttribute("email");

                if (username != null) {
        %>
        <p><strong>Username:</strong> <%= username %></p>
        <p><strong>Email:</strong> <%= email != null ? email : "Not provided" %></p>
        <%
                } else {
        %>
        <p>You are not logged in. <a href="login.jsp">Login here</a>.</p>
        <%
                }
            } else {
        %>
        <p>Session expired or not found. <a href="login.jsp">Login again</a>.</p>
        <%
            }
        %>
    </div>
</body>
</html>
