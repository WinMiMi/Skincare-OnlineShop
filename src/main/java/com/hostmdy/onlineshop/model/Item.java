package com.hostmdy.onlineshop.model;

import java.time.LocalDate;


public class Item {

	private Long id;
	private String brand;
	private String category;
	private Double price;
	private Double subTotal;
	private Integer quantity;
	private LocalDate issuedDate;
	private LocalDate expiredDate;
	private String description;
	private String image;
	private Long userId;

	public Item() {
	}

	// insert
	public Item(String brand, String category, Double price, Integer quantity, String description, String image,
			Long userId) {
		super();
		this.brand = brand;
		this.category = category;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
		this.image = image;
		this.userId = userId;
		this.subTotal = price * quantity.doubleValue();
		this.issuedDate = LocalDate.now();

	}

	// update
	public Item(Long id, String brand, String category, Double price, Integer quantity, String description,
			String image) {
		super();
		this.id = id;
		this.brand = brand;
		this.category = category;
		this.price = price;
		this.subTotal = price * quantity;
		this.quantity = quantity;
		this.description = description;
		this.image = image;

	}

	public Item(Long id, String brand, String category, Double price, Double subTotal, Integer quantity,
			LocalDate issuedDate, LocalDate expiredDate, String description, String image, Long userId) {
		super();
		this.id = id;
		this.brand = brand;
		this.category = category;
		this.price = price;
		this.subTotal = subTotal;
		this.quantity = quantity;
		this.issuedDate = issuedDate;
		this.expiredDate = expiredDate;
		this.description = description;
		this.image = image;
		this.userId = userId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public LocalDate getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(LocalDate issuedDate) {
		this.issuedDate = issuedDate;
	}

	public LocalDate getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(LocalDate expiredDate) {
		this.expiredDate = expiredDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Long getuserId() {
		return userId;
	}

	public void setuserId(Long userId) {
		this.userId = userId;
	}



	@Override
	public String toString() {
		return "Item [id=" + id + ", brand=" + brand + ", category=" + category + ", price=" + price + ", subTotal="
				+ subTotal + ", quantity=" + quantity + ", issuedDate=" + issuedDate + ", expiredDate=" + expiredDate
				+ ", description=" + description + ", image=" + image + ", userId=" + userId + "]";
	}



}
