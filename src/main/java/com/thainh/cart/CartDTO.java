/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thainh.cart;

import com.thainh.book.BookDAO;
import com.thainh.book.BookDTO;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Windows
 */
public class CartDTO {

    private int customerId;
    private Map<BookDTO, Integer> items = new HashMap<>(); //1 book/amount

    public int getCustomerId() {
//        for(Map.Entry<BookDTO,Integer> item :items.entrySet()) {
//            item.getKey().getTitle();
//        }
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Map<BookDTO, Integer> getItems() {
        return items;
    }

    public void addItemToCart(int id) {
        BookDAO dao = new BookDAO();
        try {
            BookDTO dto = dao.searchId(id);
            if (items.containsKey(dto)) {
                items.replace(dto, items.get(dto) + 1);
            } else {
                items.put(dto, 1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDTO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CartDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeItemFromCart(int id) {
        BookDAO dao = new BookDAO();
        BookDTO dto;
        try {
            dto = dao.searchId(id);
            items.remove(dto);
        } catch (SQLException ex) {
            Logger.getLogger(CartDTO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CartDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
