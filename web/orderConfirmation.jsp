<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" type="text/css" href="Fcss/order.css">
</head>
<body>
    <header>
        <h1>Order Confirmation</h1>
    </header>

    <%
        // Retrieve total and items from the request
        String totalStr = request.getParameter("total");
        String itemsStr = request.getParameter("items");
        int total = 0;
        String[] items = null;

        try {
            if (totalStr != null) {
                total = Integer.parseInt(totalStr);
            }
            if (itemsStr != null) {
                items = itemsStr.split(",");
            }
        } catch (NumberFormatException e) {
            out.println("<p>Error processing order details. Please try again.</p>");
        }

        if (total > 0 && items != null && items.length > 0) {
    %>
            <h2>Your order has been processed successfully!</h2>
            <p>Total Amount: $<%= total %></p>
            <h3>Items Ordered:</h3>
            <ul>
                <%
                    for (String item : items) {
                %>
                    <li><%= item %></li>
                <%
                    }
                %>
            </ul>
            <p>Thank you for your purchase!</p>

            <!-- Home Button -->
            <a href="store.jsp" class="home-button">Go to Home</a>

    <%
        } else {
    %>
            <h2>Error processing your order. Please try again.</h2>
            <p><a href="store.jsp">Return to Store</a></p>
    <%
        }
    %>
</body>
</html>
