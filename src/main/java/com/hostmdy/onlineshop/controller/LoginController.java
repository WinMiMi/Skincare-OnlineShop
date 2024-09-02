package com.hostmdy.onlineshop.controller;

import java.io.IOException;

import javax.sql.DataSource;

import com.hostmdy.onlineshop.model.Mode;
import com.hostmdy.onlineshop.model.User;
import com.hostmdy.onlineshop.model.UserDAO;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Resource(name = "jdbc/skincare_onlineShop")
	private DataSource dataSource;
	
	private UserDAO userDAO;
	
	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO(dataSource);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String param = req.getParameter("mode");
		Mode mode = null;

		if (param == null) {
			mode = Mode.LOGIN_FORM;
		} else {
			mode = Mode.valueOf(param);
		}

		switch (mode) {
		case LOGIN_FORM:
			showloginForm(req, resp);
			break;			
		case LOGIN:
			Login(req,resp);
			break;
		case LOGOUT:
			Logout(req,resp);
			break;
		default:
			showloginForm(req, resp);
			break;
		}
	}
	
	private void Logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("login");
		//session.removeAttribute("user");		
		
	}

	private void Login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		boolean loginOk = userDAO.authenticate(username, password);
		if(loginOk) {
			User user = userDAO.getUserByUsernameOrEmail(username).get();
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("home");
		}else {
			req.setAttribute("loginOk", loginOk);
			showloginForm(req, resp);
		}
	}
//53
	private void showloginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/user/sign-in.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
