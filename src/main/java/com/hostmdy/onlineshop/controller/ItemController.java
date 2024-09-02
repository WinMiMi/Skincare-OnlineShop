package com.hostmdy.onlineshop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.onlineshop.model.Item;
import com.hostmdy.onlineshop.model.ItemDAO;
import com.hostmdy.onlineshop.model.Mode;
import com.hostmdy.onlineshop.model.User;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/item")
@MultipartConfig
public class ItemController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private User user;

	@Resource(name = "jdbc/skincare_onlineShop")
	private DataSource dataSource;

	private ItemDAO itemDAO = null;

	@Override
	public void init() throws ServletException {
		itemDAO = new ItemDAO(dataSource);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		user = (User) session.getAttribute("user");

		String param = req.getParameter("mode");
		Mode mode = null;

		if (param == null) {
			mode = Mode.LIST;
		} else {
			mode = Mode.valueOf(param);
		}

		switch (mode) {
		case LIST:
			showAllList(req, resp);
			break;
		case SINGLE:
			showItem(req, resp);
			break;
		case ITEM_FORM:
			showNewItemForm(req, resp);
			break;
		case CREATE:
			createItem(req, resp);
			break;
		case LOAD:
			loadItem(req, resp);
			break;
		case UPDATE:
			updateItem(req, resp);
			break;
		case DELETE:
			deleteItem(req, resp);
			break;
		case SEARCH:
			searchItems(req, resp);
			break;
		default:
			showAllList(req, resp);
			break;
		}
		
	}

	private void searchItems(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query");
		List<Item> itemList = itemDAO.filterItem(query, user.getId());
		req.setAttribute("itemList", itemList);
		req.setAttribute("user", user);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/home.jsp");
		dispatcher.forward(req, resp);

	}

	// 1.40

	private void createItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String brand = req.getParameter("brand");
	    String category = req.getParameter("category");
	    Double price = Double.parseDouble(req.getParameter("price"));
	    Integer quantity = Integer.parseInt(req.getParameter("quantity"));
	    String description = req.getParameter("description");
	    
	    // Handle file upload
	    Part filePart = req.getPart("image"); // Retrieve the file part from the request
	    String imageName = getFileName(filePart); // Get the file name
	    String imagePath = saveFile(filePart, imageName); // Save the file and get the path

	    Item item = new Item(brand, category, price, quantity, description, imagePath, user.getId());

	    boolean insertOk = itemDAO.createItem(item);
	    req.setAttribute("insertOk", insertOk);
	    showNewItemForm(req, resp);
	}

	private String getFileName(Part filePart) {
	    String contentDisposition = filePart.getHeader("Content-Disposition");
	    for (String part : contentDisposition.split(";")) {
	        if (part.trim().startsWith("filename")) {
	            return part.substring(part.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}

	private String saveFile(Part filePart, String fileName) throws IOException {
	    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir();
	    }
	    File file = new File(uploadPath + File.separator + fileName);
	    try (InputStream input = filePart.getInputStream();
	         FileOutputStream output = new FileOutputStream(file)) {
	        byte[] buffer = new byte[1024];
	        int bytesRead;
	        while ((bytesRead = input.read(buffer)) != -1) {
	            output.write(buffer, 0, bytesRead);
	        }
	    }
	    return "uploads/" + fileName;
	}


	private void updateItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    Long id = Long.parseLong(req.getParameter("itemId"));
	    String brand = req.getParameter("brand");
	    String category = req.getParameter("category");
	    Double price = Double.parseDouble(req.getParameter("price"));
	    Integer quantity = Integer.parseInt(req.getParameter("quantity"));
	    String description = req.getParameter("description");

	    // Retrieve the existing image path
	    String existingImagePath = req.getParameter("existingImagePath");

	    // Handle file upload
	    Part filePart = req.getPart("image"); // Retrieve the file part from the request
	    String imagePath = existingImagePath; // Default to existing image path
	    
	    if (filePart != null && filePart.getSize() > 0) {
	        String fileName = getFileName(filePart); // Get the file name
	        imagePath = saveFile(filePart, fileName); // Save the file and get the new path
	    }

	    Item item = new Item(id, brand, category, price, quantity, description, imagePath);
	    boolean updateOk = itemDAO.updateItem(item);
	    if (updateOk) {
	        resp.sendRedirect("item?mode=SINGLE&itemId=" + id);
	    } else {
	        req.setAttribute("updateOk", false);
	        req.setAttribute("item", item);
	        RequestDispatcher dispatcher = req.getRequestDispatcher("template/item/update-item.jsp");
	        dispatcher.forward(req, resp);
	    }
	}


	private void showNewItemForm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("user", user);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/item/add-item.jsp");
		dispatcher.forward(req, resp);
	}

	private void showAllList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Item> itemList = itemDAO.getAllItems();
		req.setAttribute("itemList", itemList);
		req.setAttribute("user", user);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/home.jsp");
		dispatcher.forward(req, resp);
	}

	private void showItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long itemId = Long.parseLong(req.getParameter("itemId"));
		Item item = itemDAO.getItemById(itemId);
		req.setAttribute("item", item);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/item/item-details.jsp");
		dispatcher.forward(req, resp);

	}


	private void loadItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long itemId = Long.parseLong(req.getParameter("itemId"));
		Item item = itemDAO.getItemById(itemId);
		req.setAttribute("user", user);
		req.setAttribute("item", item);
		RequestDispatcher dispatcher = req.getRequestDispatcher("template/item/update-item.jsp");
		dispatcher.forward(req, resp);

	}

	private void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long itemId = Long.parseLong(req.getParameter("itemId"));
		boolean deleteOk = itemDAO.deleteItem(itemId);

		if (deleteOk) {
			resp.sendRedirect("item");
		} else {
			resp.sendRedirect("item?mode=SINGLE&itemId" + itemId);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
