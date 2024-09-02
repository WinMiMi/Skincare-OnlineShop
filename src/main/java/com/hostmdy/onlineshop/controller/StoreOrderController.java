package com.hostmdy.onlineshop.controller;

import com.hostmdy.onlineshop.model.OrderItem;
import com.hostmdy.onlineshop.model.OrderItemDAO;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.sql.DataSource;

@WebServlet("/store")
public class StoreOrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderItemDAO orderItemDAO;

    @Resource(name = "jdbc/skincare_onlineShop")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        orderItemDAO = new OrderItemDAO(dataSource);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve parameters
            String itemIdParam = req.getParameter("itemId");
            String userIdParam = req.getParameter("userId");
            String itemPriceParam = req.getParameter("itemPrice");
            String quantityParam = req.getParameter("quantity");
            String totalChargesParam = req.getParameter("totalCharges");
            String deliveryFeesParam = req.getParameter("deliveryFees");
            String itemDescription = req.getParameter("itemDescription");

            if (itemIdParam == null || userIdParam == null || itemPriceParam == null ||
                quantityParam == null || totalChargesParam == null || deliveryFeesParam == null) {
                throw new IllegalArgumentException("One or more required parameters are missing.");
            }

            long itemId = Long.parseLong(itemIdParam);
            long userId = Long.parseLong(userIdParam);
            double itemPrice = Double.parseDouble(itemPriceParam);
            int quantity = Integer.parseInt(quantityParam);
            double totalCharges = Double.parseDouble(totalChargesParam);
            double deliveryFees = Double.parseDouble(deliveryFeesParam);
            Timestamp orderDate = Timestamp.valueOf(LocalDateTime.now());

            // Create OrderItem object
            OrderItem orderItem = new OrderItem(itemId, userId, itemPrice, quantity, totalCharges, deliveryFees, itemDescription, orderDate);

            // Store OrderItem in database
            boolean isStored = orderItemDAO.createOrderItem(orderItem);

            if (isStored) {
                resp.sendRedirect("item"); // Redirect to home page
            } else {
                req.setAttribute("errorMessage", "Failed to store the order.");
                req.getRequestDispatcher("template/item/item.jsp").forward(req, resp);
            }

        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid input format.");
            req.getRequestDispatcher("template/item/item.jsp").forward(req, resp);
        } catch (IllegalArgumentException e) {
            req.setAttribute("errorMessage", e.getMessage());
            req.getRequestDispatcher("template/item/item.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            req.getRequestDispatcher("template/item/item.jsp").forward(req, resp);
        }
    }
}
