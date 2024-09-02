package com.hostmdy.onlineshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.hostmdy.onlineshop.model.CartDAO;
import com.hostmdy.onlineshop.model.CartItem;
import com.hostmdy.onlineshop.model.Mode;
import com.hostmdy.onlineshop.model.User;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Resource(name = "jdbc/skincare_onlineShop")
    private DataSource dataSource;
    
    private CartDAO cartDAO = null;
   
    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("login"); // Redirect to login if user is not logged in
            return;
        }

        String param = req.getParameter("mode");
        Mode mode = param != null ? Mode.valueOf(param) : Mode.ADD_TO_CART;

        switch (mode) {
            case ADD_TO_CART:
                addToCart(req, resp, user);
                break;
            case REMOVE_FROM_CART:
                removeFromCart(req, resp, user);
                break;
            default:
                addToCart(req, resp, user);
                break;
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        try {
            String itemIdStr = req.getParameter("itemId");
            String priceStr = req.getParameter("price");
            String quantityStr = req.getParameter("quantity");

            if (itemIdStr == null || priceStr == null || quantityStr == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
                return;
            }

            Long itemId = Long.parseLong(itemIdStr);
            String image = req.getParameter("image");
            String brand = req.getParameter("brand");
            Double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            CartItem newItem = new CartItem(user.getId(), itemId, image, brand, price, quantity);

            HttpSession session = req.getSession();
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

            if (cartItems == null) {
                cartItems = new ArrayList<>();
            }

            boolean itemExists = false;
            for (CartItem item : cartItems) {
                if (item.getItemId() == itemId) {  // Using '==' for primitive long comparison
                    item.setQuantity(item.getQuantity() + quantity);
                    cartDAO.addOrUpdateCartItem(item);  // Assuming you have an addOrUpdateCartItem method in DAO
                    itemExists = true;
                    break;
                }
            }
            
            if (!itemExists) {
                cartItems.add(newItem);
                cartDAO.addCartItem(newItem); // Add new item to DB
            }

            session.setAttribute("cartItems", cartItems);
            req.setAttribute("item", newItem);
            req.setAttribute("cartItems", cartItems);
            req.getRequestDispatcher("template/item/add-to-cart.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
        }
    }



    private void removeFromCart(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
    
            Long itemId = Long.parseLong(req.getParameter("itemId"));
            boolean deleteOk = cartDAO.removeCartItem(user.getId(), itemId);

            if (deleteOk) {
                resp.sendRedirect("item");
            } else {
                resp.sendRedirect("item?mode=SINGLE&itemId=" + itemId);
            }
 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
