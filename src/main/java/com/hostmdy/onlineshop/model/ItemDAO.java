package com.hostmdy.onlineshop.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class ItemDAO {
    private DataSource dataSource;
    private Connection connection;
    private Statement stmt;
    private PreparedStatement pStmt;
    private ResultSet rs;
    
    public ItemDAO(DataSource dataSource) {
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

    public List<Item> filterItem(String query, Long userId) {
        List<Item> filteredList = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery("select * from item where category='" + query + "' and userId='" + userId + "';");
            
            while (rs.next()) {
                Date issuedDate = rs.getDate("issuedDate");
                Date expiredDate = rs.getDate("expiredDate");

                filteredList.add(new Item(
                    rs.getLong("id"),
                    rs.getString("brand"),
                    rs.getString("category"),
                    rs.getDouble("price"),
                    rs.getDouble("subTotal"),
                    rs.getInt("quantity"),
                    issuedDate != null ? issuedDate.toLocalDate() : null,
                    expiredDate != null ? expiredDate.toLocalDate() : null,
                    rs.getString("description"),
                    rs.getString("image"),
                    rs.getLong("userId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return filteredList;
    }

    public Item getItemById(Long itemId) {
        Item item = null;
        try {
            connection = dataSource.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT * FROM item WHERE id='" + itemId + "';");
            
            if (rs.next()) {
                Date issuedDate = rs.getDate("issuedDate");
                Date expiredDate = rs.getDate("expiredDate");

                item = new Item(
                    rs.getLong("id"),
                    rs.getString("brand"),
                    rs.getString("category"),
                    rs.getDouble("price"),
                    rs.getDouble("subTotal"),
                    rs.getInt("quantity"),
                    issuedDate != null ? issuedDate.toLocalDate() : null,
                    expiredDate != null ? expiredDate.toLocalDate() : null,
                    rs.getString("description"),
                    rs.getString("image"),
                    rs.getLong("userId")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return item;
    }

    public List<Item> getAllItemsByUser(Long userId) {
        List<Item> itemList = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT * FROM item WHERE userId='" + userId + "';");
            
            while (rs.next()) {
                Date issuedDate = rs.getDate("issuedDate");
                Date expiredDate = rs.getDate("expiredDate");

                itemList.add(new Item(
                    rs.getLong("id"),
                    rs.getString("brand"),
                    rs.getString("category"),
                    rs.getDouble("price"),
                    rs.getDouble("subTotal"),
                    rs.getInt("quantity"),
                    issuedDate != null ? issuedDate.toLocalDate() : null,
                    expiredDate != null ? expiredDate.toLocalDate() : null,
                    rs.getString("description"),
                    rs.getString("image"),
                    rs.getLong("userId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return itemList;
    }

    public List<Item> getAllItems() {
        List<Item> itemList = new ArrayList<>();
        try {
            connection = dataSource.getConnection();
            stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT * FROM item");
            
            while (rs.next()) {
                Date issuedDate = rs.getDate("issuedDate");
                Date expiredDate = rs.getDate("expiredDate");

                itemList.add(new Item(
                    rs.getLong("id"),
                    rs.getString("brand"),
                    rs.getString("category"),
                    rs.getDouble("price"),
                    rs.getDouble("subTotal"),
                    rs.getInt("quantity"),
                    issuedDate != null ? issuedDate.toLocalDate() : null,
                    expiredDate != null ? expiredDate.toLocalDate() : null,
                    rs.getString("description"),
                    rs.getString("image"),
                    rs.getLong("userId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return itemList;
    }

    public boolean createItem(Item item) {
        boolean insertOk = false;
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement(
                "INSERT INTO item (brand, category, price, quantity, subTotal, issuedDate, expiredDate, description, image, userId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            pStmt.setString(1, item.getBrand());
            pStmt.setString(2, item.getCategory());
            pStmt.setDouble(3, item.getPrice());
            pStmt.setInt(4, item.getQuantity());
            pStmt.setDouble(5, item.getSubTotal());
            pStmt.setDate(6, item.getIssuedDate() != null ? Date.valueOf(item.getIssuedDate()) : null);
            pStmt.setDate(7, item.getExpiredDate() != null ? java.sql.Date.valueOf(item.getExpiredDate()) : null);
            pStmt.setString(8, item.getDescription());
            pStmt.setString(9, item.getImage());
            pStmt.setLong(10, item.getuserId());

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

    public boolean updateItem(Item item) {
        boolean updateOk = false;
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement(
                "update item set brand=?, category=?, price=?, quantity=?, description=?, image=? where id=?");

            pStmt.setString(1, item.getBrand());
            pStmt.setString(2, item.getCategory());
            pStmt.setDouble(3, item.getPrice());
            pStmt.setInt(4, item.getQuantity());
            pStmt.setString(5, item.getDescription());
            pStmt.setString(6, item.getImage());
            pStmt.setLong(7, item.getId());

            int rowsAffected = pStmt.executeUpdate();
            if (rowsAffected > 0) {
                updateOk = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return updateOk;
    }

    public boolean deleteItem(Long itemId) {
        boolean deleteOk = false;
        try {
            connection = dataSource.getConnection();
            pStmt = connection.prepareStatement("delete from item where id=?");      
            pStmt.setLong(1, itemId);

            int rowsAffected = pStmt.executeUpdate();
            if (rowsAffected > 0) {
                deleteOk = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return deleteOk;
    }
}
