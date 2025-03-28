package com.model.dto;

public class CartItem {
	
        private int id;
	    private String name;
	    private double price;
	    private String category;
	    private int quantity;
	    private byte[] image;
	    
	    
	    
	    
	    
	    
	   
		public CartItem(int id, String name, double price, String category, int quantity,byte[] image) {
			super();
			this.id = id;
			this.name = name;
			this.price = price;
			this.category = category;
			this.quantity = quantity;
			this.image=image;
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
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}

		public byte[] getImage() {
			return image;
		}
		public void setImage(byte[] image) {
			this.image = image;
		}
	   


}
