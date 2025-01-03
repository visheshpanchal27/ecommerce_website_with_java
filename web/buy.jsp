<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="Fcss/styles.css">
</head>
<body>
    <header>
        <h1>Checkout</h1>
    </header>

    <%
        // Retrieve the cart from the session
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        int total = 0;
        List<String> items = new ArrayList<>();

        if (cart != null && !cart.isEmpty()) {
            // Calculate total and gather item details
            for (Map<String, String> item : cart) {
                String product = item.get("product");
                String price = item.get("price");
                total += Integer.parseInt(price);
                items.add(product + " - $" + price); // Store item name and price in the list
            }

            // After checkout, remove the cart from session (indicating order is complete)
            session.removeAttribute("cart");

            // Pass the total and items to the confirmation page
            String[] itemArray = items.toArray(new String[0]);
            request.setAttribute("total", total);
            request.setAttribute("items", itemArray);

            // Redirect to confirmation page after order processing
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderConfirmation.jsp");
            dispatcher.forward(request, response);
        } else {
    %>
        <p>No items in your cart to checkout. Please <a href="store.jsp">go back</a> and add some products to your cart.</p>
    <%
        }
    %>
</body>
</html>
