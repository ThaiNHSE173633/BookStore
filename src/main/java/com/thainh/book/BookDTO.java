/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thainh.book;

import java.io.Serializable;

/**
 *
 * @author Windows
 */
public class BookDTO implements Serializable {

    private int id, price, categoryId, inStock;
    private String title, imgPath, categoryName, author;

    public BookDTO(int id, int price, int categoryId, int inStock, String title, String imgPath, String categoryName) {
        this.id = id;
        this.price = price;
        this.categoryId = categoryId;
        this.inStock = inStock;
        this.title = title;
        this.imgPath = imgPath;
        this.categoryName = categoryName;
    }
    
    public BookDTO(int id, int price, int categoryId, int inStock, String title, String imgPath, String categoryName, String author) {
        this.id = id;
        this.price = price;
        this.categoryId = categoryId;
        this.inStock = inStock;
        this.title = title;
        this.imgPath = imgPath;
        this.categoryName = categoryName;
        this.author = author;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    @Override
    public boolean equals(Object obj) {
        return this.getId() == ((BookDTO) obj).getId(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + this.id;
        return hash;
    }

    public int getInStock() {
        return inStock;
    }

    public void setInStock(int inStock) {
        this.inStock = inStock;
    }

}
