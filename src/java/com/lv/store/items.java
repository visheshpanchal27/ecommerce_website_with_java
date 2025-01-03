package com.lv.store;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/processOrder")
public class items extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Example items array
        String[] items = {"Item 1", "Item 2", "Item 3"};
        String total = "800";  // Example total price

        // Set the items and total as request attributes
        request.setAttribute("items", items);
        request.setAttribute("total", total);

        // Forward the request to the confirmation page (confirmation.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/confirmation.jsp");
        dispatcher.forward(request, response);
    }
}
