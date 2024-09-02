package com.hostmdy.onlineshop.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.onlineshop.model.Mode;
import com.hostmdy.onlineshop.model.User;
import com.hostmdy.onlineshop.model.UserDAO;


@WebServlet("/admin")
public class AdminController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	
	@Resource(name = "jdbc/skincare_onlineShop")
	private DataSource dataSource;
	
	private UserDAO userDAO;
	
	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO(dataSource);
	}
 
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String param = req.getParameter("mode");
		Mode mode = null;

		if (param == null) {
			mode = Mode.LIST;
		} else {
			mode = Mode.valueOf(param);
		}

		switch (mode) {
		case LIST:
			showUserList(req,resp);
			break;
		case ENABLE:
			enableUser(req,resp);
			break;
		case DISABLE:
			disableUser(req, resp);
			break;
		default:
			showUserList(req, resp);
			break;
		}
	}

	private void enableUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long userId = Long.parseLong(req.getParameter("userId"));
		boolean ok = userDAO.enableUser(userId);
		showUserList(req, resp);
		
	}
	
	private void disableUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long userId = Long.parseLong(req.getParameter("userId"));
		boolean ok = userDAO.disableUser(userId);
		showUserList(req, resp);
		
	}

	private void showUserList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> userList = userDAO.getAllUser();
		req.setAttribute("userList", userList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/dashboard.jsp");
		dispatcher.forward(req, resp);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
