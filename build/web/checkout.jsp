<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="Fcss/styles.css">

    <!-- JavaScript Validation for 10-digit Phone Number -->
    <script type="text/javascript">
        function validatePhoneNumber() {
            var phoneNumber = document.getElementById("phone").value;

            // Check if the phone number is exactly 10 digits long
            if (phoneNumber.length !== 10 || isNaN(phoneNumber)) {
                alert("Phone number must be exactly 10 digits.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }
    </script>
</head>
<body>
    <header>
        <h1>Checkout</h1>
        <div class="header-right">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
                <p>Welcome, <strong><%= username %></strong>!</p>
                <a href="logout.jsp" class="login-button">Logout</a>
            <%
                } else {
            %>
                <a href="login.jsp" class="login-button">Login</a>
            <%
                }
            %>
        </div>
    </header>

    <h2>Your Cart</h2>
    <div id="cart-container" style="max-height: 300px; overflow-y: auto; border: 1px solid #ddd; padding: 10px;">
        <%
            List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
            int total = 0;

            if (cart != null && !cart.isEmpty()) {
                out.println("<pre>Cart Data: " + cart + "</pre>");
        %>
            <ul>
                <% 
                    for (Map<String, String> item : cart) {
                        String productName = item.get("product");
                        String quantityStr = item.get("quantity");
                        String priceStr = item.get("price");
                        int quantity = 1; // Default quantity
                        int price = 0; // Default price

                        try {
                            if (quantityStr != null && !quantityStr.isEmpty()) {
                                quantity = Integer.parseInt(quantityStr);
                            }
                            if (priceStr != null && !priceStr.isEmpty()) {
                                price = Integer.parseInt(priceStr);
                            }
                        } catch (NumberFormatException e) {
                            out.println("<p>Error parsing quantity or price for product: " + productName + "</p>");
                        }

                        total += price * quantity;
                %>
                    <li><%= productName != null ? productName : "Unknown Product" %> - 
                        Quantity: <%= quantity %> - 
                        $<%= price * quantity %>
                    </li>
                <% 
                    }
                %>
            </ul>
            <h3>Total: $<%= total %></h3>
            <%
                // Check if the user is logged in before displaying the form
                if (username != null) {
            %>
                <form method="post" action="orderConfirmation.jsp" onsubmit="return validatePhoneNumber()">
                    <input type="hidden" name="total" value="<%= total %>">
                    <input type="hidden" name="items" value="<%= cart.stream().map(item -> item.get("product")).collect(Collectors.joining(",")) %>">
                    <h3>Shipping Details</h3>
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" required><br><br>

                    <label for="phone">Phone Number:</label>
                    <input type="text" id="phone" name="phone" required><br><br>

                    <button type="submit" class="checkout-button">Confirm Order</button>
                </form>
            <%
                } else {
            %>
                <p>You must <a href="login.jsp">login</a> to confirm your order.</p>
            <%
                }
            %>
        <%
            } else {
        %>
            <p>Your cart is empty!</p>
        <%
            }
        %>
    </div>
</body>
</html>
