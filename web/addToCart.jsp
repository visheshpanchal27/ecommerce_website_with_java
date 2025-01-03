<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String product = request.getParameter("product");
    String price = request.getParameter("price");

    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // Add the product to the cart
    Map<String, String> item = new HashMap<>();
    item.put("product", product);
    item.put("price", price);
    cart.add(item);

    response.sendRedirect("store.jsp");  // Redirect to store page after adding to cart
%>
