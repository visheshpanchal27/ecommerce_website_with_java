package com.lv.store;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String price = request.getParameter("price");
        String productName = request.getParameter("productName");

        if (productId == null || price == null || productName == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid parameters.");
            return;
        }

        HttpSession session = request.getSession();
        List<Map<String, String>> cart = getCart(session);

        // Add the item to the cart if it doesn't already exist
        boolean itemFound = false;
        for (Map<String, String> item : cart) {
            if (item.get("productId").equals(productId)) {
                itemFound = true;
                break;
            }
        }
        if (!itemFound) {
            Map<String, String> item = new HashMap<>();
            item.put("productId", productId);
            item.put("productName", productName);
            item.put("price", price);
            item.put("quantity", "1");
            cart.add(item);
        }

        session.setAttribute("cart", cart);
        response.setContentType("text/plain");
        response.getWriter().write("success");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Map<String, String>> cart = getCart(session);

        StringBuilder cartHtml = new StringBuilder();
        int total = 0;

        for (Map<String, String> item : cart) {
            String productName = item.get("productName");
            int quantity = Integer.parseInt(item.get("quantity"));
            int price = Integer.parseInt(item.get("price"));
            total += price * quantity;

            cartHtml.append("<li>").append(productName).append(" - Quantity: ").append(quantity)
                    .append(" - $").append(price * quantity).append("</li>");
        }

        cartHtml.append("<h3>Total: $").append(total).append("</h3>");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.write(cartHtml.toString());
    }

    private List<Map<String, String>> getCart(HttpSession session) {
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
}
