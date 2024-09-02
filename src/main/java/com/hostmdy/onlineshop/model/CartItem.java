package com.hostmdy.onlineshop.model;

public class CartItem {
    private long id;
    private long userId;
    private long itemId;
    private String image;
    private String brand;
    private int quantity;
    private double price;

    // Default constructor
    public CartItem() {}

    public CartItem(long userId, long itemId, String image, String brand, double price,int quantity) {
		super();
		this.userId = userId;
		this.itemId = itemId;
		this.image = image;
		this.brand = brand;
		this.price = price;
		this.quantity = quantity;
	}



	// Constructor for database results
    public CartItem(long id, long userId, long itemId, String image, String brand, double price,int quantity) {
        this.id = id;
        this.userId = userId;
        this.itemId = itemId;
        this.image = image;
        this.brand = brand;
        this.price = price;
		this.quantity = quantity;

    }

    // Getters and Setters
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long cartId) {
        this.userId = cartId;
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
    
    
}
