<%@ page import="com.myapp.models.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
</head>
<body>
    <h1>Our Products</h1>

    <!-- Form for adding a new product -->
    <h2>Add New Product</h2>
    <form action="AddProductServlet" method="POST">
        <label for="name">Product Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="description">Description:</label><br>
        <textarea id="description" name="description" required></textarea><br><br>

        <label for="price">Price:</label><br>
        <input type="number" id="price" name="price" step="0.01" required><br><br>

        <label for="imageUrl">Image URL:</label><br>
        <input type="text" id="imageUrl" name="imageUrl"><br><br>

        <input type="submit" value="Add Product">
    </form>

    <!-- Display existing products -->
    <div class="products">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <div class="product">
                <h2><%= product.getName() %></h2>
                <p><%= product.getDescription() %></p>
                <p>Price: $<%= product.getPrice() %></p>
                <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
            </div>
        <%
                }
            } else {
        %>
            <p>No products available.</p>
        <%
            }
        %>
    </div>
</body>
</html>
