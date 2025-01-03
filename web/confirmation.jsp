<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" type="text/css" href="Fcss/styles.css">
</head>
<body>
    <header>
        <h1>Order Confirmation</h1>
    </header>
    <div class="confirmation-container">
        <%
            // Retrieve the total price and items from the request
            String total = (String) request.getAttribute("total");
            String[] items = (String[]) request.getAttribute("items");

            if (total != null && items != null) {
        %>
            <p>Thank you for your purchase! Your total is: $<%= total %>.</p>
            
            <h3>Your Purchased Items:</h3>
            <ul>
                <% 
                    // Loop through the items array and display each item
                    for (String item : items) {
                %>
                    <li><%= item %></li>
                <% 
                    }
                %>
            </ul>
            
            <a href="store.jsp" class="continue-shopping-link">Return to Store</a>
        <%
            } else {
        %>
            <p>Error processing your order. Please try again.</p>
        <%
            }
        %>
    </div>
</body>
</html>
