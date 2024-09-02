package com.hostmdy.onlineshop.controller;

import com.hostmdy.onlineshop.model.Item;
import com.hostmdy.onlineshop.model.ItemDAO;
import com.hostmdy.onlineshop.model.Mode;
import com.hostmdy.onlineshop.model.OrderItem;
import com.hostmdy.onlineshop.model.OrderItemDAO;
import com.hostmdy.onlineshop.model.User;
import com.hostmdy.onlineshop.model.UserDAO;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

@WebServlet("/order")
public class OrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/skincare_onlineShop")
    private DataSource dataSource;

    private ItemDAO itemDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {
        new UserDAO(dataSource);
        itemDAO = new ItemDAO(dataSource);
        orderItemDAO = new OrderItemDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        String param = req.getParameter("mode");
        Mode mode = (param == null) ? Mode.LIST : Mode.valueOf(param);

        switch (mode) {
            case ORDER_DETAILS:
                orderDetails(req, resp, user);
                break;   
            case ORDER_HISTORY:
                showOrderHistory(req, resp, user);
                break; 
            case ALL_ORDERS:
            	allOrder(req, resp,user);
            	break;
            default:
                orderDetails(req, resp, user);
                break;
        }
    }

	private void allOrder(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
	        List<OrderItem> orderItems = orderItemDAO.getAllOrderItems();
	        req.setAttribute("orderItems", orderItems);
	        req.getRequestDispatcher("template/user/all-orders.jsp").forward(req, resp);
	    } 

	private void showOrderHistory(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
		 HttpSession session = req.getSession(false);
	        if (session != null) {
	            user = (User) session.getAttribute("user");
	            if (user != null) {
	                List<OrderItem> orderItems = orderItemDAO.getOrderItemsByUserId(user.getId());
	                req.setAttribute("orderItems", orderItems);
	                req.getRequestDispatcher("template/user/order-history.jsp").forward(req, resp);
	            } else {
	                resp.sendRedirect("login.jsp"); 
	            }
	        } else {
	            resp.sendRedirect("login.jsp"); // Redirect to login if session is null
	        }
	}
    private void orderDetails(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String itemIdStr = req.getParameter("itemId");
        try {
            Long itemId = Long.parseLong(itemIdStr);
            Item item = itemDAO.getItemById(itemId);
            if (item == null) {
                resp.sendRedirect("home"); // Handle item not found
                return;
            }
            req.setAttribute("item", item);
            req.setAttribute("user", user);
            req.getRequestDispatcher("template/item/order-details.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid item ID format.");
            //req.getRequestDispatcher("template/item/order-details.jsp").forward(req, resp);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
