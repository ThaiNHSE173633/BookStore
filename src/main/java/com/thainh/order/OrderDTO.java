/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thainh.order;

import java.io.Serializable;

/**
 *
 * @author Windows
 */
public class OrderDTO implements Serializable {

    private int id, customerId, total;
    private String customerName;
    private boolean isDone;

    public OrderDTO(int id, int customerId, int total, String customerName, boolean isDone) {
        this.id = id;
        this.customerId = customerId;
        this.total = total;
        this.customerName = customerName;
        this.isDone = isDone;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public boolean isIsDone() {
        return isDone;
    }

    public void setIsDone(boolean isDone) {
        this.isDone = isDone;
    }

}
