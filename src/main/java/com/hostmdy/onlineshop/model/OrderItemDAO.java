package com.hostmdy.onlineshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class OrderItemDAO {
    private DataSource dataSource;
    private Connection connection;
    private Statement stmt;
    private PreparedStatement pStmt;
    private ResultSet rs;

    
    public OrderItemDAO(DataSource dataSource) {
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
 

    public boolean createOrderItem(OrderItem orderItem) {
        boolean insertOk = false;
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement(
                "insert into order_items (itemId, userId, itemPrice, quantity, totalCharges, deliveryFees, itemDescription, orderDate) "
                + "values (?, ?, ?, ?, ?, ?, ?, ?)");

            pStmt.setLong(1, orderItem.getItemId());
            pStmt.setLong(2, orderItem.getUserId());
            pStmt.setDouble(3, orderItem.getItemPrice());
            pStmt.setInt(4, orderItem.getQuantity());
            pStmt.setDouble(5, orderItem.getTotalCharges());
            pStmt.setDouble(6, orderItem.getDeliveryFees());
            pStmt.setString(7, orderItem.getItemDescription());
            pStmt.setTimestamp(8, orderItem.getOrderDate());

            int rowsAffected = pStmt.executeUpdate();
            if (rowsAffected > 0) {
                insertOk = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return insertOk;
    }
    
    public Item getItemById(Long itemId) {
        Item item = null;
        String query = "SELECT * FROM item WHERE id = ?";
        try {
            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, itemId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                item = new Item(
                    resultSet.getLong("id"),
                    resultSet.getString("brand"),
                    resultSet.getString("category"),
                    resultSet.getDouble("price"),
                    resultSet.getDouble("subTotal"),
                    resultSet.getInt("quantity"),
                    resultSet.getDate("issuedDate").toLocalDate(),
                    resultSet.getDate("expiredDate").toLocalDate(),
                    resultSet.getString("description"),
                    resultSet.getString("image"),
                    resultSet.getLong("userId")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return item;
    }

    public User getUserById(Long userId) {
        User user = null;
        String query = "SELECT * FROM user WHERE id = ?";
        try {
            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User(
                    resultSet.getLong("id"),
                    resultSet.getString("firstname"),
                    resultSet.getString("lastname"),
                    resultSet.getString("username"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("address"),
                    resultSet.getBoolean("enable"),
                    resultSet.getString("role"),
                    resultSet.getTimestamp("createdAt").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return user;
    }


    public OrderItem getOrderItemById(Long orderId) {
        OrderItem orderItem = null;
        try {
            connection = dataSource.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery("select * from order_items where id='" + orderId + "';");

            if (rs.next()) {
                orderItem = new OrderItem(
                    rs.getLong("id"),
                    rs.getLong("itemId"),
                    rs.getLong("userId"),
                    rs.getDouble("itemPrice"),
                    rs.getInt("quantity"),
                    rs.getDouble("totalCharges"),
                    rs.getDouble("deliveryFees"),
                    rs.getString("itemDescription"),
                    rs.getTimestamp("orderDate")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return orderItem;
    }
    
    public List<OrderItem> getOrderItemsByUserId(Long userId) {
        List<OrderItem> orderItemList = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement("select * from order_items where userId=?");
            pStmt.setLong(1, userId);
            rs = pStmt.executeQuery();

            while (rs.next()) {
                orderItemList.add(new OrderItem(
                    rs.getLong("id"),
                    rs.getLong("itemId"),
                    rs.getLong("userId"),
                    rs.getDouble("itemPrice"),
                    rs.getInt("quantity"),
                    rs.getDouble("totalCharges"),
                    rs.getDouble("deliveryFees"),
                    rs.getString("itemDescription"),
                    rs.getTimestamp("orderDate")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return orderItemList;
    }

    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> orderItemList = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery("select * from order_items");

            while (rs.next()) {
                orderItemList.add(new OrderItem(
                    rs.getLong("id"),
                    rs.getLong("itemId"),
                    rs.getLong("userId"),
                    rs.getDouble("itemPrice"),
                    rs.getInt("quantity"),
                    rs.getDouble("totalCharges"),
                    rs.getDouble("deliveryFees"),
                    rs.getString("itemDescription"),
                    rs.getTimestamp("orderDate")
                ));
            }
            System.out.println("Retrieved " + orderItemList.size() + " order items.");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return orderItemList;
    }
    
    

//    public boolean updateOrderItem(OrderItem orderItem) {
//        boolean updateOk = false;
//        try {
//            connection = dataSource.getConnection();
//            pStmt = connection.prepareStatement(
//                "update order_items set itemId=?, userId=?, itemPrice=?, quantity=?, totalCharges=?, deliveryFees=?, itemDescription=?, orderDate=? WHERE id=?");
//
//            pStmt.setLong(1, orderItem.getItemId());
//            pStmt.setLong(2, orderItem.getUserId());
//            pStmt.setDouble(3, orderItem.getItemPrice());
//            pStmt.setInt(4, orderItem.getQuantity());
//            pStmt.setDouble(5, orderItem.getTotalCharges());
//            pStmt.setDouble(6, orderItem.getDeliveryFees());
//            pStmt.setString(7, orderItem.getItemDescription());
//            pStmt.setTimestamp(8, orderItem.getOrderDate());
//            pStmt.setLong(9, orderItem.getId());
//
//            int rowsAffected = pStmt.executeUpdate();
//            if (rowsAffected > 0) {
//                updateOk = true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            closeConnection();
//        }
//        return updateOk;
//    }
//
//    public boolean deleteOrderItem(Long orderId) {
//        boolean deleteOk = false;
//        try {
//            connection = dataSource.getConnection();
//            pStmt = connection.prepareStatement("delete from order_items where id=?");
//            pStmt.setLong(1, orderId);
//
//            int rowsAffected = pStmt.executeUpdate();
//            if (rowsAffected > 0) {
//                deleteOk = true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            closeConnection();
//        }
//        return deleteOk;
//    }
//
//	public boolean storeOrder(OrderItem orderItem) {
//		// TODO Auto-generated method stub
//		return false;
//	}
}
