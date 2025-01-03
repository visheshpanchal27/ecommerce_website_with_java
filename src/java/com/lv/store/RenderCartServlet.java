package com.lv.store;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class RenderCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Shopping Cart</title>");
            out.println("<script>");
            out.println("function validatePhoneNumber() {");
            out.println("    var phoneNumber = document.getElementById('phone').value;");
            out.println("    if (phoneNumber.length !== 10 || !/^[0-9]+$/.test(phoneNumber)) {");
            out.println("        alert('Please enter a 10-digit phone number.');");
            out.println("        return false;");
            out.println("    }");
            out.println("    return true;");
            out.println("}");
            out.println("</script>");
            out.println("</head>");
            out.println("<body>");

            if (cart != null && !cart.isEmpty()) {
                int total = 0;
                out.println("<h1>Your Cart</h1>");
                out.println("<ul>");
                for (Map<String, String> item : cart) {
                    String productName = item.get("productName");
                    int quantity = Integer.parseInt(item.get("quantity"));
                    int price = Integer.parseInt(item.get("price"));
                    total += price * quantity;

                    out.println("<li>" + escapeHtml(productName) + " - Quantity: " + quantity + " - $"
                            + (price * quantity) + "</li>");
                }
                out.println("</ul>");
                out.println("<p>Total: $" + total + "</p>");
                out.println("<form method='post' action='checkout.jsp' onsubmit='return validatePhoneNumber();'>");
                out.println("Phone Number: <input type='text' id='phone' name='phone' />");
                out.println("<br/><input type='submit' value='Checkout' />");
                out.println("</form>");
            } else {
                out.println("<p>Your cart is empty.</p>");
            }

            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // Simple HTML escape method
    private String escapeHtml(String input) {
        if (input == null) {
            return "";
        }
        return input.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
}
