package com.model.dto;

public class Products {
	
	private int id;
	private String name;
	private String description;
	private double price;
	private String category;
	private byte[] image;
	
	
	public Products() {
		super();
	}
	public Products(String name, String description, double price, byte[] image) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
		
		this.image = image;
	}
	public Products(String name, String description, double price, String category, byte[] image) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = category;
		this.image = image;
	}
	public Products(int id, String name, String description, double price, String category, byte[] image) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.category = category;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	

}
