<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String productToRemove = request.getParameter("product");
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart != null && productToRemove != null) {
        // Find the product in the cart and remove it
        cart.removeIf(item -> item.get("product").equals(productToRemove));
    }
    response.sendRedirect("cart.jsp");  // Redirect back to cart
%>
