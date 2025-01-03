<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Louis Vuitton - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('<%= request.getContextPath() %>/img/LV.jpg');
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 50px;
        }
        .container {
            text-align: center;
            margin-top: -350px;
        }
        .link, .form-button {
            font-size: 18px;
            color: #414141;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #414141;
            border-radius: 5px;
            background-color: white;
            cursor: pointer;
        }
        .link:hover, .form-button:hover {
            background-color: #414141;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Link to store -->
        <a href="store.jsp" class="link">View Products</a>


        <form action="store.jsp" method="get" style="margin-top: 20px;">
            <input type="hidden" name="category" value="all">
            
        </form>
    </div>
</body>
</html>
