package com.hostmdy.onlineshop.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.hostmdy.onlineshop.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order-confirmed")
public class OrderConfirmedController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	String mode = request.getParameter("mode");
        if ("ORDER_CONFIRM".equals(mode)) {
            // Retrieve form data including dynamically calculated values
            Long itemId = Long.valueOf(request.getParameter("itemId"));
            Long userId = Long.valueOf(request.getParameter("userId"));
            String itemBrand = request.getParameter("itemBrand");
            String itemCategory = request.getParameter("itemCategory");
            String itemPrice = request.getParameter("itemPrice");
            String quantity = request.getParameter("quantity");
            String totalCharges = request.getParameter("totalCharges");
            String deliveryFees = request.getParameter("deliveryFees");
            String userUsername = request.getParameter("userUsername");
            String userEmail = request.getParameter("userEmail");
            String userAddress = request.getParameter("userAddress");
            String itemDescription = request.getParameter("itemDescription");

            // Get the current date and time
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String orderDate = now.format(formatter);
            
            OrderItem orderItem = new OrderItem(itemId, userId, Double.valueOf(itemPrice), Integer.valueOf(quantity),
            Double.valueOf(totalCharges), Double.valueOf(deliveryFees), itemDescription, Timestamp.valueOf(orderDate));

            // Set the attributes for forwarding
            request.setAttribute("orderItem", orderItem);
            request.setAttribute("itemBrand", itemBrand);
            request.setAttribute("itemCategory", itemCategory);
            request.setAttribute("itemPrice", itemPrice);
            request.setAttribute("quantity", quantity);
            request.setAttribute("totalCharges", totalCharges);
            request.setAttribute("deliveryFees", deliveryFees);
            request.setAttribute("userUsername", userUsername);
            request.setAttribute("userEmail", userEmail);
            request.setAttribute("userAddress", userAddress);
            request.setAttribute("itemDescription", itemDescription);
            request.setAttribute("orderDate", orderDate);

            // Forward to order-confirmed.jsp
            request.getRequestDispatcher("template/item/order-confirmed.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
