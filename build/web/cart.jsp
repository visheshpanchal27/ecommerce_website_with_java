<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" type="text/css" href="Fcss/cart1_1.css">
    <style>
        .home-btn { 
            position: absolute; 
            top: 20px; left: 20px; 
            padding: 10px 20px; 
            background-color: #007BFF; 
            color: white; 
            border: none; 
            font-size: 16px; 
            cursor: pointer; 
            text-decoration: none; 
            border-radius: 5px; 
            
        }
        .home-btn:hover {
            background-color: #007BFF;
            box-shadow: 0 8px 16px rgba(33, 150, 243, 0.6);
        }
    </style>
</head>
<body>

    <header>
        <a href="store.jsp" class="home-btn">Home</a>
        <h1>Your Cart</h1>
    </header>

    <%
        // Retrieve or initialize the cart
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        int total = 0;
    %>

    <div id="cart-container" class="cart-container">
        <%
            if (!cart.isEmpty()) { // Check if the cart has items
        %>
            <ul class="cart-items">
                <%
                    // Loop through each item in the cart
                    for (Map<String, String> item : cart) {
                        String itemProduct = item.get("product");
                        String itemPrice = item.get("price");
                        String itemQuantity = item.get("quantity");

                        // Set default quantity to 1 if it's null or empty
                        if (itemQuantity == null || itemQuantity.isEmpty()) {
                            itemQuantity = "1"; // Default to 1 if quantity is missing
                        }

                        // Validate item details
                        if (itemPrice != null && !itemPrice.isEmpty() && itemQuantity != null && !itemQuantity.isEmpty()) {
                            try {
                                int price = Integer.parseInt(itemPrice);
                                int quantity = Integer.parseInt(itemQuantity);

                                total += price * quantity;  // Correctly add the total
                %>
                                <li class="cart-item">
                                    <%= itemProduct %> - $<%= itemPrice %> x <%= itemQuantity %>
                                    <!-- Remove item form -->
                                    <form method="post" action="removeItem.jsp" style="display:inline;">
                                        <input type="hidden" name="product" value="<%= itemProduct %>">
                                        <button type="submit" class="remove-btn">Remove</button>
                                    </form>
                                    <!-- Increase quantity button -->
                                    <form method="post" action="updateQuantity.jsp" style="display:inline;">
                                        <input type="hidden" name="product" value="<%= itemProduct %>">
                                        <input type="hidden" name="action" value="increase">
                                        <button type="submit" class="increase-btn">+</button>
                                    </form>
                                    <!-- Decrease quantity button -->
                                    <form method="post" action="updateQuantity.jsp" style="display:inline;">
                                        <input type="hidden" name="product" value="<%= itemProduct %>">
                                        <input type="hidden" name="action" value="decrease">
                                        <button type="submit" class="decrease-btn">-</button>
                                    </form>
                                </li>

                <%
                            } catch (NumberFormatException e) {
                                out.println("<p>Error parsing price or quantity for item: " + itemProduct + "</p>");
                            }
                        } else {
                            out.println("<p>Missing price or quantity for item: " + itemProduct + "</p>");
                        }
                    }
                %>
            </ul>
            
            <div class="continue-shopping-link-container">
                <a href="store.jsp" class="continue-shopping-link">Continue Shopping</a>
            </div>

            
            <p>Total: $<%= total %></p> <!-- Display total -->
            <!-- Buy now form -->
            <form method="post" action="checkout.jsp">
                <input type="hidden" name="total" value="<%= total %>">
                <button type="submit" class="buy-now-btn">Buy Now</button>
            </form>
        <%
            } else { // If cart is empty
        %>
            <p>Your cart is empty!</p>
        <%
            }
        %>
        <br>
        <!-- Clear cart form -->
        <form method="post" action="clear.jsp">
            <button type="submit" class="clear-cart-btn">Clear Cart</button>
        </form>
        
        <!-- Continue shopping link -->
        
    </div>
</body>
</html>
