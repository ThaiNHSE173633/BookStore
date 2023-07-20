/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thainh.book;

import com.thainh.db.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Windows
 */
public class BookDAO {

    private List<BookDTO> listBooks;

    public List<BookDTO> getListBooks() {
        return listBooks;
    }
    public BookDTO getBookById(int id){
        for(BookDTO item:listBooks){
            if(item.getId()==id)
                return item;
        }
        return null;
    }
    public void getAllBooks() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select b.*, c.name from Book b Left join BookCategory c on b.categoryId = c.id";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String title = rs.getString("title");
                    String imgPath = rs.getString("imgPath");
                    int price = rs.getInt("price");
                    int categoryId = rs.getInt("categoryId");
                    int inStock = rs.getInt("inStock");
                    String categoryName = rs.getString("name");
                    String author = rs.getString("author");

                    BookDTO dto = new BookDTO(id, price, categoryId, inStock, title, imgPath, categoryName, author);

                    if (this.listBooks == null) {
                        this.listBooks = new ArrayList<>();
                    }
                    this.listBooks.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean insertRecord(String title, String imgPath, int price, int inStock, int categoryId, String author) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Insert into Book(title, imgPath, price, inStock, categoryId, author) Values(?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, title);
                stm.setString(2, imgPath);
                stm.setInt(3, price);
                stm.setInt(4, inStock);
                stm.setInt(5, categoryId);
                stm.setString(6, author);
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

    public void searchTitle(String searchValue)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select b.*, c.name from Book b Left join BookCategory c on b.categoryId = c.id Where title Like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String title = rs.getString("title");
                    String imgPath = rs.getString("imgPath");
                    int price = rs.getInt("price");
                    int inStock = rs.getInt("inStock");
                    int categoryId = rs.getInt("categoryId");
                    String categoryName = rs.getString("name");
                    String author = rs.getString("author");

                    BookDTO dto = new BookDTO(id, price, categoryId, inStock, title, imgPath, categoryName, author);

                    if (this.listBooks == null) {
                        this.listBooks = new ArrayList<>();
                    }
                    this.listBooks.add(dto);
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


    public boolean deleteRecord(int id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Delete from Book Where id =?";
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
    public boolean updateRecord(int id, int price,int inStock, int categoryId) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "update Book set price=?, categoryId=?, inStock=? where id =?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, price);
                stm.setInt(2, categoryId);
                stm.setInt(3, inStock);
                stm.setInt(4, id);
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

    public boolean updateStock(int id, int inStock) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "update Book set inStock=? where id =?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, inStock);
                stm.setInt(2, id);
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
    public BookDTO searchId(int idSearch)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        BookDTO dto = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "Select b.*, c.name from Book b Left join BookCategory c on b.categoryId = c.id Where b.id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idSearch);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String title = rs.getString("title");
                    String imgPath = rs.getString("imgPath");
                    int price = rs.getInt("price");
                    int categoryId = rs.getInt("categoryId");
                    int inStock = rs.getInt("inStock");
                    String categoryName = rs.getString("name");

                    dto = new BookDTO(id, price, categoryId, inStock, title, imgPath, categoryName);
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
        return dto;
    }
}
