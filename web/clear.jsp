<%-- 
    Document   : clear
    Created on : Dec 6, 2024, 9:42:11 AM
    Author     : hiral
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<%
    if (session != null) {
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Session Cleared</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f8f8f8;
        }
        h1 {
            color: #333;
        }
        a {
            font-size: 18px;
            text-decoration: none;
            color: #000;
            border: 2px solid #000;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: white;
        }
        a:hover {
            background-color: #000;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Your session has been cleared!</h1>
    <p>All session data has been removed.</p>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
