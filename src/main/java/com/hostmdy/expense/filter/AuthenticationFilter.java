package com.hostmdy.expense.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hostmdy.onlineshop.model.User;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
public class AuthenticationFilter extends HttpFilter implements Filter {
    private static final long serialVersionUID = -8217925221417030726L;

    /**
     * @see HttpFilter#HttpFilter()
     */
    public AuthenticationFilter() {
        super();
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // Cleanup code, if needed
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); // Use false to avoid creating a new session if one does not exist
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        String requestURI = req.getRequestURI();

        // Allow access to public pages (product listing, home, etc.)
        if (requestURI.contains("item") || requestURI.contains("home") || requestURI.contains("login") || requestURI.contains("user")) {
            chain.doFilter(request, response);
            return;
        }

        // Enforce login for purchasing or other restricted pages
        if (user == null && (requestURI.contains("cart") || requestURI.contains("checkout") || requestURI.contains("order"))) {
            resp.sendRedirect(req.getContextPath() + "/login?redirect=" + req.getRequestURI());
            return;
        }

        // Proceed with filter chain for authenticated users
        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // Initialization code, if needed
    }
}
