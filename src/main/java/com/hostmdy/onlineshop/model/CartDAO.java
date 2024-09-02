package com.hostmdy.onlineshop.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class CartDAO {
    private DataSource dataSource;
    private Connection connection;
    private PreparedStatement pStmt;

    public CartDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }
    
    private void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean addCartItem(CartItem cartItem) {
    	boolean insertOk = false;
        try {
        	 connection = dataSource.getConnection();
        	 pStmt = connection.prepareStatement("insert into cart_item (userId, itemId, image, brand, price, quantity)"
        	 		+ " values (?, ?, ?, ?, ?, ?)");

            pStmt.setLong(1, cartItem.getUserId());  
            pStmt.setLong(2, cartItem.getItemId());
            pStmt.setString(3, cartItem.getImage());  
            pStmt.setString(4, cartItem.getBrand());
            pStmt.setDouble(5, cartItem.getPrice());
            pStmt.setInt(6, cartItem.getQuantity());

            int rowsAffected = pStmt.executeUpdate();
            if(rowsAffected > 0) {
            	insertOk = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return insertOk;
       
    }
    
    public boolean addOrUpdateCartItem(CartItem cartItem) {
        boolean success = false;
        try {
            connection = dataSource.getConnection();
            
            // Check if the item already exists in the cart
            pStmt = connection.prepareStatement("SELECT quantity FROM cart_item WHERE userId = ? AND itemId = ?");
            pStmt.setLong(1, cartItem.getUserId());
            pStmt.setLong(2, cartItem.getItemId());
            ResultSet rs = pStmt.executeQuery();
            
            if (rs.next()) {
                // If it exists, update the quantity
                int existingQuantity = rs.getInt("quantity");
                int newQuantity = existingQuantity + cartItem.getQuantity();
                
                pStmt = connection.prepareStatement("UPDATE cart_item SET quantity = ? WHERE userId = ? AND itemId = ?");
                pStmt.setInt(1, newQuantity);
                pStmt.setLong(2, cartItem.getUserId());
                pStmt.setLong(3, cartItem.getItemId());
            } else {
                // If it doesn't exist, insert a new item
                pStmt = connection.prepareStatement("INSERT INTO cart_item (userId, itemId, image, brand, price, quantity) VALUES (?, ?, ?, ?, ?, ?)");
                pStmt.setLong(1, cartItem.getUserId());
                pStmt.setLong(2, cartItem.getItemId());
                pStmt.setString(3, cartItem.getImage());
                pStmt.setString(4, cartItem.getBrand());
                pStmt.setDouble(5, cartItem.getPrice());
                pStmt.setInt(6, cartItem.getQuantity());
            }
            
            int rowsAffected = pStmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return success;
    }

    
    public List<CartItem> getCartItems(Long userId) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement("SELECT * FROM cart_item WHERE userId = ?");
            pStmt.setLong(1, userId);
            ResultSet rs = pStmt.executeQuery();
            
            while (rs.next()) {
                Long itemId = rs.getLong("itemId");
                String image = rs.getString("image");
                String brand = rs.getString("brand");
                Double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
                cartItems.add(new CartItem(userId, itemId, image, brand, price, quantity));
            }
        } finally {
            closeConnection();
        }
        return cartItems;
    }


    public boolean removeCartItem(Long userId, Long itemId) {
    	boolean deleteOk = false;
        try {
        	connection = dataSource.getConnection();
            pStmt = connection.prepareStatement("delete from cart_item where userId = ? and itemId = ?");

            pStmt.setLong(1, userId);
            pStmt.setLong(2, itemId);

            int rowsAffected = pStmt.executeUpdate();
            if(rowsAffected > 0) {
            	deleteOk = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
        	closeConnection();
        }
        return deleteOk;
    }
}