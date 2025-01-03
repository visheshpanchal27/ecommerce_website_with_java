<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve the cart from the session
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart != null) {
        String product = request.getParameter("product");
        String action = request.getParameter("action");

        for (Map<String, String> item : cart) {
            if (item.get("product").equals(product)) {
                String itemQuantity = item.get("quantity");
                int quantity = (itemQuantity != null && !itemQuantity.isEmpty()) ? Integer.parseInt(itemQuantity) : 1;

                if ("increase".equals(action)) {
                    quantity++;
                } else if ("decrease".equals(action) && quantity > 1) {
                    quantity--;
                }

                item.put("quantity", String.valueOf(quantity));
                break;
            }
        }

        // Update the cart in the session
        session.setAttribute("cart", cart);
    }

    // Redirect back to the cart page
    response.sendRedirect("cart.jsp");
%>
