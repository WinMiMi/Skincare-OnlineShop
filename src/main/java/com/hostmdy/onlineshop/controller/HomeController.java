package com.hostmdy.onlineshop.controller;

import java.io.IOException;
import java.util.Optional;

import javax.sql.DataSource;

import com.hostmdy.onlineshop.model.User;
import com.hostmdy.onlineshop.model.UserDAO;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/skincare_onlineShop")
    private DataSource dataSource;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user details
        String username = (String) request.getSession().getAttribute("loggedInUser");

        if (username != null) {
            Optional<User> userOptional = userDAO.getUserByUsernameOrEmail(username);

            if (userOptional.isPresent()) {
                User user = userOptional.get();
                request.setAttribute("user", user);
            } else {
                request.setAttribute("error", "User not found");
            }
        } else {
            request.setAttribute("error", "User not logged in");
        }

        // Forward to home.jsp
        request.getRequestDispatcher("/template/item/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
