package com.hostmdy.onlineshop.model;

import java.sql.Timestamp;

public class OrderItem {
    private Long id;
    private Long itemId;
    private Long userId;
    private Double itemPrice;
    private Integer quantity;
    private Double totalCharges;
    private Double deliveryFees;
    private String itemDescription;
    private Timestamp orderDate;
    
    public OrderItem() {
	}

    public OrderItem(Long id, Long itemId, Long userId, Double itemPrice, Integer quantity, Double totalCharges,
                     Double deliveryFees, String itemDescription, Timestamp orderDate) {
        this.id = id;
        this.itemId = itemId;
        this.userId = userId;
        this.itemPrice = itemPrice;
        this.quantity = quantity;
        this.totalCharges = totalCharges;
        this.deliveryFees = deliveryFees;
        this.itemDescription = itemDescription;
        this.orderDate = orderDate;
    }
    
    

    public OrderItem(Long itemId, Long userId, Double itemPrice, Integer quantity, Double totalCharges,
			Double deliveryFees, String itemDescription, Timestamp orderDate) {
		super();
		this.itemId = itemId;
		this.userId = userId;
		this.itemPrice = itemPrice;
		this.quantity = quantity;
		this.totalCharges = totalCharges;
		this.deliveryFees = deliveryFees;
		this.itemDescription = itemDescription;
		this.orderDate = orderDate;
	}



	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(Double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotalCharges() {
        return totalCharges;
    }

    public void setTotalCharges(Double totalCharges) {
        this.totalCharges = totalCharges;
    }

    public Double getDeliveryFees() {
        return deliveryFees;
    }

    public void setDeliveryFees(Double deliveryFees) {
        this.deliveryFees = deliveryFees;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
}
