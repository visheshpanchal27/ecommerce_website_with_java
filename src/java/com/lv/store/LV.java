package com.lv.store;

import java.io.IOException;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LVShoppingServlet")
public class LV extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Sample product catalog
    private static final Map<String, Integer> PRODUCTS = new HashMap<>();
    static {
        PRODUCTS.put("LV Handbag", 1500);
        PRODUCTS.put("LV Wallet", 800);
        PRODUCTS.put("LV Belt", 450);
        PRODUCTS.put("LV Shoes", 1200);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve session
        HttpSession session = request.getSession();

        // Get the cart from the session
        @SuppressWarnings("unchecked")
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Get product details from the request
        String product = request.getParameter("product");
        String price = request.getParameter("price");

        // Add product to the cart if valid
        if (product != null && price != null) {
            Map<String, String> item = new HashMap<>();
            item.put("product", product);
            item.put("price", price);
            cart.add(item);
        }

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    }
}
