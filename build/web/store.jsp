<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Louis Vuitton Shopping Store</title>
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="Fcss/home.css">
    <script src="js/menu.js" defer></script> <!-- Link to the JavaScript file -->
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="header-content">
            <h1>Louis Vuitton Shopping Store</h1>
            <div class="user-info">
                <%-- Check if the user is logged in --%>
                <%
                    String username = (String) session.getAttribute("username");
                    if (username != null) {  // User is logged in
                %>
                    <p>Welcome, <strong><%= username %></strong></p> <!-- Removed the exclamation mark -->
                    <a href="logout.jsp" class="login-button">Logout</a> <!-- Logout link -->
                <% 
                    } else {  // User is not logged in
                %>
                    <a href="login.jsp" class="login-button">Login</a> <!-- Login link -->
                <% 
                    }
                %>
            </div>
        </div>
    </header>

    <!-- Menu Section -->
    <div class="menu-container">
        <div class="menu-button">
            <!-- Replace with the path to your menu image -->
            <img src="img/menu.png" alt="Menu" style="width: 22px;height: 16px;">
            <span style="margin-left: 5px;">Menu</span>
        </div>
        <div class="dropdown">
            <%
                String[] menuItems = {"Home", "Cart", "Account INFO", "Customer Support"};
                String[] links = {"store.jsp", "cart.jsp", "account.jsp", "contact.jsp"};

                for (int i = 0; i < menuItems.length; i++) {
            %>
                <a href="<%= links[i] %>"><%= menuItems[i] %></a>
            <%
                }
            %>
        </div>
    </div>

    <!-- Products Section -->
    <h2 style="text-align: center;">Products</h2>
    <div class="products-container">
        <div class="product">
            <img src="img/bag.jpg" alt="Handbag">
            <h3>LV Handbag</h3>
            <p>Price: $1500</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Handbag">
                <input type="hidden" name="price" value="1500">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
        
        <div class="product">
            <img src="img/BoyBag.png" alt="Boy Bag">
            <h3>LV Boy Bag</h3>
            <p>Price: $1800</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Boy Bag">
                <input type="hidden" name="price" value="1800">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
        
        <div class="product">
            <img src="img/wallet.jpg" alt="Wallet">
            <h3>LV Wallet</h3>
            <p>Price: $800</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Wallet">
                <input type="hidden" name="price" value="800">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
        
        <div class="product">
            <img src="img/belt.png" alt="Belt">
            <h3>LV Belt</h3>
            <p>Price: $450</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Belt">
                <input type="hidden" name="price" value="450">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
        
        <div class="product">
            <img src="img/shoes.png" alt="Shoes">
            <h3>LV Shoes</h3>
            <p>Price: $1200</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Shoes">
                <input type="hidden" name="price" value="1200">
                <button type="submit">Add to Cart</button>
            </form>
        </div>

        <!-- New Products Added Below -->
        <div class="product">
            <img src="img/scarf.png" alt="Scarf">
            <h3>LV Scarf</h3>
            <p>Price: $350</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Scarf">
                <input type="hidden" name="price" value="350">
                <button type="submit">Add to Cart</button>
            </form>
        </div>

        <div class="product">
            <img src="img/parfume.png" alt="Perfume">
            <h3>LV Perfume</h3>
            <p>Price: $250</p>
            <form method="post" action="LVShoppingServlet">
                <input type="hidden" name="product" value="LV Perfume">
                <input type="hidden" name="price" value="250">
                <button type="submit">Add to Cart</button>
            </form>
        </div>
    </div>
</body>
</html>
