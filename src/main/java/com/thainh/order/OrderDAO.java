/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thainh.order;

import com.thainh.book.BookDTO;
import com.thainh.db.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;

/**
 *
 * @author Windows
 */
public class OrderDAO {

    private List<OrderDTO> listOrders;

    public List<OrderDTO> getListOrders() {
        return listOrders;
    }

    public void getAllOrders() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select o.*,r.username From [Order] o Left join Registration r on o.CustomerId = r.id";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("Id");
                    int customerId = rs.getInt("CustomerId");
                    int total = rs.getInt("Total");
                    boolean isDone = rs.getBoolean("isDone");
                    String customerName = rs.getString("username");

                    OrderDTO dto = new OrderDTO(id, customerId, total, customerName, isDone);

                    if (this.listOrders == null) {
                        this.listOrders = new ArrayList<>();
                    }
                    this.listOrders.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    public void getAllOrdersByCustomer(int customerId) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select o.*,r.username From [Order] o Left join Registration r on o.CustomerId = r.id Where o.CustomerId = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, customerId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("Id");
                    int _customerId = rs.getInt("CustomerId");
                    int total = rs.getInt("Total");
                    boolean isDone = rs.getBoolean("isDone");
                    String customerName = rs.getString("username");

                    OrderDTO dto = new OrderDTO(id, _customerId, total, customerName, isDone);

                    if (this.listOrders == null) {
                        this.listOrders = new ArrayList<>();
                    }
                    this.listOrders.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public Map<BookDTO, Integer> getOrderDetails(int orderId) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Map<BookDTO, Integer> items = new HashMap<>();

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select o.Quantity,b.*,c.name From  [OrderDetails] o"
                        + " Left join Book b on o.BookId = b.id"
                        + " Left join BookCategory c on b.categoryId = c.id"
                        + " where o.orderId = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, orderId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String imgPath = rs.getString("imgPath");
                    int price = rs.getInt("price");
                    int categoryId = rs.getInt("categoryId");
                    int inStock = rs.getInt("inStock");
                    String categoryName = rs.getString("name");
                    int quantity = rs.getInt("Quantity");

                    BookDTO dto = new BookDTO(id, price, categoryId, inStock, title, imgPath, categoryName);
                    items.put(dto, quantity);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return items;
    }

    public boolean deleteRecord(int id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Delete from [OrderDetails] Where OrderId = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.executeUpdate();
                
                sql = "Delete from [Order] Where Id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateRecord(int id, int total, boolean isDone) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "update [Order] set Total=?,isDone=? where Id =?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, total);
                stm.setBoolean(2, isDone);
                stm.setInt(3, id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean insertRecord(int customerId, boolean isDone, Map<BookDTO, Integer> items) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                int total = 0;
                for (Map.Entry<BookDTO, Integer> item : items.entrySet()) {
                    total += item.getKey().getPrice()*item.getValue();
                }
                String sql = "Insert into [Order](CustomerId, Total, isDone) Values(?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, customerId);
                stm.setInt(2, total);
                stm.setBoolean(3, isDone);
                int row = stm.executeUpdate();
                if (row > 0) {
                    sql = "Select TOP 1 * From [Order] o ORDER BY Id DESC";
                    stm = con.prepareStatement(sql);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        int orderId = rs.getInt("id");
                        for (Map.Entry<BookDTO, Integer> item : items.entrySet()) {
                            insertDetails(orderId, item.getKey().getId(), item.getValue());
                        }
                        return true;
                    }
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean insertDetails(int orderId, int bookId, int quantity) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Insert into OrderDetails(OrderId, BookId, Quantity) Values(?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, orderId);
                stm.setInt(2, bookId);
                stm.setInt(3, quantity);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
