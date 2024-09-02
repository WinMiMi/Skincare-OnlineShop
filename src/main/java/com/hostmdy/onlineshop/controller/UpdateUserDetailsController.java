package com.hostmdy.onlineshop.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;
import javax.sql.DataSource;
import com.hostmdy.onlineshop.model.User;
import com.hostmdy.onlineshop.model.UserDAO;

@WebServlet("/update-user-details")
public class UpdateUserDetailsController extends HttpServlet {
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
        // Retrieve user ID from the request
        Long userId;
        try {
            userId = Long.parseLong(request.getParameter("userId"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid user ID.");
            request.getRequestDispatcher("template/user/update-user-details.jsp").forward(request, response);
            return;
        }

        // Retrieve existing user details from the database
        Optional<User> existingUserOptional = userDAO.getUserById(userId);
        if (existingUserOptional.isEmpty()) {
            request.setAttribute("error", "User not found.");
            request.getRequestDispatcher("template/user/update-user-details.jsp").forward(request, response);
            return;
        }

        // Set the retrieved user details as a request attribute
        User existingUser = existingUserOptional.get();
        request.setAttribute("user", existingUser);

        // Forward to the update user details JSP page to display the form
        request.getRequestDispatcher("template/user/update-user-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userId;
        try {
            userId = Long.parseLong(request.getParameter("userId"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid user ID.");
            request.getRequestDispatcher("template/user/update-user-details.jsp").forward(request, response);
            return;
        }

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Retrieve existing user details
        Optional<User> existingUserOptional = userDAO.getUserById(userId);
        if (existingUserOptional.isEmpty()) {
            request.setAttribute("error", "User not found.");
            request.getRequestDispatcher("template/user/update-user-details.jsp").forward(request, response);
            return;
        }
        
        // Create updated user object
        User user = new User(userId, firstname, lastname, username, email, address);
        boolean success = userDAO.updateUser(user);
        if (success) {
        	 response.sendRedirect("home"); // Redirect to home or success page
        } else {
        	request.setAttribute("success", false);
        	request.setAttribute("user", user);
            request.setAttribute("error", "Failed to update user details.");
            request.getRequestDispatcher("template/user/update-user-details.jsp").forward(request, response);
        }
    }

}
